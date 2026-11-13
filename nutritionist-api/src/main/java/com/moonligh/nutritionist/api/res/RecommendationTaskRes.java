package com.moonligh.nutritionist.api.res;

import java.util.List;

/** 推荐任务的当前状态。断线后用它查结果。 */
public record RecommendationTaskRes(
        /** 推荐任务标识。 */
        String recommendationId,
        /** 任务状态代码：待处理、执行中、成功、失败或已取消。 */
        Integer taskStatusCode,
        /** 失败码。成功时为空。 */
        Integer failureCode,
        /** 方案结果。未完成时为空。 */
        PlanActionRes plan,
        /** 求解出的一餐。任务未成功或尚未写入时为空。 */
        SolvedMealRes solvedMeal,
        /** 无解时的冲突约束。其他状态为空列表。 */
        List<SolverConflictRes> conflicts) {

    public RecommendationTaskRes(
            String recommendationId, Integer taskStatusCode, Integer failureCode, PlanActionRes plan) {
        this(recommendationId, taskStatusCode, failureCode, plan, null, List.of());
    }

    public RecommendationTaskRes(
            String recommendationId,
            Integer taskStatusCode,
            Integer failureCode,
            PlanActionRes plan,
            SolvedMealRes solvedMeal) {
        this(recommendationId, taskStatusCode, failureCode, plan, solvedMeal, List.of());
    }

    public RecommendationTaskRes {
        conflicts = conflicts == null ? List.of() : List.copyOf(conflicts);
    }
}
