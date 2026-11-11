package com.moonligh.nutritionist.api.res;

import java.math.BigDecimal;

public record FoodQuestionRes(String answer, BigDecimal grams, boolean gramsChanged) {
}
