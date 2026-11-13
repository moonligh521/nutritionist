package com.moonligh.nutritionist.domain.safety;

import java.util.List;

/** 一次安全判断的结果。一次只有一个许可，可以有多个原因。 */
public record SafetyDecision(
        /** 安全许可：允许、资料不足、人工复核或停止。 */
        SafetyPermission permission,
        /** 原因类别，如急症、药物、数据质量。 */
        List<SafetyReasonCategory> reasonCategories,
        /** 处置动作。 */
        List<ActionDisposition> actionDispositions,
        /** 决策原因代码。 */
        List<String> decisionReasonCodes) {

    public SafetyDecision {
        reasonCategories = List.copyOf(reasonCategories);
        actionDispositions = List.copyOf(actionDispositions);
        decisionReasonCodes = List.copyOf(decisionReasonCodes);
    }
}
