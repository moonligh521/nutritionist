package com.moonligh.nutritionist.service;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.math.BigDecimal;
import java.time.Instant;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.moonligh.consult.framework.BusinessException;
import com.moonligh.consult.framework.ErrorCode;
import com.moonligh.nutritionist.api.req.CreatePantryItemReq;
import com.moonligh.nutritionist.infrastructure.identity.FakePatientGateway;
import com.moonligh.nutritionist.infrastructure.persistence.InMemoryPatientBindingStore;

class PantryServiceTest {

    private PantryService service;

    @BeforeEach
    void setUp() {
        FakePatientGateway gateway = new FakePatientGateway();
        gateway.put("acc-1", "pat-1", "pv1");
        InMemoryPatientBindingStore bindings = new InMemoryPatientBindingStore();
        PatientBindingService bindingService = new PatientBindingService(bindings, gateway);
        bindingService.bind("acc-1", "pat-1", "pv1");
        service = new PantryService(bindingService);
    }

    @Test
    void exposesOnHandMinusReservedAsAvailableQuantity() {
        var item = service.create("acc-1", request("10"));
        service.reserve("plan-v1", List.of(new PantryService.ReservationRequest(item.lotId(), new BigDecimal("3"))));

        var snapshot = service.snapshot("acc-1", "pat-1");

        assertEquals(new BigDecimal("7"), snapshot.items().getFirst().availableQuantity());
    }

    @Test
    void onlyOneConcurrentReservationWins() throws Exception {
        var item = service.create("acc-1", request("10"));
        CountDownLatch start = new CountDownLatch(1);
        try (ExecutorService pool = Executors.newFixedThreadPool(2)) {
            Future<Boolean> first = pool.submit(() -> reserveAfter(start, item.lotId(), "plan-a"));
            Future<Boolean> second = pool.submit(() -> reserveAfter(start, item.lotId(), "plan-b"));
            start.countDown();

            assertEquals(1, List.of(first.get(), second.get()).stream().filter(Boolean::booleanValue).count());
        }
    }

    @Test
    void rejectsStalePantryVersion() {
        service.create("acc-1", request("10"));

        BusinessException error = assertThrows(
                BusinessException.class,
                () -> service.requireVersion("pat-1", "0"));

        assertEquals(ErrorCode.PANTRY_VERSION_CONFLICT, error.getErrorCode());
    }

    private boolean reserveAfter(CountDownLatch start, String lotId, String planId) throws InterruptedException {
        start.await();
        try {
            service.reserve(planId, List.of(new PantryService.ReservationRequest(lotId, new BigDecimal("7"))));
            return true;
        } catch (BusinessException error) {
            assertEquals(ErrorCode.PANTRY_RESERVATION_FAILED, error.getErrorCode());
            return false;
        }
    }

    private static CreatePantryItemReq request(String quantity) {
        return new CreatePantryItemReq(
                "pat-1", "pv1", "food-rice", new BigDecimal(quantity), 1, 1, Instant.now().plusSeconds(3600), "lot-1");
    }
}
