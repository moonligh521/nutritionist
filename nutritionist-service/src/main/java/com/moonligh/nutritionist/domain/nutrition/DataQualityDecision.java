package com.moonligh.nutritionist.domain.nutrition;

import java.util.List;

/** 食材营养数据够不够用来配餐。未知值不能当成 0。 */
public record DataQualityDecision(
        /** 处置：可用、需复核或拒绝。 */
        DataQualityDisposition disposition,
        /** 质量策略版本。 */
        String policyVersion,
        /** 原因代码。 */
        List<String> reasonCodes) {

    public DataQualityDecision {
        reasonCodes = List.copyOf(reasonCodes);
    }
}
