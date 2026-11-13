package com.moonligh.nutritionist.domain.safety;

import java.util.List;
import java.util.function.Predicate;

/**
 * 这些病情只使用指南里的固定上限和专业人员目标。
 * 不套用成年能量、蛋白质、脂肪和膳食纤维的自动公式。
 */
public final class GuidelineOnlyConditions {

    public static final List<String> CODES = List.of(
            HypertensionAdmission.CONDITION_CODE,
            HyperlipidemiaAdmission.HYPERLIPIDEMIA,
            HyperlipidemiaAdmission.HYPERCHOLESTEROLEMIA,
            GoutAdmission.GOUT,
            GoutAdmission.HYPERURICEMIA,
            CkdAdmission.CKD,
            CkdAdmission.CKD_STAGE_3_5,
            CkdAdmission.CKD_EDEMA,
            CkdAdmission.CKD_SEVERE_EDEMA,
            CkdAdmission.CKD_HYPERKALEMIA);

    private GuidelineOnlyConditions() {
    }

    public static boolean matches(Predicate<String> hasCondition) {
        return CODES.stream().anyMatch(hasCondition);
    }
}
