package com.moonligh.nutritionist.api.res;

/** 方案确认、取消或替换之后的结果。 */
public record PlanActionRes(
        /** 方案编号。 */
        String planId,
        /** 方案版本。 */
        String planVersion,
        /** 方案状态，例如已校验、已确认、已取消。 */
        Integer statusCode) {
}
