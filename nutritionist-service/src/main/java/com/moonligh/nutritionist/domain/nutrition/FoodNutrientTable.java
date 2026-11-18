package com.moonligh.nutritionist.domain.nutrition;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

/** 发布菜用到的食材成分表（按 id 查找）。 */
public final class FoodNutrientTable {

    private final List<Entry> entries;

    public FoodNutrientTable() {
        this.entries = new ArrayList<>();
    }

    public void put(String foodId, FoodNutrientProfile profile) {
        if (foodId == null || foodId.isBlank() || profile == null) {
            return;
        }
        entries.removeIf(entry -> entry.foodId().equals(foodId));
        entries.add(new Entry(foodId, profile));
    }

    public Optional<FoodNutrientProfile> find(String foodId) {
        if (foodId == null) {
            return Optional.empty();
        }
        for (Entry entry : entries) {
            if (entry.foodId().equals(foodId)) {
                return Optional.of(entry.profile());
            }
        }
        return Optional.empty();
    }

    public List<Entry> entries() {
        return List.copyOf(entries);
    }

    public record Entry(String foodId, FoodNutrientProfile profile) {
    }
}
