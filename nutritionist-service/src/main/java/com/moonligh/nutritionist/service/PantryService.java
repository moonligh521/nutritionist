package com.moonligh.nutritionist.service;

import java.math.BigDecimal;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.moonligh.consult.framework.BusinessException;
import com.moonligh.consult.framework.ErrorCode;
import com.moonligh.nutritionist.api.req.AdjustPantryReq;
import com.moonligh.nutritionist.api.req.CreatePantryItemReq;
import com.moonligh.nutritionist.api.res.PantryItemRes;
import com.moonligh.nutritionist.api.res.PantrySnapshotRes;
import com.moonligh.nutritionist.domain.pantry.InMemoryPantryStore;
import com.moonligh.nutritionist.domain.pantry.PantryStore;
import com.moonligh.nutritionist.domain.pantry.PantryStore.Lot;

@Service
public class PantryService {

    private final PatientBindingService bindings;
    private final PantryStore store;

    public PantryService(PatientBindingService bindings) {
        this(bindings, new InMemoryPantryStore());
    }

    @Autowired
    public PantryService(PatientBindingService bindings, PantryStore store) {
        this.bindings = bindings;
        this.store = store;
    }

    @Transactional
    public PantryItemRes create(String accountId, CreatePantryItemReq request) {
        validate(request);
        bindings.requireBoundPatient(accountId, request.patientId(), request.patientVersion());
        String itemId = UUID.randomUUID().toString();
        String lotId = UUID.randomUUID().toString();
        Lot lot = new Lot(
                itemId,
                lotId,
                accountId,
                request.patientId(),
                request.foodItemId(),
                request.quantity(),
                BigDecimal.ZERO,
                request.unitCode(),
                request.stateCode(),
                request.expireAt(),
                request.lotCode());
        store.insert(lot);
        store.recordChange(request.patientId(), lotId, 1, request.quantity());
        return toResponse(lot);
    }

    @Transactional
    public PantrySnapshotRes adjust(String accountId, AdjustPantryReq request) {
        if (request == null || request.quantity() == null || request.quantity().signum() == 0) {
            throw new BusinessException(ErrorCode.PARAM_INVALID);
        }
        if (request.quantity().signum() > 0) {
            create(accountId, new CreatePantryItemReq(
                    request.patientId(),
                    request.patientVersion(),
                    request.foodItemId(),
                    request.quantity(),
                    request.unitCode(),
                    request.stateCode(),
                    request.expireAt(),
                    request.lotCode()));
        } else {
            bindings.requireBoundPatient(accountId, request.patientId(), request.patientVersion());
            consumeSimpleFood(accountId, request.patientId(), request.foodItemId(), request.quantity().abs());
        }
        return snapshot(accountId, request.patientId());
    }

    public PantrySnapshotRes snapshot(String accountId, String patientId) {
        List<PantryItemRes> items = store.list(accountId, patientId).stream().map(PantryService::toResponse).toList();
        return new PantrySnapshotRes(Long.toString(store.version(patientId)), items);
    }

    public List<com.moonligh.nutritionist.domain.meal.MealOrder.Stock> stocks(String patientId) {
        List<com.moonligh.nutritionist.domain.meal.MealOrder.Stock> stocks = new ArrayList<>();
        for (Lot lot : store.listByPatient(patientId)) {
            addStock(stocks, lot.foodItemId(), lot.available());
        }
        return List.copyOf(stocks);
    }

    private static void addStock(List<com.moonligh.nutritionist.domain.meal.MealOrder.Stock> stocks, String foodId, BigDecimal available) {
        for (int index = 0; index < stocks.size(); index++) {
            com.moonligh.nutritionist.domain.meal.MealOrder.Stock current = stocks.get(index);
            if (current.foodItemId().equals(foodId)) {
                stocks.set(index, new com.moonligh.nutritionist.domain.meal.MealOrder.Stock(
                        foodId, current.availableGrams().add(available)));
                return;
            }
        }
        stocks.add(new com.moonligh.nutritionist.domain.meal.MealOrder.Stock(foodId, available));
    }

    public void requireVersion(String patientId, String expectedVersion) {
        if (!Long.toString(store.version(patientId)).equals(expectedVersion)) {
            throw new BusinessException(ErrorCode.PANTRY_VERSION_CONFLICT);
        }
    }

    public List<ReservationRequest> allocate(String patientId, String foodItemId, BigDecimal grams) {
        if (patientId == null || foodItemId == null || grams == null || grams.signum() <= 0) {
            throw new BusinessException(ErrorCode.PARAM_INVALID);
        }
        List<ReservationRequest> requests = new ArrayList<>();
        BigDecimal left = grams;
        for (Lot lot : store.listByPatient(patientId)) {
            if (!foodItemId.equals(lot.foodItemId()) || lot.available().signum() <= 0) {
                continue;
            }
            BigDecimal take = lot.available().min(left);
            requests.add(new ReservationRequest(lot.lotId(), take));
            left = left.subtract(take);
            if (left.signum() == 0) {
                break;
            }
        }
        if (left.signum() > 0) {
            throw new BusinessException(ErrorCode.PANTRY_RESERVATION_FAILED);
        }
        return List.copyOf(requests);
    }

    @Transactional
    public void reserve(String planVersionId, List<ReservationRequest> requests) {
        if (planVersionId == null || planVersionId.isBlank() || requests == null || requests.isEmpty()) {
            throw new BusinessException(ErrorCode.PARAM_INVALID);
        }
        synchronized (store) {
            for (ReservationRequest request : requests) {
                Lot lot = store.find(request.lotId());
                if (lot == null
                        || request.quantity() == null
                        || request.quantity().signum() <= 0
                        || lot.available().compareTo(request.quantity()) < 0) {
                    throw new BusinessException(ErrorCode.PANTRY_RESERVATION_FAILED);
                }
            }
            List<PantryStore.Reservation> created = new ArrayList<>();
            for (ReservationRequest request : requests) {
                Lot lot = store.find(request.lotId());
                store.updateQuantities(lot.withReserved(lot.reserved().add(request.quantity())));
                store.rememberReservation(planVersionId, lot.lotId(), request.quantity());
                store.recordChange(lot.patientId(), lot.lotId(), 2, request.quantity());
                created.add(new PantryStore.Reservation(planVersionId, lot.lotId(), request.quantity()));
            }
        }
    }

    @Transactional
    public void release(String planVersionId) {
        synchronized (store) {
            List<PantryStore.Reservation> reservations = store.reservations(planVersionId);
            store.forgetReservations(planVersionId);
            for (PantryStore.Reservation reservation : reservations) {
                Lot lot = store.find(reservation.lotId());
                if (lot != null) {
                    store.updateQuantities(lot.withReserved(lot.reserved().subtract(reservation.quantity())));
                    store.recordChange(lot.patientId(), lot.lotId(), 3, reservation.quantity());
                }
            }
        }
    }

    @Transactional
    public void consumeSimpleFood(String accountId, String patientId, String foodItemId, BigDecimal quantity) {
        synchronized (store) {
            Lot lot = store.list(accountId, patientId).stream()
                    .filter(candidate -> candidate.foodItemId().equals(foodItemId)
                            && candidate.available().compareTo(quantity) >= 0)
                    .min(Comparator.comparing(candidate -> candidate.expireAt() == null ? Instant.MAX : candidate.expireAt()))
                    .orElseThrow(() -> new BusinessException(ErrorCode.PANTRY_RESERVATION_FAILED));
            store.updateQuantities(lot.withOnHand(lot.onHand().subtract(quantity)));
            store.recordChange(patientId, lot.lotId(), 4, quantity);
        }
    }

    private static void validate(CreatePantryItemReq request) {
        if (request == null
                || blank(request.patientId())
                || blank(request.patientVersion())
                || blank(request.foodItemId())
                || request.quantity() == null
                || request.quantity().signum() <= 0
                || request.unitCode() == null
                || request.stateCode() == null) {
            throw new BusinessException(ErrorCode.PARAM_INVALID);
        }
    }

    private static boolean blank(String value) {
        return value == null || value.isBlank();
    }

    private static PantryItemRes toResponse(Lot lot) {
        return new PantryItemRes(
                lot.itemId(),
                lot.lotId(),
                lot.foodItemId(),
                lot.onHand(),
                lot.reserved(),
                lot.available(),
                lot.unitCode(),
                lot.stateCode(),
                lot.expireAt(),
                lot.lotCode());
    }

    public record ReservationRequest(String lotId, BigDecimal quantity) {
    }
}
