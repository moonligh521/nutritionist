package com.moonligh.nutritionist.api.res;

import java.util.List;

/** 一次测量记下之后，系统给出的处理决定。 */
public record MeasurementRes(
        /** 测量记录编号。 */
        String measurementId,
        /** 决策代码：仅记录、维持方案、调整后续餐次、人工复核或停止。 */
        Integer decisionCode,
        /** 安全许可代码：允许、资料不足、人工复核或停止。 */
        Integer safetyPermissionCode,
        /** 原因类别代码。 */
        List<Integer> reasonCategoryCodes,
        /** 处置动作代码。 */
        List<Integer> actionDispositionCodes) {

    public MeasurementRes {
        reasonCategoryCodes = reasonCategoryCodes == null ? List.of() : List.copyOf(reasonCategoryCodes);
        actionDispositionCodes = actionDispositionCodes == null ? List.of() : List.copyOf(actionDispositionCodes);
    }
}
