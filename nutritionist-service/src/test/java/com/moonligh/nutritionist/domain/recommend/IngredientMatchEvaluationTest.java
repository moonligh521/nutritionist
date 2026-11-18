package com.moonligh.nutritionist.domain.recommend;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;
import java.util.Set;

import org.junit.jupiter.api.Test;

import com.moonligh.nutritionist.domain.recommend.IngredientDishRanker.Dish;
import com.moonligh.nutritionist.domain.recommend.IngredientDishRanker.Ingredient;
import com.moonligh.nutritionist.domain.recommend.IngredientDishRanker.Match;

/** 离线评测集。指标是主料精确率和应命中菜的召回率，不看模型分数。 */
class IngredientMatchEvaluationTest {

    private static final Ingredient EGG = new Ingredient("580", "鸡蛋", false);
    private static final Ingredient TOMATO = new Ingredient("138", "西红柿", false);
    private static final Ingredient BEEF = new Ingredient("352", "猪里脊", false);
    private static final Ingredient OIL = new Ingredient("654", "菜籽油", true);

    private final List<Dish> corpus = List.of(
            new Dish("7", "番茄炒蛋", 250, "步骤", List.of(EGG, TOMATO), List.of(OIL)),
            new Dish("17", "水煮蛋", 72, "步骤", List.of(EGG), List.of()),
            new Dish("10", "里脊炒胡萝卜", 200, "步骤", List.of(BEEF), List.of(OIL)));

    @Test
    void goldSetKeepsPrecisionAndRecallAtOne() {
        List<Case> cases = List.of(
                new Case(Set.of("580", "138"), Set.of("7", "17")),
                new Case(Set.of("352"), Set.of("10")),
                new Case(Set.of("138"), Set.of()),
                new Case(Set.of(), Set.of()));
        int returned = 0;
        int illegal = 0;
        int expected = 0;
        int hit = 0;
        for (Case item : cases) {
            List<Match> matches = IngredientDishRanker.top(item.owned(), corpus);
            returned += matches.size();
            for (Match match : matches) {
                boolean covered = match.dish().mains().stream().allMatch(food -> item.owned().contains(food.foodId()));
                if (!covered || match.score() < IngredientDishRanker.RANK_THRESHOLD) {
                    illegal++;
                }
            }
            for (String id : item.expected()) {
                expected++;
                if (matches.stream().anyMatch(match -> match.dish().id().equals(id))) {
                    hit++;
                }
            }
            if (item.expected().isEmpty()) {
                assertTrue(matches.isEmpty());
            }
        }
        assertEquals(0, illegal);
        assertEquals(expected, hit);
        assertEquals(3, returned);
    }

    private record Case(Set<String> owned, Set<String> expected) {
    }
}
