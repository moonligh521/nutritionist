package com.moonligh.nutritionist.api.req;

import java.util.List;

/** 一次烹饪调整，里面可以有多种食材的实际变化。 */
public record CookingAdjustmentReq(
        /** 食材计划用量与实际用量。 */
        List<ActualIngredientChangeReq> items) {

    public CookingAdjustmentReq {
        items = items == null ? List.of() : List.copyOf(items);
    }
}
