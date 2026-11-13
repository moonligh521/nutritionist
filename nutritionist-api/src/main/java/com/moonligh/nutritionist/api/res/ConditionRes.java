package com.moonligh.nutritionist.api.res;

/** 一条已保存的疾病记录。 */
public record ConditionRes(
        /** 疾病记录编号。 */
        String conditionId,
        /** 记录版本。 */
        String version,
        /** 记录状态。 */
        Integer statusCode) {
}
