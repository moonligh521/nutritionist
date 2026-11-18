package com.moonligh.nutritionist.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.atomic.AtomicLong;

import org.springframework.stereotype.Component;

import com.moonligh.nutritionist.domain.recommend.IngredientDishRanker.Dish;
import com.moonligh.nutritionist.domain.recommend.IngredientDishRanker.Ingredient;
import com.moonligh.nutritionist.service.CatalogBrowse.CatalogSnapshot;
import com.moonligh.nutritionist.service.CatalogBrowse.FoodView;
import com.moonligh.nutritionist.service.CatalogBrowse.IngredientView;
import com.moonligh.nutritionist.service.CatalogBrowse.RecipeView;

/**
 * 检索用已发布目录索引：origin-free，预构建 seasoning / Dish / 主料倒排。
 * 展示层仍用 {@link CatalogBrowse}。
 */
@Component
public class PublishedCatalogIndex {

    private static final Set<String> STAPLES = Set.of("654", "668", "672");

    private final CatalogBrowse catalog;
    private final Object lock = new Object();
    private final AtomicLong generation = new AtomicLong();
    private volatile View view;
    private volatile long loadedGeneration = -1L;

    public PublishedCatalogIndex(CatalogBrowse catalog) {
        this.catalog = catalog;
    }

    public void invalidate() {
        generation.incrementAndGet();
        catalog.invalidate();
    }

    public View get() {
        long gen = generation.get();
        View hit = view;
        if (hit != null && loadedGeneration == gen) {
            return hit;
        }
        synchronized (lock) {
            if (loadedGeneration == generation.get() && view != null) {
                return view;
            }
            CatalogSnapshot snapshot = catalog.coreSnapshot();
            Map<String, Boolean> seasoning = new HashMap<>();
            for (FoodView food : snapshot.foods()) {
                seasoning.put(food.id(), food.seasoning());
            }
            List<Dish> dishes = new ArrayList<>(snapshot.recipes().size());
            Map<String, Dish> dishById = new LinkedHashMap<>();
            Map<String, List<String>> byMainFood = new HashMap<>();
            for (RecipeView recipe : snapshot.recipes()) {
                Dish dish = toDish(recipe, seasoning);
                dishes.add(dish);
                dishById.put(dish.id(), dish);
                for (Ingredient main : dish.mains()) {
                    byMainFood.computeIfAbsent(main.foodId(), key -> new ArrayList<>()).add(dish.id());
                }
            }
            View built = new View(snapshot, Map.copyOf(seasoning), List.copyOf(dishes), Map.copyOf(dishById),
                    freeze(byMainFood));
            view = built;
            loadedGeneration = generation.get();
            return built;
        }
    }

    private static Map<String, List<String>> freeze(Map<String, List<String>> raw) {
        Map<String, List<String>> out = new HashMap<>();
        for (Map.Entry<String, List<String>> entry : raw.entrySet()) {
            out.put(entry.getKey(), List.copyOf(entry.getValue()));
        }
        return Map.copyOf(out);
    }

    static Dish toDish(RecipeView recipe, Map<String, Boolean> seasoning) {
        List<Ingredient> mains = new ArrayList<>();
        List<Ingredient> aux = new ArrayList<>();
        for (IngredientView item : recipe.ingredients()) {
            boolean staple = STAPLES.contains(item.foodId())
                    || seasoning.getOrDefault(item.foodId(), false);
            // staple=true 仅表示油盐酱料；非持有辅料仍 staple=false 以便 bring 扣分
            Ingredient ingredient = new Ingredient(item.foodId(), item.name(), staple);
            if (staple) {
                aux.add(ingredient);
            } else {
                mains.add(ingredient);
            }
        }
        Integer energy = recipe.nutrition().energy() == null ? null : recipe.nutrition().energy().intValue();
        return new Dish(recipe.id(), recipe.name(), energy, recipe.step(), mains, aux);
    }

    public record View(
            CatalogSnapshot snapshot,
            Map<String, Boolean> seasoning,
            List<Dish> dishes,
            Map<String, Dish> dishById,
            Map<String, List<String>> recipeIdsByMainFood) {

        public List<Dish> dishesForOwnedMains(Set<String> owned) {
            if (owned == null || owned.isEmpty()) {
                return dishes;
            }
            LinkedHashMap<String, Dish> selected = new LinkedHashMap<>();
            for (String foodId : owned) {
                List<String> ids = recipeIdsByMainFood.getOrDefault(foodId, List.of());
                for (String id : ids) {
                    Dish dish = dishById.get(id);
                    if (dish != null) {
                        selected.putIfAbsent(id, dish);
                    }
                }
            }
            return selected.isEmpty() ? dishes : List.copyOf(selected.values());
        }
    }
}
