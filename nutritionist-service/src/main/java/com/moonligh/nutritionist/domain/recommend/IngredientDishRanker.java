package com.moonligh.nutritionist.domain.recommend;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Set;

/**
 * 切块单位是一道已发布菜，匹配单位是一个必需主料。
 * 做法文本不参与匹配。主料覆盖率不到 1 的菜分数为 0，不返回。
 * 排序分只在通过硬门槛的菜之间比较，不是模型打分。
 */
public final class IngredientDishRanker {

    /** 通过硬门槛后，每缺一种非常备辅料扣 15 分。低于此分不推荐。 */
    public static final int RANK_THRESHOLD = 40;

    private IngredientDishRanker() {
    }

    public static List<Match> top(Set<String> ownedFoodIds, List<Dish> dishes) {
        if (ownedFoodIds == null || ownedFoodIds.isEmpty()) {
            return List.of();
        }
        List<Match> matched = new ArrayList<>();
        for (Dish dish : dishes) {
            Match match = score(ownedFoodIds, dish);
            if (match.score() >= RANK_THRESHOLD) {
                matched.add(match);
            }
        }
        matched.sort(Comparator.comparingInt(Match::score).reversed()
                .thenComparing(Comparator.comparingInt((Match match) -> match.dish().mains().size()).reversed())
                .thenComparing(match -> match.dish().name()));
        return matched.size() <= 3 ? List.copyOf(matched) : List.copyOf(matched.subList(0, 3));
    }

    static Match score(Set<String> ownedFoodIds, Dish dish) {
        if (dish.mains().isEmpty() || ownedFoodIds == null || ownedFoodIds.isEmpty()) {
            return new Match(dish, List.of(), 0);
        }
        boolean covered = dish.mains().stream().allMatch(item -> ownedFoodIds.contains(item.foodId()));
        if (!covered) {
            return new Match(dish, List.of(), 0);
        }
        List<String> bring = dish.aux().stream()
                .filter(item -> !item.staple())
                .filter(item -> !ownedFoodIds.contains(item.foodId()))
                .map(Ingredient::name)
                .toList();
        int rank = Math.max(0, 100 - 15 * bring.size());
        return new Match(dish, bring, rank);
    }

    public record Ingredient(String foodId, String name, boolean staple) {
    }

    public record Dish(
            String id,
            String name,
            Integer energy,
            String step,
            List<Ingredient> mains,
            List<Ingredient> aux) {
    }

    public record Match(Dish dish, List<String> bring, int score) {
    }
}
