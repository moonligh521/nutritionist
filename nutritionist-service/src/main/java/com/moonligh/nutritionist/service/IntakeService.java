package com.moonligh.nutritionist.service;

import java.time.Instant;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Service;

import com.moonligh.consult.framework.BusinessException;
import com.moonligh.consult.framework.ErrorCode;
import com.moonligh.nutritionist.api.req.CorrectIntakeReq;
import com.moonligh.nutritionist.api.req.CreateIntakeReq;
import com.moonligh.nutritionist.api.req.IntakeItemReq;
import com.moonligh.nutritionist.api.res.IntakeRes;

@Service
public class IntakeService {

    public static final int SIMPLE_FOOD = 1;
    public static final int COOKED_BATCH = 2;

    private final PatientBindingService bindings;
    private final PantryService pantry;
    private final ConcurrentHashMap<String, IntakeRes> events = new ConcurrentHashMap<>();
    private final ConcurrentHashMap<String, CreateIntakeReq> originals = new ConcurrentHashMap<>();
    private final ConcurrentHashMap<String, IntakeRes> byId = new ConcurrentHashMap<>();

    public IntakeService(PatientBindingService bindings, PantryService pantry) {
        this.bindings = bindings;
        this.pantry = pantry;
    }

    public synchronized IntakeRes create(String accountId, CreateIntakeReq request) {
        validate(request);
        bindings.requireBoundPatient(accountId, request.patientId(), request.patientVersion());
        IntakeRes replay = events.get(request.eventId());
        if (replay != null) {
            return replay;
        }
        for (IntakeItemReq item : request.items()) {
            if (item.itemTypeCode() == SIMPLE_FOOD) {
                pantry.consumeSimpleFood(accountId, request.patientId(), item.foodItemId(), item.quantity());
            }
        }
        IntakeRes created = new IntakeRes(UUID.randomUUID().toString(), request.eventId(), Instant.now());
        events.put(request.eventId(), created);
        originals.put(created.intakeId(), request);
        byId.put(created.intakeId(), created);
        return created;
    }

    public IntakeRes correct(String accountId, String intakeId, CorrectIntakeReq request) {
        if (request == null || blank(request.eventId()) || blank(intakeId) || !byId.containsKey(intakeId)) {
            throw new BusinessException(ErrorCode.PARAM_INVALID);
        }
        bindings.requireBoundPatient(accountId, request.patientId(), request.patientVersion());
        CreateIntakeReq original = originals.get(intakeId);
        if (original == null || !original.patientId().equals(request.patientId())) {
            throw new BusinessException(ErrorCode.PARAM_INVALID);
        }
        IntakeRes correction = new IntakeRes(UUID.randomUUID().toString(), request.eventId(), Instant.now());
        byId.put(correction.intakeId(), correction);
        return correction;
    }

    public CreateIntakeReq originalRequest(String intakeId) {
        CreateIntakeReq original = originals.get(intakeId);
        if (original == null) {
            throw new BusinessException(ErrorCode.PARAM_INVALID);
        }
        return original;
    }

    public int count() {
        return events.size();
    }

    private static void validate(CreateIntakeReq request) {
        if (request == null
                || blank(request.eventId())
                || blank(request.patientId())
                || blank(request.patientVersion())
                || request.items().isEmpty()) {
            throw new BusinessException(ErrorCode.PARAM_INVALID);
        }
        for (IntakeItemReq item : request.items()) {
            if (item == null
                    || item.itemTypeCode() == null
                    || item.quantity() == null
                    || item.quantity().signum() <= 0
                    || item.unitCode() == null
                    || item.weightBasisCode() == null
                    || (item.itemTypeCode() == SIMPLE_FOOD && blank(item.foodItemId()))
                    || (item.itemTypeCode() == COOKED_BATCH && blank(item.cookingExecutionId()))
                    || (item.itemTypeCode() != SIMPLE_FOOD && item.itemTypeCode() != COOKED_BATCH)) {
                throw new BusinessException(ErrorCode.PARAM_INVALID);
            }
        }
    }

    private static boolean blank(String value) {
        return value == null || value.isBlank();
    }
}
