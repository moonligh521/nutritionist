package com.moonligh.nutritionist.api.res;

import java.math.BigDecimal;
import java.time.Instant;

/** 已经保存的一条专业营养目标。 */
public record ProfessionalTargetRes(
        /** 目标编号。 */
        String targetId,
        /** 目标版本。 */
        String version,
        /** 适用患者标识。 */
        String patientId,
        /** 营养素代码。 */
        String nutrientCode,
        /** 下限值。 */
        BigDecimal minimum,
        /** 上限值。 */
        BigDecimal maximum,
        /** 生效时间。 */
        Instant effectiveAt,
        /** 失效时间。失效后不得参与配餐。 */
        Instant expiresAt) {
}
