package com.moonligh.nutritionist.api.req;

import java.util.List;

public record CookingAdjustmentReq(List<ActualIngredientChangeReq> items) {

    public CookingAdjustmentReq {
        items = items == null ? List.of() : List.copyOf(items);
    }
}
