package com.moonligh.nutritionist.api.req;

import java.time.LocalDate;

/** 请求生成一餐或一天的饮食方案。接口马上返回，计算在后台做。 */
public record CreateRecommendationReq(
        /** 患者标识。 */
        String patientId,
        /** 患者主数据版本。 */
        String patientVersion,
        /** 提交时画像版本。提交后版本变化则任务失效。 */
        String profileVersion,
        /** 提交时库存版本。提交后版本变化则任务失效。 */
        String pantryVersion,
        /** 范围代码。1 单餐，2 全天。 */
        Integer scopeCode,
        /** 餐次代码。范围为单餐时必填。 */
        Integer mealTypeCode,
        /** 方案日期。 */
        LocalDate date,
        /** 时区，例如 Asia/Shanghai。 */
        String timezone,
        /** 库存模式。1 仅库存，2 优先库存。 */
        Integer pantryModeCode,
        /** 用户确认的本餐占全天能量的百分比。单餐可空。空则不拆分全天能量。 */
        Integer confirmedMealSharePercent) {

    public CreateRecommendationReq(
            String patientId,
            String patientVersion,
            String profileVersion,
            String pantryVersion,
            Integer scopeCode,
            Integer mealTypeCode,
            java.time.LocalDate date,
            String timezone,
            Integer pantryModeCode) {
        this(patientId, patientVersion, profileVersion, pantryVersion, scopeCode, mealTypeCode, date, timezone,
                pantryModeCode, null);
    }
}
