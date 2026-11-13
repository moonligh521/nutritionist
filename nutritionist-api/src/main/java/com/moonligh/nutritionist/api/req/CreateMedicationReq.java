package com.moonligh.nutritionist.api.req;

import java.time.Instant;

/** 追加一条用药记录。信息不完整时，安全评估会要求补资料。 */
public record CreateMedicationReq(
        /** 患者标识。 */
        String patientId,
        /** 患者主数据版本。 */
        String patientVersion,
        /** 药物名称。 */
        String medicationName,
        /** 药物类别代码。可空。 */
        Integer categoryCode,
        /** 剂量描述。 */
        String doseText,
        /** 用药频次描述。 */
        String frequencyText,
        /** 开始时间。可空。 */
        Instant startedAt,
        /** 结束时间。在用时为空。 */
        Instant endedAt,
        /** 用药信息是否已确认完整。 */
        boolean completeConfirmed) {
}
