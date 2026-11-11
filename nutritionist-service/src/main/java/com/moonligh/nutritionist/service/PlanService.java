package com.moonligh.nutritionist.service;

import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;

import org.springframework.stereotype.Service;

import com.moonligh.consult.framework.BusinessException;
import com.moonligh.consult.framework.ErrorCode;
import com.moonligh.nutritionist.api.req.ConfirmPlanReq;
import com.moonligh.nutritionist.api.req.ReplacePlanItemReq;
import com.moonligh.nutritionist.api.res.PlanActionRes;
import com.moonligh.nutritionist.api.res.PlanSnapshotRes;

@Service
public class PlanService {

    private final PantryService pantry;
    private final ConcurrentHashMap<String, PlanRecord> plans = new ConcurrentHashMap<>();
    private final ConcurrentHashMap<String, CopyOnWriteArrayList<MealSlot>> meals = new ConcurrentHashMap<>();

    public PlanService(PantryService pantry) {
        this.pantry = pantry;
    }

    public void addValidated(
            String planId, String planVersion, String patientId, String profileVersion, String pantryVersion) {
        plans.put(
                planId,
                new PlanRecord(planId, planVersion, patientId, profileVersion, pantryVersion, PlanStatus.VALIDATED));
    }

    public PlanActionRes confirm(String planId, ConfirmPlanReq request) {
        PlanRecord current = plans.get(planId);
        if (current == null
                || current.status != PlanStatus.VALIDATED
                || !current.planVersion.equals(request.planVersion())
                || !current.profileVersion.equals(request.profileVersion())) {
            throw new BusinessException(ErrorCode.PLAN_NOT_CONFIRMABLE);
        }
        pantry.requireVersion(current.patientId, request.pantryVersion());
        PlanRecord confirmed = current.withStatus(PlanStatus.CONFIRMED);
        plans.put(planId, confirmed);
        return response(confirmed);
    }

    public PlanActionRes cancel(String planId) {
        PlanRecord current = plans.get(planId);
        if (current == null || current.status == PlanStatus.CANCELLED || current.status == PlanStatus.COMPLETED) {
            throw new BusinessException(ErrorCode.PLAN_NOT_CONFIRMABLE);
        }
        pantry.release(current.planVersion);
        PlanRecord cancelled = current.withStatus(PlanStatus.CANCELLED);
        plans.put(planId, cancelled);
        return response(cancelled);
    }

    public void addMeal(String planId, String mealId, boolean eaten, String foodItemId, int energyKcal) {
        if (!plans.containsKey(planId) || mealId == null || mealId.isBlank()) {
            throw new BusinessException(ErrorCode.PARAM_INVALID);
        }
        meals.computeIfAbsent(planId, ignored -> new CopyOnWriteArrayList<>())
                .add(new MealSlot(mealId, eaten, foodItemId, energyKcal));
    }

    public PlanActionRes replace(String planId, ReplacePlanItemReq request) {
        PlanRecord current = plans.get(planId);
        if (current == null
                || request == null
                || !current.planVersion.equals(request.planVersion())
                || (current.status != PlanStatus.DRAFT
                        && current.status != PlanStatus.VALIDATED
                        && current.status != PlanStatus.CONFIRMED)) {
            throw new BusinessException(ErrorCode.PLAN_NOT_CONFIRMABLE);
        }
        CopyOnWriteArrayList<MealSlot> slots = meals.get(planId);
        if (slots == null) {
            throw new BusinessException(ErrorCode.PLAN_NOT_CONFIRMABLE);
        }
        boolean replaced = false;
        for (int index = 0; index < slots.size(); index++) {
            MealSlot meal = slots.get(index);
            if (!meal.mealId.equals(request.mealId())) {
                continue;
            }
            if (meal.eaten) {
                throw new BusinessException(ErrorCode.PLAN_NOT_CONFIRMABLE);
            }
            slots.set(index, new MealSlot(meal.mealId, false, request.replaceFoodItemId(), meal.energyKcal));
            replaced = true;
        }
        if (!replaced) {
            throw new BusinessException(ErrorCode.PLAN_NOT_CONFIRMABLE);
        }
        return response(current);
    }

    public PlanSnapshotRes current(String patientId) {
        PlanRecord current = plans.values().stream()
                .filter(plan -> plan.patientId.equals(patientId) && plan.status == PlanStatus.CONFIRMED)
                .findFirst()
                .orElseThrow(() -> new BusinessException(ErrorCode.PLAN_NOT_CONFIRMABLE));
        List<PlanSnapshotRes.MealSlotRes> slots = meals.getOrDefault(current.planId, new CopyOnWriteArrayList<>())
                .stream()
                .map(meal -> new PlanSnapshotRes.MealSlotRes(meal.mealId, meal.eaten, meal.foodItemId, meal.energyKcal))
                .toList();
        return new PlanSnapshotRes(current.planId, current.planVersion, current.patientId, current.status.code(), slots);
    }

    private static PlanActionRes response(PlanRecord plan) {
        return new PlanActionRes(plan.planId, plan.planVersion, plan.status.code());
    }

    private record PlanRecord(
            String planId,
            String planVersion,
            String patientId,
            String profileVersion,
            String pantryVersion,
            PlanStatus status) {

        PlanRecord withStatus(PlanStatus next) {
            return new PlanRecord(planId, planVersion, patientId, profileVersion, pantryVersion, next);
        }
    }

    private record MealSlot(String mealId, boolean eaten, String foodItemId, int energyKcal) {
    }

    public enum PlanStatus {
        DRAFT(1),
        VALIDATED(2),
        CONFIRMED(3),
        COMPLETED(4),
        CANCELLED(5),
        EXPIRED(6),
        INTERRUPTED(7);

        private final int code;

        PlanStatus(int code) {
            this.code = code;
        }

        public int code() {
            return code;
        }
    }
}
