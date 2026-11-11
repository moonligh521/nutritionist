package com.moonligh.nutritionist.domain.recipe;

import java.math.BigDecimal;

public record RecipeIngredient(String foodItemId, BigDecimal quantity, int unitCode) {
}
