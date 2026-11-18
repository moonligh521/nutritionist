package com.moonligh.nutritionist.service.dialogue;

import java.util.ArrayList;
import java.util.List;

/** 食材名索引：用对象列表代替 id→name 裸 Map。 */
public final class FoodNameIndex {

    private final List<FoodName> foods;

    public FoodNameIndex(List<FoodName> foods) {
        this.foods = foods == null ? List.of() : List.copyOf(foods);
    }

    public List<FoodName> foods() {
        return foods;
    }

    public List<String> fuzzyNames(String token, int maxDistance) {
        if (token == null || token.isBlank()) {
            return List.of();
        }
        List<String> high = new ArrayList<>();
        for (FoodName food : foods) {
            String name = food.name();
            if (FoodNormalizer.distance(token, name) <= maxDistance
                    && Math.abs(token.length() - name.length()) <= 1
                    && !high.contains(name)) {
                high.add(name);
            }
        }
        return high;
    }

    public record FoodName(String id, String name) {
        public FoodName {
            id = id == null ? "" : id;
            name = name == null ? "" : name;
        }
    }
}
