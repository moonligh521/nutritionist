package com.moonligh.nutritionist.service.dialogue;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.moonligh.nutritionist.domain.dialogue.DialogueTask.ConfirmCandidate;
import com.moonligh.nutritionist.domain.dialogue.SessionMemory;
import com.moonligh.nutritionist.service.CatalogBrowse;
import com.moonligh.nutritionist.service.DishRecommendService;
import com.moonligh.nutritionist.service.dialogue.FoodNameIndex.FoodName;

/**
 * 食材分档归一：精确/别名 → 高置信模糊自动纠正 → 低置信待确认 → 未识别。
 */
@Component
public class FoodNormalizer {

    private static final int HIGH_DISTANCE = 1;

    private final DishRecommendService dishes;
    private final CatalogBrowse catalog;

    public FoodNormalizer(DishRecommendService dishes, CatalogBrowse catalog) {
        this.dishes = dishes;
        this.catalog = catalog;
    }

    public Result normalize(List<String> rawFoods, SessionMemory memory) {
        List<String> ids = new ArrayList<>();
        List<String> unrecognized = new ArrayList<>();
        List<String> autoCorrections = new ArrayList<>();
        List<ConfirmCandidate> lowConfidence = new ArrayList<>();
        FoodNameIndex index = foodNameIndex();

        for (String raw : rawFoods == null ? List.<String>of() : rawFoods) {
            if (raw == null || raw.isBlank()) {
                continue;
            }
            String token = raw.trim();
            var remembered = memory.canonicalOf(token);
            if (remembered.isPresent()) {
                DishRecommendService.Normalized hit = dishes.normalize(List.of(remembered.get()), "");
                if (!hit.ids().isEmpty()) {
                    ids.addAll(hit.ids());
                    continue;
                }
            }
            DishRecommendService.Normalized exact = dishes.normalize(List.of(token), "");
            if (!exact.ids().isEmpty()) {
                ids.addAll(exact.ids());
                continue;
            }
            List<String> candidates = index.fuzzyNames(token, HIGH_DISTANCE);
            if (candidates.size() == 1) {
                String name = candidates.getFirst();
                DishRecommendService.Normalized hit = dishes.normalize(List.of(name), "");
                if (!hit.ids().isEmpty()) {
                    ids.addAll(hit.ids());
                    memory.rememberCorrection(token, name);
                    autoCorrections.add(token + "→" + name);
                    continue;
                }
            }
            if (candidates.size() > 1) {
                lowConfidence.add(new ConfirmCandidate(token, candidates));
                continue;
            }
            unrecognized.add(token);
        }
        return new Result(ids, unrecognized, autoCorrections, lowConfidence);
    }

    private FoodNameIndex foodNameIndex() {
        CatalogBrowse.CatalogSnapshot snapshot = catalog.coreSnapshot();
        if (snapshot == null) {
            snapshot = catalog.snapshot("");
        }
        List<FoodName> foods = new ArrayList<>();
        if (snapshot != null) {
            for (CatalogBrowse.FoodView food : snapshot.foods()) {
                foods.add(new FoodName(food.id(), food.name()));
            }
        }
        return new FoodNameIndex(foods);
    }

    static int distance(String left, String right) {
        int[] prev = new int[right.length() + 1];
        int[] curr = new int[right.length() + 1];
        for (int j = 0; j <= right.length(); j++) {
            prev[j] = j;
        }
        for (int i = 1; i <= left.length(); i++) {
            curr[0] = i;
            for (int j = 1; j <= right.length(); j++) {
                int cost = left.charAt(i - 1) == right.charAt(j - 1) ? 0 : 1;
                curr[j] = Math.min(Math.min(curr[j - 1] + 1, prev[j] + 1), prev[j - 1] + cost);
            }
            int[] swap = prev;
            prev = curr;
            curr = swap;
        }
        return prev[right.length()];
    }

    public record Result(
            List<String> ids,
            List<String> unrecognized,
            List<String> autoCorrections,
            List<ConfirmCandidate> lowConfidence) {
        public boolean needsConfirm() {
            return lowConfidence != null && !lowConfidence.isEmpty();
        }
    }
}
