package com.moonligh.nutritionist.api.req;

import java.util.List;

/** 记下实际吃下去的食物。同一事件号再提交，不会记第二次。 */
public record CreateIntakeReq(
        /** 摄入事件标识。由客户端生成，用于幂等。 */
        String eventId,
        /** 患者标识。 */
        String patientId,
        /** 患者主数据版本。 */
        String patientVersion,
        /** 关联餐次标识。可空。 */
        String mealId,
        /** 实际摄入明细。 */
        List<IntakeItemReq> items) {

    public CreateIntakeReq {
        items = items == null ? List.of() : List.copyOf(items);
    }
}
