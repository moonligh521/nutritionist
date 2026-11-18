package com.moonligh.nutritionist.domain.recommend;

/** 推荐检索空结果/降级原因（日志与 MatchReport；不对小程序展示）。 */
public enum RecallEmptyReason {
    NONE,
    SCALAR_EMPTY,
    ANN_EMPTY,
    EMBED_FAILED,
    VECTOR_STORE_UNAVAILABLE,
    NO_PUBLISHED_INTERSECT,
    NO_FEASIBLE_MAINS,
    FILTER_FAIL_CLOSED,
    FALLBACK_ALL_PUBLISHED
}
