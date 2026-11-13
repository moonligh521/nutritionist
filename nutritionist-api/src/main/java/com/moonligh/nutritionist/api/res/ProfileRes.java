package com.moonligh.nutritionist.api.res;

import java.time.Instant;

/** 保存后的饮食画像。下次修改要带上这里的版本号。 */
public record ProfileRes(
        /** 画像编号。 */
        String profileId,
        /** 画像版本。每次更新递增。 */
        String profileVersion,
        /** 患者标识。 */
        String patientId,
        /** 写入时刻的患者主数据版本。 */
        String patientVersion,
        /** 最后更新时间。 */
        Instant updatedAt) {
}
