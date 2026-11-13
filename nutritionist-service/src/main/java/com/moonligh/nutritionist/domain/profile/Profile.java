package com.moonligh.nutritionist.domain.profile;

import java.math.BigDecimal;
import java.time.Instant;
import java.time.LocalDate;

/** 一位患者的饮食画像。营养服务自己保存，不复制挂号里的姓名等主数据。 */
public record Profile(
        /** 画像编号。 */
        String profileId,
        /** 账号标识。 */
        String accountId,
        /** 患者标识。 */
        String patientId,
        /** 写入时刻的患者主数据版本。 */
        String patientVersion,
        /** 画像版本。每次更新递增。 */
        long version,
        /** 性别代码。1 男，2 女。 */
        int sexCode,
        /** 出生日期。 */
        LocalDate birthDate,
        /** 身高，单位厘米。 */
        BigDecimal heightCm,
        /** 时区。 */
        String timezone,
        /** 活动水平代码。可空。 */
        Integer activityLevelCode,
        /** 目标类型代码，如减重、控糖。 */
        int goalTypeCode,
        /** 最后更新时间。 */
        Instant updatedAt) {
}
