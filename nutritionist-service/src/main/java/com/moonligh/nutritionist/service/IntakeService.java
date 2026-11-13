package com.moonligh.nutritionist.service;

import java.math.BigDecimal;
import java.time.Instant;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moonligh.nutritionist.domain.common.EntityTable;
import com.moonligh.nutritionist.infrastructure.persistence.NutritionDataStore;

import com.moonligh.consult.framework.BusinessException;
import com.moonligh.consult.framework.ErrorCode;
import com.moonligh.nutritionist.api.req.CorrectIntakeReq;
import com.moonligh.nutritionist.api.req.CreateIntakeReq;
import com.moonligh.nutritionist.api.req.IntakeItemReq;
import com.moonligh.nutritionist.api.res.IntakeRes;
import com.moonligh.nutritionist.domain.meal.MealOrder;

@Service
public class IntakeService {

    public static final int SIMPLE_FOOD = 1;
    public static final int COOKED_BATCH = 2;

    private final PatientBindingService bindings;
    private final PantryService pantry;
    private final NutritionDataStore records;

    public IntakeService(PatientBindingService bindings, PantryService pantry) {
        this(bindings, pantry, null);
    }

    @Autowired
    public IntakeService(PatientBindingService bindings, PantryService pantry, NutritionDataStore records) {
        this.bindings = bindings;
        this.pantry = pantry;
        this.records = records;
    }
    /** 按业务事件号记住摄入，相同事件号再提交就返回原来的结果。 */
    private final EntityTable<IntakeRes> events = new EntityTable<>(IntakeRes::eventId);
    /** 原始请求按摄入编号保存，更正不会改掉它。 */
    private final EntityTable<OriginalIntake> originals = new EntityTable<>(OriginalIntake::intakeId);
    private final EntityTable<IntakeRes> byId = new EntityTable<>(IntakeRes::intakeId);


    public synchronized IntakeRes create(String accountId, CreateIntakeReq request) {
        validate(request);
        bindings.requireBoundPatient(accountId, request.patientId(), request.patientVersion());
        IntakeRes replay = events.find(request.eventId()).orElse(null);
        if (replay == null && records != null) {
            replay = records.findIntakeByEvent(request.eventId()).orElse(null);
            if (replay != null) {
                remember(replay);
            }
        }
        if (replay != null) {
            return replay;
        }
        for (IntakeItemReq item : request.items()) {
            if (item.itemTypeCode() == SIMPLE_FOOD) {
                pantry.consumeSimpleFood(accountId, request.patientId(), item.foodItemId(), item.quantity());
            }
        }
        IntakeRes created = new IntakeRes(UUID.randomUUID().toString(), request.eventId(), Instant.now());
        events.save(created);
        originals.save(new OriginalIntake(created.intakeId(), request));
        byId.save(created);
        if (records != null) {
            records.saveIntake(accountId, request, created);
        }
        return created;
    }

    public IntakeRes correct(String accountId, String intakeId, CorrectIntakeReq request) {
        if (request == null || blank(request.eventId()) || blank(intakeId) || rememberIfStored(intakeId) == null) {
            throw new BusinessException(ErrorCode.PARAM_INVALID);
        }
        bindings.requireBoundPatient(accountId, request.patientId(), request.patientVersion());
        CreateIntakeReq original = originalRequestOrNull(intakeId);
        if (original == null || !original.patientId().equals(request.patientId())) {
            throw new BusinessException(ErrorCode.PARAM_INVALID);
        }
        IntakeRes replay = events.find(request.eventId()).orElse(null);
        if (replay == null && records != null) {
            replay = records.findCorrection(request.eventId()).orElse(null);
        }
        if (replay != null) {
            events.save(replay);
            byId.save(replay);
            return replay;
        }
        IntakeRes correction = new IntakeRes(UUID.randomUUID().toString(), request.eventId(), Instant.now());
        events.save(correction);
        byId.save(correction);
        if (records != null) {
            records.saveCorrection(accountId, intakeId, request, correction);
        }
        return correction;
    }

    public CreateIntakeReq originalRequest(String intakeId) {
        CreateIntakeReq original = originalRequestOrNull(intakeId);
        if (original == null) {
            throw new BusinessException(ErrorCode.PARAM_INVALID);
        }
        return original;
    }

    public int count() {
        return events.size();
    }

    public List<MealOrder.Eaten> consumed(String patientId) {
        List<MealOrder.Eaten> eaten = new ArrayList<>();
        Set<String> seenEvents = new HashSet<>();
        for (OriginalIntake row : originals.all()) {
            if (!patientId.equals(row.request().patientId())) {
                continue;
            }
            seenEvents.add(row.request().eventId());
            addItems(eaten, row.request().items());
        }
        if (records != null) {
            for (CreateIntakeReq request : records.intakeRequests(patientId)) {
                if (!seenEvents.add(request.eventId())) {
                    continue;
                }
                addItems(eaten, request.items());
            }
        }
        return List.copyOf(eaten);
    }

    private static void addItems(List<MealOrder.Eaten> eaten, List<IntakeItemReq> items) {
        for (IntakeItemReq item : items) {
            if (item.foodItemId() == null || item.quantity() == null) {
                continue;
            }
            addEaten(eaten, item.foodItemId(), item.quantity());
        }
    }

    private static void addEaten(List<MealOrder.Eaten> eaten, String foodId, BigDecimal grams) {
        for (int index = 0; index < eaten.size(); index++) {
            if (eaten.get(index).foodItemId().equals(foodId)) {
                eaten.set(index, new MealOrder.Eaten(foodId, eaten.get(index).grams().add(grams)));
                return;
            }
        }
        eaten.add(new MealOrder.Eaten(foodId, grams));
    }

    private void remember(IntakeRes stored) {
        events.save(stored);
        byId.save(stored);
        originalRequestOrNull(stored.intakeId());
    }

    private IntakeRes rememberIfStored(String intakeId) {
        IntakeRes stored = byId.find(intakeId).orElse(null);
        if (stored != null || records == null) {
            return stored;
        }
        stored = records.findIntakeById(intakeId).orElse(null);
        if (stored != null) {
            remember(stored);
        }
        return stored;
    }

    private CreateIntakeReq originalRequestOrNull(String intakeId) {
        CreateIntakeReq original = originals.find(intakeId).map(OriginalIntake::request).orElse(null);
        if (original != null || records == null) {
            return original;
        }
        original = records.findIntakeRequest(intakeId).orElse(null);
        if (original != null) {
            originals.save(new OriginalIntake(intakeId, original));
        }
        return original;
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

    /** 第一次记下的摄入请求。更正另存一条，不改这一条。 */
    record OriginalIntake(String intakeId, CreateIntakeReq request) {
    }

    private static boolean blank(String value) {
        return value == null || value.isBlank();
    }
}
