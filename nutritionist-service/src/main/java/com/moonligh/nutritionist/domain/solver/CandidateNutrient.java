package com.moonligh.nutritionist.domain.solver;

import java.math.BigDecimal;

import com.moonligh.nutritionist.domain.nutrition.NutrientType;

public record CandidateNutrient(NutrientType nutrientType, BigDecimal amountPerUnit) {
}
