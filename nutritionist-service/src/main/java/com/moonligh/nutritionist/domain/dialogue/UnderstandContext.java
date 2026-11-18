package com.moonligh.nutritionist.domain.dialogue;

import java.util.List;

/** 第一轮理解入参包：给模型的「眼睛」。 */
public record UnderstandContext(
        String utterance,
        List<String> requestFoods,
        List<DishRef> currentDishes,
        String lastFocusedDishName,
        String phase,
        LongTermMemory preference) {

    public record DishRef(int index, String id, String name) {
        public DishRef {
            id = id == null ? "" : id;
            name = name == null ? "" : name.trim();
        }
    }

    public UnderstandContext {
        utterance = utterance == null ? "" : utterance.trim();
        requestFoods = requestFoods == null ? List.of() : List.copyOf(requestFoods);
        currentDishes = currentDishes == null ? List.of() : List.copyOf(currentDishes);
        lastFocusedDishName = lastFocusedDishName == null ? "" : lastFocusedDishName.trim();
        phase = phase == null || phase.isBlank() ? "IDLE" : phase.trim();
        preference = preference == null ? LongTermMemory.empty() : preference;
    }

    public static UnderstandContext of(String utterance, List<String> foods, LongTermMemory prefs) {
        return new UnderstandContext(utterance, foods, List.of(), "", "IDLE", prefs);
    }
}
