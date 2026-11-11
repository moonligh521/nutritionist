package com.moonligh.nutritionist.service;

import java.math.BigDecimal;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicLong;

import org.springframework.stereotype.Service;

import com.moonligh.consult.framework.BusinessException;
import com.moonligh.consult.framework.ErrorCode;
import com.moonligh.nutritionist.api.req.CreatePantryItemReq;
import com.moonligh.nutritionist.api.res.PantryItemRes;
import com.moonligh.nutritionist.api.res.PantrySnapshotRes;

@Service
public class PantryService {

    private final PatientBindingService bindings;
    private final ConcurrentHashMap<String, PantryLot> lots = new ConcurrentHashMap<>();
    private final ConcurrentHashMap<String, List<Reservation>> reservationsByPlan = new ConcurrentHashMap<>();
    private final ConcurrentHashMap<String, AtomicLong> versions = new ConcurrentHashMap<>();

    public PantryService(PatientBindingService bindings) {
        this.bindings = bindings;
    }

    public PantryItemRes create(String accountId, CreatePantryItemReq request) {
        validate(request);
        bindings.requireBoundPatient(accountId, request.patientId(), request.patientVersion());
        String itemId = UUID.randomUUID().toString();
        String lotId = UUID.randomUUID().toString();
        PantryLot lot = new PantryLot(
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
        lots.put(lotId, lot);
        incrementVersion(request.patientId());
        return toResponse(lot);
    }

    public PantrySnapshotRes snapshot(String accountId, String patientId) {
        List<PantryItemRes> items = lots.values().stream()
                .filter(lot -> lot.accountId.equals(accountId) && lot.patientId.equals(patientId))
                .sorted(Comparator.comparing(lot -> lot.lotId))
                .map(PantryService::toResponse)
                .toList();
        return new PantrySnapshotRes(Long.toString(version(patientId)), items);
    }

    public void requireVersion(String patientId, String expectedVersion) {
        if (!Long.toString(version(patientId)).equals(expectedVersion)) {
            throw new BusinessException(ErrorCode.PANTRY_VERSION_CONFLICT);
        }
    }

    public void reserve(String planVersionId, List<ReservationRequest> requests) {
        if (planVersionId == null || planVersionId.isBlank() || requests == null || requests.isEmpty()) {
            throw new BusinessException(ErrorCode.PARAM_INVALID);
        }
        synchronized (lots) {
            for (int index = 0; index < requests.size(); index++) {
                ReservationRequest request = requests.get(index);
                PantryLot lot = lots.get(request.lotId());
                if (lot == null
                        || request.quantity() == null
                        || request.quantity().signum() <= 0
                        || lot.available().compareTo(request.quantity()) < 0) {
                    throw new BusinessException(ErrorCode.PANTRY_RESERVATION_FAILED);
                }
            }
            List<Reservation> created = new ArrayList<>();
            for (ReservationRequest request : requests) {
                PantryLot lot = lots.get(request.lotId());
                PantryLot updated = lot.withReserved(lot.reserved.add(request.quantity()));
                lots.put(lot.lotId, updated);
                created.add(new Reservation(planVersionId, lot.lotId, request.quantity()));
                incrementVersion(lot.patientId);
            }
            reservationsByPlan.put(planVersionId, List.copyOf(created));
        }
    }

    public void release(String planVersionId) {
        synchronized (lots) {
            List<Reservation> reservations = reservationsByPlan.remove(planVersionId);
            if (reservations == null) {
                return;
            }
            for (Reservation reservation : reservations) {
                PantryLot lot = lots.get(reservation.lotId);
                if (lot != null) {
                    lots.put(lot.lotId, lot.withReserved(lot.reserved.subtract(reservation.quantity)));
                    incrementVersion(lot.patientId);
                }
            }
        }
    }

    public void consumeSimpleFood(String accountId, String patientId, String foodItemId, BigDecimal quantity) {
        synchronized (lots) {
            PantryLot lot = lots.values().stream()
                    .filter(candidate -> candidate.accountId.equals(accountId)
                            && candidate.patientId.equals(patientId)
                            && candidate.foodItemId.equals(foodItemId)
                            && candidate.available().compareTo(quantity) >= 0)
                    .min(Comparator.comparing(candidate -> candidate.expireAt == null ? Instant.MAX : candidate.expireAt))
                    .orElseThrow(() -> new BusinessException(ErrorCode.PANTRY_RESERVATION_FAILED));
            lots.put(lot.lotId, lot.withOnHand(lot.onHand.subtract(quantity)));
            incrementVersion(patientId);
        }
    }

    private long version(String patientId) {
        return versions.computeIfAbsent(patientId, ignored -> new AtomicLong()).get();
    }

    private void incrementVersion(String patientId) {
        versions.computeIfAbsent(patientId, ignored -> new AtomicLong()).incrementAndGet();
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

    private static PantryItemRes toResponse(PantryLot lot) {
        return new PantryItemRes(
                lot.itemId,
                lot.lotId,
                lot.foodItemId,
                lot.onHand,
                lot.reserved,
                lot.available(),
                lot.unitCode,
                lot.stateCode,
                lot.expireAt,
                lot.lotCode);
    }

    public record ReservationRequest(String lotId, BigDecimal quantity) {
    }

    private record Reservation(String planVersionId, String lotId, BigDecimal quantity) {
    }

    private record PantryLot(
            String itemId,
            String lotId,
            String accountId,
            String patientId,
            String foodItemId,
            BigDecimal onHand,
            BigDecimal reserved,
            Integer unitCode,
            Integer stateCode,
            Instant expireAt,
            String lotCode) {

        BigDecimal available() {
            return onHand.subtract(reserved);
        }

        PantryLot withReserved(BigDecimal value) {
            return new PantryLot(
                    itemId, lotId, accountId, patientId, foodItemId, onHand, value, unitCode, stateCode, expireAt, lotCode);
        }

        PantryLot withOnHand(BigDecimal value) {
            return new PantryLot(
                    itemId, lotId, accountId, patientId, foodItemId, value, reserved, unitCode, stateCode, expireAt, lotCode);
        }
    }
}
