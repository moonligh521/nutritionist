package com.moonligh.nutritionist.domain.replay;

import java.util.List;

/** 某个候选为什么没被选上。用来向用户解释，也用来排障。 */
public record CandidateRejectionReason(
        /** 候选标识。 */
        String candidateId,
        /** 候选类型代码。1 菜谱，2 食材。 */
        int candidateTypeCode,
        /** 拒绝原因代码，如过敏、额度、数据质量。 */
        String reasonCode,
        /** 说明。 */
        String message,
        /** 关联约束标识。 */
        List<String> constraintIds,
        /** 能力等级。 */
        int capabilityLevel) {

    public CandidateRejectionReason {
        constraintIds = constraintIds == null ? List.of() : List.copyOf(constraintIds);
    }
}
