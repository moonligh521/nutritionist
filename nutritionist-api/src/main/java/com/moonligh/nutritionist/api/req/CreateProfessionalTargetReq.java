package com.moonligh.nutritionist.api.req;

import java.math.BigDecimal;
import java.time.Instant;

/** 创建带有效期的专业营养目标。仅专业角色可调用。 */
public record CreateProfessionalTargetReq(
        /** 适用患者标识。 */
        String patientId,
        /** 营养素代码。 */
        String nutrientCode,
        /** 下限值。 */
        BigDecimal minimum,
        /** 上限值。须大于或等于下限值。 */
        BigDecimal maximum,
        /** 生效时间。 */
        Instant effectiveAt,
        /** 失效时间。失效后不得参与配餐。 */
        Instant expiresAt) {
}
