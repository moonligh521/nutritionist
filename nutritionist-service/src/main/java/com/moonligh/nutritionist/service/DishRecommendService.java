package com.moonligh.nutritionist.service;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.moonligh.nutritionist.domain.recommend.HybridRecall;
import com.moonligh.nutritionist.domain.recommend.IngredientDishRanker;
import com.moonligh.nutritionist.domain.recommend.RecipeIntent;
import com.moonligh.nutritionist.domain.recommend.RecipeVectorFilter;
import com.moonligh.nutritionist.domain.recommend.RecipeVectorizer;
import com.moonligh.nutritionist.infrastructure.persistence.SearchChunkMapper;
import com.moonligh.nutritionist.infrastructure.vector.MilvusRecipeIndex;
import com.moonligh.nutritionist.domain.recommend.IngredientDishRanker.Dish;
import com.moonligh.nutritionist.domain.recommend.IngredientDishRanker.Ingredient;
import com.moonligh.nutritionist.domain.recommend.IngredientDishRanker.Match;

/** 按现有食材推荐最多三道能做的已发布菜。 */
@Service
public class DishRecommendService {

    private static final Set<String> STAPLES = Set.of("654", "668", "672");
    private static final Map<String, String> ALIASES = Map.of(
            "番茄", "138",
            "西红柿", "138",
            "鸡蛋", "580",
            "鸡胸", "405",
            "鸡胸肉", "405",
            "北豆腐", "606",
            "豆腐", "606");

    private final CatalogBrowse catalog;
    private final DishCardCache cards;
    private final SearchChunkMapper chunks;
    private final RecipeVectorizer.TextEmbedding embedding;
    private final MilvusRecipeIndex vectors;
    private final ObjectMapper json = new ObjectMapper();

    public DishRecommendService(
            CatalogBrowse catalog,
            DishCardCache cards,
            SearchChunkMapper chunks,
            RecipeVectorizer.TextEmbedding embedding,
            MilvusRecipeIndex vectors) {
        this.catalog = catalog;
        this.cards = cards;
        this.chunks = chunks;
        this.embedding = embedding;
        this.vectors = vectors;
    }

    /** 只做词到编号的对照，不判断能不能做菜。对不上的词留在 unrecognized。 */
    public Normalized normalize(List<String> foods, String origin) {
        CatalogBrowse.CatalogSnapshot snapshot = catalog.snapshot(origin);
        Map<String, String> nameToId = new LinkedHashMap<>();
        snapshot.foods().forEach(food -> nameToId.put(food.name(), food.id()));
        nameToId.putAll(ALIASES);
        Set<String> knownIds = snapshot.foods().stream().map(CatalogBrowse.FoodView::id).collect(java.util.stream.Collectors.toSet());
        List<String> ids = new ArrayList<>();
        List<String> unrecognized = new ArrayList<>();
        if (foods != null) {
            for (String raw : foods) {
                if (raw == null || raw.isBlank()) {
                    continue;
                }
                String token = raw.trim();
                if (nameToId.containsKey(token)) {
                    ids.add(nameToId.get(token));
                } else if (knownIds.contains(token)) {
                    ids.add(token);
                } else {
                    unrecognized.add(token);
                }
            }
        }
        return new Normalized(ids, unrecognized);
    }

    public MatchReport match(List<String> foods, String origin) {
        return match(foods, origin, "");
    }

    public MatchReport match(List<String> foods, String origin, String text) {
        return match(foods, origin, text, List.of());
    }

    public MatchReport match(List<String> foods, String origin, String text, List<String> conditions) {
        Normalized normalized = normalize(foods, origin);
        return matchIds(normalized.ids(), normalized.unrecognized(), origin, text, conditions);
    }

    /** 编号已经确定后再检索，避免同一句话被解析两次。 */
    public MatchReport matchIds(List<String> ids, List<String> unrecognized, String origin) {
        return matchIds(ids, unrecognized, origin, "", List.of());
    }

    public MatchReport matchIds(List<String> ids, List<String> unrecognized, String origin, String text) {
        return matchIds(ids, unrecognized, origin, text, List.of());
    }

    /**
     * text / conditions 用来缩小候选，例如「川菜」「减肥」「控糖」。
     * 主料必须齐全这条规则不变。没有点名和模糊词时，仍按全部已发布菜排序。
     */
    public MatchReport matchIds(
            List<String> ids, List<String> unrecognized, String origin, String text, List<String> conditions) {
        CatalogBrowse.CatalogSnapshot snapshot = catalog.snapshot(origin);
        Set<String> owned = new LinkedHashSet<>();
        if (ids != null) {
            owned.addAll(ids);
        }
        List<Dish> dishes = new ArrayList<>();
        for (CatalogBrowse.RecipeView recipe : snapshot.recipes()) {
            dishes.add(toDish(recipe, snapshot));
        }
        dishes = narrow(dishes, text, conditions);
        List<Match> ranked = IngredientDishRanker.top(owned, dishes).stream()
                .filter(match -> verify(owned, match))
                .toList();
        List<Suggestion> suggestions = ranked.stream().map(this::suggestion).toList();
        String fallback = suggestions.isEmpty() ? "没有主料齐全的已发布菜，不会另外编一道。" : "";
        return new MatchReport(suggestions, unrecognized == null ? List.of() : unrecognized, fallback);
    }

    /** 给 read_recipe 用。只返回当前已发布版本；没有这道菜时告诉模型没找到。 */
    public String recipeCard(String id) {
        CatalogBrowse.CatalogSnapshot snapshot = catalog.snapshot("");
        CatalogBrowse.RecipeView recipe = snapshot.recipes().stream()
                .filter(item -> item.id().equals(id))
                .findFirst()
                .orElse(null);
        if (recipe == null) {
            return "{\"found\":false}";
        }
        Map<String, Object> card = new LinkedHashMap<>();
        card.put("id", recipe.id());
        card.put("name", recipe.name());
        card.put("version", recipe.version());
        card.put("step", recipe.step());
        List<Map<String, Object>> items = new ArrayList<>();
        for (CatalogBrowse.IngredientView ingredient : recipe.ingredients()) {
            Map<String, Object> item = new LinkedHashMap<>();
            item.put("foodId", ingredient.foodId());
            item.put("name", ingredient.name());
            item.put("grams", ingredient.grams());
            item.put("staple", staple(ingredient.foodId(), snapshot));
            items.add(item);
        }
        card.put("ingredients", items);
        card.put("energy", recipe.nutrition().energy());
        try {
            return json.writeValueAsString(card);
        } catch (JsonProcessingException error) {
            return "{\"found\":false}";
        }
    }

    private static boolean staple(String foodId, CatalogBrowse.CatalogSnapshot snapshot) {
        if (STAPLES.contains(foodId)) {
            return true;
        }
        return snapshot.foods().stream()
                .filter(food -> food.id().equals(foodId))
                .findFirst()
                .map(CatalogBrowse.FoodView::seasoning)
                .orElse(false);
    }

    private List<Dish> narrow(List<Dish> dishes, String text, List<String> conditions) {
        RecipeIntent intent = RecipeIntent.parse(text, conditions);
        String filter = RecipeVectorFilter.expr(
                intent.cuisine(), intent.kind(), intent.preferTags(), intent.conditions());
        boolean hasFilter = filter != null && !filter.isBlank();
        if (!hasFilter && !intent.fuzzy()) {
            return dishes;
        }
        try {
            if (hasFilter && !intent.fuzzy()) {
                if (vectors == null) {
                    return List.of();
                }
                List<String> ids = vectors.query(filter, HybridRecall.CANDIDATE_LIMIT);
                if (ids == null || ids.isEmpty()) {
                    return List.of();
                }
                return HybridRecall.pool(dishes, ids);
            }
            List<HybridRecall.Chunk> stored = new ArrayList<>();
            if (chunks != null) {
                for (SearchChunkMapper.ChunkRow row : chunks.all()) {
                    stored.add(new HybridRecall.Chunk(
                            row.recipeId(), row.documentText(), RecipeVectorizer.fromJson(row.embeddingJson())));
                }
            }
            String fuzzy = intent.fuzzyText();
            float[] query = embedding == null ? null : embedding.embed(fuzzy);
            List<String> byWord = HybridRecall.recall(fuzzy, stored, null);
            List<String> byVector = vectors == null || query == null
                    ? List.of()
                    : vectors.search(query, filter, HybridRecall.CANDIDATE_LIMIT);
            List<String> merged = byVector.isEmpty()
                    ? HybridRecall.recall(fuzzy, stored, query)
                    : HybridRecall.merge(byWord, byVector);
            if (hasFilter) {
                if (merged == null || merged.isEmpty()) {
                    return List.of();
                }
                return HybridRecall.pool(dishes, merged);
            }
            if (merged == null || merged.isEmpty()) {
                return dishes;
            }
            return HybridRecall.pool(dishes, merged);
        } catch (RuntimeException error) {
            return hasFilter ? List.of() : dishes;
        }
    }

    private Dish toDish(CatalogBrowse.RecipeView recipe, CatalogBrowse.CatalogSnapshot snapshot) {
        List<Ingredient> mains = new ArrayList<>();
        List<Ingredient> aux = new ArrayList<>();
        for (CatalogBrowse.IngredientView item : recipe.ingredients()) {
            boolean staple = STAPLES.contains(item.foodId()) || snapshot.foods().stream()
                    .filter(food -> food.id().equals(item.foodId()))
                    .findFirst()
                    .map(CatalogBrowse.FoodView::seasoning)
                    .orElse(false);
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

    private static boolean verify(Set<String> owned, Match match) {
        return match.score() >= IngredientDishRanker.RANK_THRESHOLD
                && match.dish().mains().stream().allMatch(item -> owned.contains(item.foodId()));
    }

    private Suggestion suggestion(Match match) {
        Dish dish = match.dish();
        String mains = dish.mains().stream().map(Ingredient::name).reduce((left, right) -> left + "、" + right).orElse("");
        String bring = String.join("、", match.bring());
        String reason = bring.isEmpty() ? "主料都有：" + mains + "。" : "主料都有：" + mains + "。需自备：" + bring + "。";
        Suggestion suggestion = new Suggestion(
                dish.id(), dish.name(), dish.energy(), match.score(), reason, bring, dish.step());
        cache(suggestion);
        return suggestion;
    }

    private void cache(Suggestion suggestion) {
        try {
            // 只保存已经复核通过的菜卡。能不能做不读这个缓存。
            cards.remember(suggestion.id(), json.writeValueAsString(suggestion));
        } catch (JsonProcessingException | RuntimeException ignored) {
            // 缓存失败仍返回本次结果。
        }
    }

    public record Normalized(List<String> ids, List<String> unrecognized) {
    }

    public record Suggestion(
            String id, String name, Integer energy, int score, String reason, String bring, String step) {
    }

    public record MatchReport(List<Suggestion> dishes, List<String> unrecognized, String fallback) {
    }
}
