package com.moonligh.nutritionist.api.req;

/** 替换方案里的一餐。已经吃过的餐不能换。 */
public record ReplacePlanItemReq(
        /** 当前方案版本。 */
        String planVersion,
        /** 待替换餐次标识。 */
        String mealId,
        /** 替换食材标识。可空。 */
        String replaceFoodItemId,
        /** 替换菜谱版本。可空。 */
        String replaceRecipeVersion,
        /** 替换原因代码。 */
        Integer reasonCode) {
}
