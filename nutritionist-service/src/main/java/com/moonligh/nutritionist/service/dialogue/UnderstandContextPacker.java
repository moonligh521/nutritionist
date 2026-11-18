package com.moonligh.nutritionist.service.dialogue;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.moonligh.nutritionist.domain.dialogue.SessionMemory;
import com.moonligh.nutritionist.domain.dialogue.UnderstandContext;
import com.moonligh.nutritionist.domain.dialogue.UnderstandContext.DishRef;
import com.moonligh.nutritionist.service.DishRecommendService.Suggestion;
import com.moonligh.nutritionist.service.dialogue.DialogueOrchestrator.TurnCommand;

@Component
public class UnderstandContextPacker {

    public UnderstandContext pack(SessionMemory memory, TurnCommand command) {
        List<DishRef> dishes = new ArrayList<>();
        if (memory != null) {
            List<Suggestion> current = memory.currentDishes();
            for (int i = 0; i < current.size(); i++) {
                Suggestion dish = current.get(i);
                if (dish == null) {
                    continue;
                }
                dishes.add(new DishRef(i + 1, dish.id(), dish.name()));
            }
        }
        String focused = "";
        if (memory != null && !memory.lastFocusedDishName().isBlank()) {
            focused = memory.lastFocusedDishName();
        } else if (dishes.size() == 1) {
            focused = dishes.getFirst().name();
        }
        String phase = memory == null ? (dishes.isEmpty() ? "IDLE" : "RECOMMENDED") : memory.phase().name();
        return new UnderstandContext(
                command == null ? "" : command.text(),
                command == null ? List.of() : command.foods(),
                dishes,
                focused,
                phase,
                memory == null ? null : memory.longTerm());
    }
}
