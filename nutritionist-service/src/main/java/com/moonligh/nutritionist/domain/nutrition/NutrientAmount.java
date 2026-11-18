package com.moonligh.nutritionist.domain.nutrition;

import java.math.BigDecimal;

/** 某营养素在每 100g 中的含量。 */
public record NutrientAmount(int nutrientCode, BigDecimal amount) {
}
