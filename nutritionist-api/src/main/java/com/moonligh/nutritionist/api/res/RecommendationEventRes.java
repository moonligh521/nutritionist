package com.moonligh.nutritionist.api.res;

import java.time.Instant;

/** 推荐进度里的一条事件。客户端按顺序读这些事件。 */
public record RecommendationEventRes(
        /** 事件标识。 */
        String eventId,
        /** 事件类型代码。1 开始，3 求解，5 完成，6 失败或取消。 */
        Integer eventTypeCode,
        /** 阶段代码。 */
        Integer stageCode,
        /** 说明。 */
        String message,
        /** 发生时间。 */
        Instant occurredAt,
        /** 方案标识。未完成时为空。 */
        String planId) {
}
