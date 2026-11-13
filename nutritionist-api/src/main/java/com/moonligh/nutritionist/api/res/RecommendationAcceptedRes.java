package com.moonligh.nutritionist.api.res;

/** 推荐任务已收下。这时还没有方案，计算在后台进行。 */
public record RecommendationAcceptedRes(
        /** 推荐任务标识。 */
        String recommendationId,
        /** 任务状态代码。创建时为待处理。 */
        Integer taskStatusCode,
        /** 进度事件地址。 */
        String eventsUrl,
        /** 结果查询地址。 */
        String resultUrl) {
}
