package com.moonligh.nutritionist.api.req;

public record ReplacePlanItemReq(
        String planVersion,
        String mealId,
        String replaceFoodItemId,
        String replaceRecipeVersion,
        Integer reasonCode) {
}
