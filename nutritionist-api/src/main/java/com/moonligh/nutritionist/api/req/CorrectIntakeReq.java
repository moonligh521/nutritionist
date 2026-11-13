package com.moonligh.nutritionist.api.req;

import java.util.List;

/** 更正一次摄入。原来的记录保留，这次只是追加说明。 */
public record CorrectIntakeReq(
        /** 更正事件标识。 */
        String eventId,
        /** 患者标识。 */
        String patientId,
        /** 患者主数据版本。 */
        String patientVersion,
        /** 更正说明。 */
        String note,
        /** 更正后的摄入明细。 */
        List<IntakeItemReq> items) {

    public CorrectIntakeReq {
        items = items == null ? List.of() : List.copyOf(items);
    }
}
