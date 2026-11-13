package com.moonligh.nutritionist.api.res;

import java.time.Instant;

/** 一次摄入记录已经保存。 */
public record IntakeRes(
        /** 摄入记录标识。用于后续更正。 */
        String intakeId,
        /** 客户端事件标识。 */
        String eventId,
        /** 记录时间。 */
        Instant recordedAt) {
}
