package com.moonligh.nutritionist.api.req;

import java.math.BigDecimal;
import java.time.LocalDate;

/** 写入或更新饮食画像。 */
public record UpsertProfileReq(
        /** 患者标识。 */
        String patientId,
        /** 患者主数据版本。与当前版本不一致时拒绝写入。 */
        String patientVersion,
        /** 画像版本。首次写入可空，后续须携带上次返回的版本。 */
        String profileVersion,
        /** 性别代码。1 男，2 女。 */
        Integer sexCode,
        /** 出生日期。用于计算年龄。 */
        LocalDate birthDate,
        /** 身高，单位厘米。 */
        BigDecimal heightCm,
        /** 时区，例如 Asia/Shanghai。 */
        String timezone,
        /** 活动水平代码。可空。 */
        Integer activityLevelCode,
        /** 目标类型代码，如减重、控糖。 */
        Integer goalTypeCode) {
}
