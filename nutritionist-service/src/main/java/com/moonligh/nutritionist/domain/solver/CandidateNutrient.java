package com.moonligh.nutritionist.domain.solver;

import java.math.BigDecimal;

import com.moonligh.nutritionist.domain.nutrition.NutrientType;

/** 候选每一单位含有多少某一种营养。 */
public record CandidateNutrient(
        /** 营养素类型。 */
        NutrientType nutrientType,
        /** 单位含量。 */
        BigDecimal amountPerUnit) {
}
