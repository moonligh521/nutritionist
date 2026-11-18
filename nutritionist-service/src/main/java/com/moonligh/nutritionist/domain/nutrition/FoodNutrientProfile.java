package com.moonligh.nutritionist.domain.nutrition;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/** 一种食材的成分剖面。 */
public final class FoodNutrientProfile {

    private final String name;
    private final int categoryCode;
    private final List<NutrientAmount> amounts;

    public FoodNutrientProfile(String name, int categoryCode, List<NutrientAmount> amounts) {
        this.name = name == null ? "" : name;
        this.categoryCode = categoryCode;
        this.amounts = amounts == null ? new ArrayList<>() : new ArrayList<>(amounts);
    }

    public String name() {
        return name;
    }

    public int categoryCode() {
        return categoryCode;
    }

    public void put(int nutrientCode, BigDecimal amount) {
        if (amount == null) {
            return;
        }
        amounts.removeIf(item -> item.nutrientCode() == nutrientCode);
        amounts.add(new NutrientAmount(nutrientCode, amount));
    }

    public BigDecimal amountOf(int nutrientCode) {
        for (NutrientAmount item : amounts) {
            if (item.nutrientCode() == nutrientCode) {
                return item.amount();
            }
        }
        return null;
    }
}
