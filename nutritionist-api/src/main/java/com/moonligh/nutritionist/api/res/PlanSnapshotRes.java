package com.moonligh.nutritionist.api.res;

import java.util.List;

/** 当前已经确认的方案，以及里面每一餐。 */
public record PlanSnapshotRes(
        /** 方案编号。 */
        String planId,
        /** 方案版本。 */
        String planVersion,
        /** 患者标识。 */
        String patientId,
        /** 方案状态。 */
        Integer statusCode,
        /** 餐次列表。 */
        List<MealSlotRes> meals) {

    public PlanSnapshotRes {
        meals = meals == null ? List.of() : List.copyOf(meals);
    }

    /** 方案中的一餐。 */
    public record MealSlotRes(
            /** 餐次标识。 */
            String mealId,
            /** 是否已摄入。已摄入餐次不可替换。 */
            boolean eaten,
            /** 食材标识。 */
            String foodItemId,
            /** 能量，单位千卡。 */
            int energyKcal) {
    }
}
