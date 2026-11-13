package com.moonligh.nutritionist.api.req;

import java.math.BigDecimal;
import java.time.Instant;

/** 上报一次体重或血糖。同一事件号重复提交不会记两次。 */
public record CreateMeasurementReq(
        /** 患者标识。 */
        String patientId,
        /** 患者主数据版本。 */
        String patientVersion,
        /** 测量事件标识。由客户端生成，用于幂等。 */
        String eventId,
        /** 测量类型代码。1 血糖，2 体重。 */
        Integer typeCode,
        /** 测量数值。 */
        BigDecimal value,
        /** 数值单位。 */
        Integer unitCode,
        /** 观测时间。 */
        Instant observedAt,
        /** 测量场景代码：餐前、餐后或未知。体重测量可空。 */
        Integer contextCode,
        /** 数据来源代码，如手工录入、设备。 */
        Integer sourceCode,
        /** 是否紧急。紧急时不触发自动调餐。 */
        boolean urgent) {
}
