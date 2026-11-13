package com.moonligh.nutritionist.service;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.math.BigDecimal;
import java.time.Instant;
import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.moonligh.nutritionist.api.req.ConfirmPlanReq;
import com.moonligh.nutritionist.api.req.CreateIntakeReq;
import com.moonligh.nutritionist.api.req.CreatePantryItemReq;
import com.moonligh.nutritionist.api.req.IntakeItemReq;
import com.moonligh.nutritionist.infrastructure.identity.FakePatientGateway;
import com.moonligh.nutritionist.infrastructure.persistence.InMemoryPatientBindingStore;

class PlanAndIntakeServiceTest {

    private PantryService pantry;
    private PlanService plans;
    private IntakeService intakes;

    @BeforeEach
    void setUp() {
        FakePatientGateway gateway = new FakePatientGateway();
        gateway.put("acc-1", "pat-1", "pv1");
        InMemoryPatientBindingStore store = new InMemoryPatientBindingStore();
        PatientBindingService bindings = new PatientBindingService(store, gateway);
        bindings.bind("acc-1", "pat-1", "pv1");
        pantry = new PantryService(bindings);
        plans = new PlanService(pantry);
        intakes = new IntakeService(bindings, pantry);
    }

    @Test
    void confirmingPlanDoesNotRecordIntakeOrConsumeInventory() {
        var pantryItem = pantry.create("acc-1", pantryRequest());
        pantry.reserve(
                "plan-version-1",
                List.of(new PantryService.ReservationRequest(pantryItem.lotId(), new BigDecimal("4"))));
        plans.addValidated("plan-1", "plan-version-1", "pat-1", "profile-1", pantry.snapshot("acc-1", "pat-1").pantryVersion());
        BigDecimal beforeConfirm = pantry.snapshot("acc-1", "pat-1").items().getFirst().onHandQuantity();

        var confirmed = plans.confirm(
                "plan-1",
                new ConfirmPlanReq(
                        "plan-version-1", pantry.snapshot("acc-1", "pat-1").pantryVersion(), "profile-1"));

        assertEquals(PlanService.PlanStatus.CONFIRMED.code(), confirmed.statusCode());
        assertEquals(beforeConfirm, pantry.snapshot("acc-1", "pat-1").items().getFirst().onHandQuantity());
        assertEquals(0, intakes.count());
    }

    @Test
    void simpleFoodIntakeConsumesInventory() {
        pantry.create("acc-1", pantryRequest());

        intakes.create(
                "acc-1",
                new CreateIntakeReq(
                        "event-1",
                        "pat-1",
                        "pv1",
                        null,
                        List.of(new IntakeItemReq(
                                IntakeService.SIMPLE_FOOD,
                                "food-apple",
                                null,
                                new BigDecimal("3"),
                                1,
                                1))));

        assertEquals(new BigDecimal("7"), pantry.snapshot("acc-1", "pat-1").items().getFirst().onHandQuantity());
        assertEquals(1, intakes.count());
    }

    @Test
    void confirmingPlanReservesGramsWithoutEatingThem() {
        pantry.create("acc-1", pantryRequest());
        plans.addValidated("plan-2", "plan-version-2", "pat-1", "profile-1", pantry.snapshot("acc-1", "pat-1").pantryVersion());
        plans.addPortion("plan-2", "meal-1", "food-apple", 50, new BigDecimal("4"));

        plans.confirm(
                "plan-2",
                new ConfirmPlanReq("plan-version-2", pantry.snapshot("acc-1", "pat-1").pantryVersion(), "profile-1"));

        var item = pantry.snapshot("acc-1", "pat-1").items().getFirst();
        assertEquals(new BigDecimal("10"), item.onHandQuantity());
        assertEquals(new BigDecimal("4"), item.reservedQuantity());
        assertEquals(0, intakes.count());
        assertTrue(item.availableQuantity().compareTo(new BigDecimal("6")) == 0);
    }

    private static CreatePantryItemReq pantryRequest() {
        return new CreatePantryItemReq(
                "pat-1", "pv1", "food-apple", new BigDecimal("10"), 1, 1, Instant.now().plusSeconds(3600), "a");
    }
}
