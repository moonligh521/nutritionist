package com.moonligh.nutritionist.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moonligh.nutritionist.domain.common.EntityTable;
import com.moonligh.nutritionist.infrastructure.persistence.NutritionDataStore;

import com.moonligh.consult.framework.BusinessException;
import com.moonligh.consult.framework.ErrorCode;
import com.moonligh.nutritionist.api.req.ConfirmPlanReq;
import com.moonligh.nutritionist.api.req.ReplacePlanItemReq;
import com.moonligh.nutritionist.api.res.PlanActionRes;
import com.moonligh.nutritionist.api.res.PlanSnapshotRes;

@Service
public class PlanService {

    private final PantryService pantry;
    private final NutritionDataStore records;
    /** 方案按方案编号保存。 */
    private final EntityTable<PlanRecord> plans = new EntityTable<>(PlanRecord::planId);
    /** 每个方案下面有几餐。 */
    private final EntityTable<PlanMeals> meals = new EntityTable<>(PlanMeals::planId);

    public PlanService(PantryService pantry) {
        this(pantry, null);
    }

    @Autowired
    public PlanService(PantryService pantry, NutritionDataStore records) {
        this.pantry = pantry;
        this.records = records;
    }

    public void addValidated(
            String planId, String planVersion, String patientId, String profileVersion, String pantryVersion) {
        plans.save(new PlanRecord(planId, planVersion, patientId, profileVersion, pantryVersion, PlanStatus.VALIDATED));
        if (records != null) {
            records.savePlan(planId, planVersion, patientId, profileVersion, pantryVersion, PlanStatus.VALIDATED.code());
        }
    }

    public PlanActionRes confirm(String planId, ConfirmPlanReq request) {
        PlanRecord current = load(planId);
        if (current == null
                || current.status != PlanStatus.VALIDATED
                || !current.planVersion.equals(request.planVersion())
                || !current.profileVersion.equals(request.profileVersion())) {
            throw new BusinessException(ErrorCode.PLAN_NOT_CONFIRMABLE);
        }
        pantry.requireVersion(current.patientId, request.pantryVersion());
        reservePortions(current);
        PlanRecord confirmed = current.withStatus(PlanStatus.CONFIRMED);
        plans.save(confirmed);
        if (records != null) {
            records.savePlan(planId, confirmed.planVersion, confirmed.patientId, confirmed.profileVersion,
                    confirmed.pantryVersion, confirmed.status.code());
        }
        return response(confirmed);
    }

    public PlanActionRes cancel(String planId) {
        PlanRecord current = load(planId);
        if (current == null || current.status == PlanStatus.CANCELLED || current.status == PlanStatus.COMPLETED) {
            throw new BusinessException(ErrorCode.PLAN_NOT_CONFIRMABLE);
        }
        pantry.release(current.planVersion);
        PlanRecord cancelled = current.withStatus(PlanStatus.CANCELLED);
        plans.save(cancelled);
        if (records != null) {
            records.savePlan(planId, cancelled.planVersion, cancelled.patientId, cancelled.profileVersion,
                    cancelled.pantryVersion, cancelled.status.code());
        }
        return response(cancelled);
    }

    public void addMeal(String planId, String mealId, boolean eaten, String foodItemId, int energyKcal) {
        if (load(planId) == null || mealId == null || mealId.isBlank()) {
            throw new BusinessException(ErrorCode.PARAM_INVALID);
        }
        meals.findOrCreate(planId, () -> new PlanMeals(planId)).items()
                .add(new MealSlot(mealId, eaten, foodItemId, energyKcal));
        if (records != null) {
            records.saveMeal(planId, mealId, eaten, foodItemId, energyKcal, null);
        }
    }

    public void addPortion(String planId, String mealId, String foodItemId, int energyKcal, BigDecimal grams) {
        addMeal(planId, mealId, false, foodItemId, energyKcal);
        List<MealSlot> slots = meals.find(planId).map(PlanMeals::items).orElseThrow();
        for (int index = 0; index < slots.size(); index++) {
            MealSlot meal = slots.get(index);
            if (meal.mealId.equals(mealId)) {
                slots.set(index, new MealSlot(meal.mealId, false, foodItemId, energyKcal, grams));
            }
        }
        if (records != null) {
            records.saveMeal(planId, mealId, false, foodItemId, energyKcal, grams);
        }
    }

    private void reservePortions(PlanRecord current) {
        ensureMeals(current.planId);
        List<PantryService.ReservationRequest> requests = new ArrayList<>();
        for (MealSlot meal : meals.find(current.planId).map(PlanMeals::items).orElse(List.of())) {
            if (meal.eaten || meal.grams() == null || meal.grams().signum() <= 0) {
                continue;
            }
            requests.addAll(pantry.allocate(current.patientId(), meal.foodItemId(), meal.grams()));
        }
        if (!requests.isEmpty()) {
            pantry.reserve(current.planVersion, requests);
        }
    }

    public PlanActionRes replace(String planId, ReplacePlanItemReq request) {
        PlanRecord current = load(planId);
        if (current == null
                || request == null
                || !current.planVersion.equals(request.planVersion())
                || (current.status != PlanStatus.DRAFT
                        && current.status != PlanStatus.VALIDATED
                        && current.status != PlanStatus.CONFIRMED)) {
            throw new BusinessException(ErrorCode.PLAN_NOT_CONFIRMABLE);
        }
        ensureMeals(planId);
        List<MealSlot> slots = meals.find(planId).map(PlanMeals::items).orElse(null);
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
            if (records != null) {
                records.saveMeal(planId, meal.mealId, false, request.replaceFoodItemId(), meal.energyKcal(), meal.grams());
            }
            replaced = true;
        }
        if (!replaced) {
            throw new BusinessException(ErrorCode.PLAN_NOT_CONFIRMABLE);
        }
        return response(current);
    }

    public PlanSnapshotRes current(String patientId) {
        PlanRecord current = plans.all().stream()
                .filter(plan -> plan.patientId.equals(patientId) && plan.status == PlanStatus.CONFIRMED)
                .findFirst()
                .orElse(null);
        if (current == null && records != null) {
            current = records.findConfirmedPlan(patientId).orElse(null);
            if (current != null) {
                plans.save(current);
                ensureMeals(current.planId);
            }
        }
        if (current == null) {
            throw new BusinessException(ErrorCode.PLAN_NOT_CONFIRMABLE);
        }
        List<PlanSnapshotRes.MealSlotRes> slots = meals.find(current.planId).map(PlanMeals::items).orElse(List.of())
                .stream()
                .map(meal -> new PlanSnapshotRes.MealSlotRes(meal.mealId, meal.eaten, meal.foodItemId, meal.energyKcal))
                .toList();
        return new PlanSnapshotRes(current.planId, current.planVersion, current.patientId, current.status.code(), slots);
    }

    private PlanRecord load(String planId) {
        PlanRecord current = plans.find(planId).orElse(null);
        if (current == null && records != null) {
            current = records.findPlan(planId).orElse(null);
            if (current != null) {
                plans.save(current);
                ensureMeals(planId);
            }
        }
        return current;
    }

    private void ensureMeals(String planId) {
        if (meals.find(planId).isPresent() || records == null) {
            return;
        }
        List<MealSlot> stored = records.findMeals(planId);
        if (stored.isEmpty()) {
            return;
        }
        meals.findOrCreate(planId, () -> new PlanMeals(planId)).items().addAll(stored);
    }

    private static PlanActionRes response(PlanRecord plan) {
        return new PlanActionRes(plan.planId, plan.planVersion, plan.status.code());
    }

    /** 一个方案下的各餐。列表可以改某一餐，所以不用不可变集合。 */
    static final class PlanMeals {
        private final String planId;
        private final List<MealSlot> items = new CopyOnWriteArrayList<>();

        PlanMeals(String planId) {
            this.planId = planId;
        }

        String planId() {
            return planId;
        }

        List<MealSlot> items() {
            return items;
        }
    }

    public record PlanRecord(
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

    public record MealSlot(String mealId, boolean eaten, String foodItemId, int energyKcal, BigDecimal grams) {

        public MealSlot(String mealId, boolean eaten, String foodItemId, int energyKcal) {
            this(mealId, eaten, foodItemId, energyKcal, null);
        }
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

        public static PlanStatus fromCode(int code) {
            for (PlanStatus status : values()) {
                if (status.code == code) {
                    return status;
                }
            }
            throw new IllegalArgumentException("plan status " + code);
        }
    }
}
