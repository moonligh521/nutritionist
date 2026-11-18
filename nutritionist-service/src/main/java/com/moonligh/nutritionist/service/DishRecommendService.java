package com.moonligh.nutritionist.service;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.ObjectProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.moonligh.consult.framework.observability.AgentSpan;
import com.moonligh.consult.framework.observability.AgentTrace;
import com.moonligh.nutritionist.config.RecallDegradeProperties;
import com.moonligh.nutritionist.domain.recommend.FoodAlias;
import com.moonligh.nutritionist.domain.recommend.FoodNameLookup;
import com.moonligh.nutritionist.domain.recommend.HybridRecall;
import com.moonligh.nutritionist.domain.recommend.IngredientDishRanker;
import com.moonligh.nutritionist.domain.recommend.RecipeCardPayload;
import com.moonligh.nutritionist.domain.recommend.RecipeCardPayload.IngredientLine;
import com.moonligh.nutritionist.domain.recommend.RecallContext;
import com.moonligh.nutritionist.domain.recommend.RecallEmptyReason;
import com.moonligh.nutritionist.infrastructure.persistence.SearchChunkMapper;
import com.moonligh.nutritionist.infrastructure.vector.MilvusRecipeIndex;
import com.moonligh.nutritionist.observability.NutritionTraceNames;
import com.moonligh.nutritionist.domain.recommend.IngredientDishRanker.Dish;
import com.moonligh.nutritionist.domain.recommend.IngredientDishRanker.Ingredient;
import com.moonligh.nutritionist.domain.recommend.IngredientDishRanker.Match;
import com.moonligh.nutritionist.domain.recommend.RecipeVectorizer;
import com.moonligh.nutritionist.service.CatalogBrowse.CatalogSnapshot;
import com.moonligh.nutritionist.service.CatalogBrowse.RecipeView;
import com.moonligh.nutritionist.service.PublishedCatalogIndex.View;

/** 按现有食材推荐最多三道能做的已发布菜。 */
@Service
public class DishRecommendService {

    private static final List<FoodAlias> ALIASES = List.of(
            new FoodAlias("番茄", "138"),
            new FoodAlias("西红柿", "138"),
            new FoodAlias("鸡蛋", "580"),
            new FoodAlias("鸡胸", "405"),
            new FoodAlias("鸡胸肉", "405"),
            new FoodAlias("北豆腐", "606"),
            new FoodAlias("豆腐", "606"));

    private final PublishedCatalogIndex index;
    private final DishCardCache cards;
    private final SearchChunkIndex chunkIndex;
    private final RecipeVectorizer.TextEmbedding embedding;
    private final MilvusRecipeIndex vectors;
    private final RecallMetrics metrics;
    private final AgentTrace agentTrace;
    private final RecallDegradeLadder degradeLadder;
    private final ObjectMapper json = new ObjectMapper();

    public DishRecommendService(
            CatalogBrowse catalog,
            DishCardCache cards,
            SearchChunkMapper chunks,
            RecipeVectorizer.TextEmbedding embedding,
            MilvusRecipeIndex vectors) {
        this(new PublishedCatalogIndex(catalog), cards, new SearchChunkIndex(chunks), embedding, vectors, null, null, null);
    }

    public DishRecommendService(
            CatalogBrowse catalog,
            DishCardCache cards,
            SearchChunkMapper chunks,
            RecipeVectorizer.TextEmbedding embedding,
            MilvusRecipeIndex vectors,
            RecallMetrics metrics) {
        this(new PublishedCatalogIndex(catalog), cards, new SearchChunkIndex(chunks), embedding, vectors, metrics, null, null);
    }

    @Autowired
    public DishRecommendService(
            PublishedCatalogIndex index,
            DishCardCache cards,
            SearchChunkIndex chunkIndex,
            RecipeVectorizer.TextEmbedding embedding,
            MilvusRecipeIndex vectors,
            RecallMetrics metrics,
            ObjectProvider<AgentTrace> agentTrace,
            ObjectProvider<RecallDegradeLadder> degradeLadder) {
        this.index = index;
        this.cards = cards;
        this.chunkIndex = chunkIndex;
        this.embedding = embedding;
        this.vectors = vectors;
        this.metrics = metrics == null ? new RecallMetrics() : metrics;
        this.agentTrace = agentTrace == null ? AgentTrace.NOOP : agentTrace.getIfAvailable(() -> AgentTrace.NOOP);
        this.degradeLadder = degradeLadder == null
                ? new RecallDegradeLadder(new RecallDegradeProperties())
                : degradeLadder.getIfAvailable(() -> new RecallDegradeLadder(new RecallDegradeProperties()));
    }

    /** 只做词到编号的对照，不判断能不能做菜。对不上的词留在 unrecognized。 */
    public Normalized normalize(List<String> foods, String origin) {
        CatalogSnapshot snapshot = index.get().snapshot();
        FoodNameLookup.Builder builder = new FoodNameLookup.Builder().addAliases(ALIASES);
        snapshot.foods().forEach(food -> builder.addFood(food.id(), food.name()));
        FoodNameLookup lookup = builder.build();
        List<String> ids = new ArrayList<>();
        List<String> unrecognized = new ArrayList<>();
        if (foods != null) {
            for (String raw : foods) {
                if (raw == null || raw.isBlank()) {
                    continue;
                }
                String token = raw.trim();
                var byName = lookup.idOf(token);
                if (byName.isPresent()) {
                    ids.add(byName.get());
                } else if (lookup.knownId(token)) {
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

    public MatchReport match(
            List<String> foods, String text, String cuisine, String kind, List<String> conditions) {
        Normalized normalized = normalize(foods, "");
        RecallContext parsed = RecallContext.fromText(text, conditions == null ? List.of() : conditions);
        String useCuisine = cuisine != null && !cuisine.isBlank() ? cuisine.trim() : parsed.cuisine();
        String useKind = kind != null && !kind.isBlank() ? kind.trim() : parsed.kind();
        RecallContext ctx = new RecallContext(
                useCuisine, useKind, parsed.preferTags(), parsed.conditions(), parsed.fuzzyText());
        return matchIds(normalized.ids(), normalized.unrecognized(), "", ctx);
    }

    public MatchReport matchIds(List<String> ids, List<String> unrecognized, String origin) {
        return matchIds(ids, unrecognized, origin, RecallContext.empty());
    }

    public MatchReport matchIds(List<String> ids, List<String> unrecognized, String origin, String text) {
        return matchIds(ids, unrecognized, origin, RecallContext.fromText(text, List.of()));
    }

    public MatchReport matchIds(
            List<String> ids, List<String> unrecognized, String origin, String text, List<String> conditions) {
        return matchIds(ids, unrecognized, origin, RecallContext.fromText(text, conditions));
    }

    /**
     * 结构化检索：标量进 Milvus filter；仅 fuzzy 才 embed；有 filter 时空/失败不退全库。
     */
    public MatchReport matchIds(
            List<String> ids, List<String> unrecognized, String origin, RecallContext context) {
        RecallContext ctx = context == null ? RecallContext.empty() : context;
        try (AgentSpan recall = agentTrace.span(NutritionTraceNames.RECALL)) {
            recall.attr("has_filter", ctx.hasFilter())
                    .attr("fuzzy", ctx.fuzzy())
                    .attr("cuisine", ctx.cuisine())
                    .attr("kind", ctx.kind())
                    .attr("prefer_tags", String.join(",", ctx.preferTags()))
                    .attr("conditions", String.join(",", ctx.conditions()))
                    .attr("filter_expr", ctx.filterExpr())
                    .attr("owned_count", ids == null ? 0 : ids.size());

            View catalogView = index.get();
            Set<String> owned = new LinkedHashSet<>();
            if (ids != null) {
                owned.addAll(ids);
            }
            RecallContext active = ctx;
            NarrowResult narrowed = null;
            List<Suggestion> suggestions = List.of();
            int degradeStep = 0;
            for (int step = 0; step <= 3; step++) {
                final RecallContext attempt = active;
                try (AgentSpan narrowSpan = agentTrace.span(NutritionTraceNames.RECALL_NARROW)) {
                    narrowed = narrow(catalogView, attempt, owned);
                    narrowSpan.attr("candidate_count", narrowed.dishes().size())
                            .attr("recalled_count", narrowed.recalledCount())
                            .attr("narrow_reason", narrowed.reason().name())
                            .attr("filter_expr", narrowed.filterExpr())
                            .attr("degrade_step", step);
                }
                try (AgentSpan rankSpan = agentTrace.span(NutritionTraceNames.RECALL_RANK)) {
                    List<Match> ranked = IngredientDishRanker.top(owned, narrowed.dishes()).stream()
                            .filter(match -> verify(owned, match))
                            .toList();
                    suggestions = ranked.stream().map(this::suggestion).toList();
                    rankSpan.attr("ranked_count", suggestions.size());
                }
                degradeStep = step;
                if (!suggestions.isEmpty()) {
                    break;
                }
                RecallEmptyReason peek = narrowed.reason();
                if (peek == RecallEmptyReason.NONE || peek == RecallEmptyReason.FALLBACK_ALL_PUBLISHED) {
                    if (!narrowed.dishes().isEmpty()) {
                        peek = RecallEmptyReason.NO_FEASIBLE_MAINS;
                    } else if (attempt.hasFilter() && peek == RecallEmptyReason.NONE) {
                        peek = RecallEmptyReason.FILTER_FAIL_CLOSED;
                    }
                }
                if (!degradeLadder.allowDegrade(attempt, peek)) {
                    break;
                }
                RecallContext next = degradeLadder.next(attempt, step);
                if (next == null) {
                    break;
                }
                active = next;
            }
            RecallEmptyReason reason = narrowed == null ? RecallEmptyReason.NONE : narrowed.reason();
            if (suggestions.isEmpty()) {
                if (reason == RecallEmptyReason.NONE || reason == RecallEmptyReason.FALLBACK_ALL_PUBLISHED) {
                    if (narrowed != null && !narrowed.dishes().isEmpty()) {
                        reason = RecallEmptyReason.NO_FEASIBLE_MAINS;
                    } else if (active.hasFilter() && reason == RecallEmptyReason.NONE) {
                        reason = RecallEmptyReason.FILTER_FAIL_CLOSED;
                    }
                }
            } else if (reason != RecallEmptyReason.FALLBACK_ALL_PUBLISHED) {
                reason = RecallEmptyReason.NONE;
            }
            String fallback = suggestions.isEmpty() ? "没有主料齐全的已发布菜，不会另外编一道。" : "";
            metrics.mark(reason, !suggestions.isEmpty());
            recall.attr("empty_reason", reason.name())
                    .attr("dish_count", suggestions.size())
                    .attr("recalled_count", narrowed == null ? 0 : narrowed.recalledCount())
                    .attr("degrade_step", degradeStep);
            return new MatchReport(
                    suggestions,
                    unrecognized == null ? List.of() : unrecognized,
                    fallback,
                    reason,
                    narrowed == null ? "" : narrowed.filterExpr(),
                    narrowed == null ? 0 : narrowed.recalledCount(),
                    degradeStep);
        }
    }

    public String recipeCard(String id) {
        RecipeView recipe = index.get().snapshot().recipe(id).orElse(null);
        if (recipe == null) {
            return "{\"found\":false}";
        }
        View view = index.get();
        List<IngredientLine> items = new ArrayList<>();
        for (var ingredient : recipe.ingredients()) {
            boolean staple = view.seasoning().getOrDefault(ingredient.foodId(), false)
                    || Set.of("654", "668", "672").contains(ingredient.foodId());
            items.add(new IngredientLine(
                    ingredient.foodId(),
                    ingredient.name(),
                    ingredient.grams(),
                    staple));
        }
        RecipeCardPayload card = new RecipeCardPayload(
                true,
                recipe.id(),
                recipe.name(),
                recipe.version(),
                recipe.step(),
                items,
                recipe.nutrition().energy());
        try {
            return json.writeValueAsString(card);
        } catch (JsonProcessingException error) {
            return "{\"found\":false}";
        }
    }

    private NarrowResult narrow(View catalogView, RecallContext ctx, Set<String> owned) {
        String filter = ctx.filterExpr();
        boolean hasFilter = ctx.hasFilter() && filter != null && !filter.isBlank();
        if (!hasFilter && !ctx.fuzzy()) {
            return NarrowResult.allPublished(catalogView.dishesForOwnedMains(owned));
        }
        try {
            if (hasFilter && !ctx.fuzzy()) {
                return scalarQuery(catalogView, filter);
            }
            return fuzzySearch(catalogView, filter, hasFilter, ctx.fuzzyText());
        } catch (RuntimeException error) {
            if (hasFilter) {
                return NarrowResult.empty(RecallEmptyReason.VECTOR_STORE_UNAVAILABLE, filter, 0);
            }
            return NarrowResult.fallback(catalogView.dishesForOwnedMains(owned), filter);
        }
    }

    private NarrowResult scalarQuery(View catalogView, String filter) {
        if (vectors == null) {
            return NarrowResult.empty(RecallEmptyReason.VECTOR_STORE_UNAVAILABLE, filter, 0);
        }
        List<String> ids = vectors.query(filter, HybridRecall.CANDIDATE_LIMIT);
        if (ids == null || ids.isEmpty()) {
            return NarrowResult.empty(RecallEmptyReason.SCALAR_EMPTY, filter, 0);
        }
        List<Dish> pooled = dishesOf(catalogView, ids);
        if (pooled.isEmpty()) {
            return NarrowResult.empty(RecallEmptyReason.NO_PUBLISHED_INTERSECT, filter, ids.size());
        }
        return new NarrowResult(pooled, RecallEmptyReason.NONE, filter, ids.size());
    }

    private NarrowResult fuzzySearch(View catalogView, String filter, boolean hasFilter, String fuzzyText) {
        List<HybridRecall.Chunk> stored = chunkIndex.all();
        float[] query = null;
        boolean embedFailed = false;
        try {
            query = embedding == null ? null : embedding.embed(fuzzyText);
            if (embedding != null && query == null) {
                embedFailed = true;
            }
        } catch (RuntimeException error) {
            embedFailed = true;
        }
        List<String> byWord = HybridRecall.recall(fuzzyText, stored, null);
        List<String> byVector = List.of();
        if (!embedFailed && vectors != null && query != null) {
            byVector = vectors.search(query, hasFilter ? filter : null, HybridRecall.CANDIDATE_LIMIT);
        }

        if (hasFilter) {
            if (embedFailed && byVector.isEmpty()) {
                return NarrowResult.empty(RecallEmptyReason.EMBED_FAILED, filter, 0);
            }
            if (byVector.isEmpty()) {
                return NarrowResult.empty(RecallEmptyReason.ANN_EMPTY, filter, 0);
            }
            // 有 filter：向量结果为全集，词召回只在该集合内重排
            Set<String> allowed = new LinkedHashSet<>(byVector);
            List<String> wordInFilter = byWord.stream().filter(allowed::contains).toList();
            List<String> clipped = wordInFilter.isEmpty()
                    ? byVector
                    : HybridRecall.merge(wordInFilter, byVector);
            List<Dish> pooled = dishesOf(catalogView, clipped);
            if (pooled.isEmpty()) {
                return NarrowResult.empty(RecallEmptyReason.NO_PUBLISHED_INTERSECT, filter, byVector.size());
            }
            return new NarrowResult(pooled, RecallEmptyReason.NONE, filter, byVector.size());
        }

        List<String> merged = byVector.isEmpty()
                ? HybridRecall.recall(fuzzyText, stored, query)
                : HybridRecall.merge(byWord, byVector);
        if (merged == null || merged.isEmpty()) {
            return NarrowResult.fallback(catalogView.dishes(), filter == null ? "" : filter);
        }
        List<Dish> pooled = dishesOf(catalogView, merged);
        if (pooled.isEmpty()) {
            return NarrowResult.fallback(catalogView.dishes(), filter == null ? "" : filter);
        }
        return new NarrowResult(pooled, RecallEmptyReason.NONE, filter == null ? "" : filter, merged.size());
    }

    private static List<Dish> dishesOf(View catalogView, List<String> ids) {
        List<Dish> pooled = new ArrayList<>();
        if (ids == null) {
            return pooled;
        }
        for (String id : ids) {
            Dish dish = catalogView.dishById().get(id);
            if (dish != null) {
                pooled.add(dish);
            }
        }
        return pooled;
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
            cards.remember(suggestion.id(), json.writeValueAsString(suggestion));
        } catch (JsonProcessingException | RuntimeException ignored) {
            // 缓存失败仍返回本次结果。
        }
    }

    private record NarrowResult(
            List<Dish> dishes, RecallEmptyReason reason, String filterExpr, int recalledCount) {

        static NarrowResult allPublished(List<Dish> dishes) {
            return new NarrowResult(dishes, RecallEmptyReason.NONE, "", dishes == null ? 0 : dishes.size());
        }

        static NarrowResult empty(RecallEmptyReason reason, String filterExpr, int recalledCount) {
            return new NarrowResult(List.of(), reason, filterExpr == null ? "" : filterExpr, recalledCount);
        }

        static NarrowResult fallback(List<Dish> dishes, String filterExpr) {
            return new NarrowResult(
                    dishes,
                    RecallEmptyReason.FALLBACK_ALL_PUBLISHED,
                    filterExpr == null ? "" : filterExpr,
                    dishes == null ? 0 : dishes.size());
        }
    }

    public record Normalized(List<String> ids, List<String> unrecognized) {
    }

    public record Suggestion(
            String id, String name, Integer energy, int score, String reason, String bring, String step) {
    }

    public record MatchReport(
            List<Suggestion> dishes,
            List<String> unrecognized,
            String fallback,
            RecallEmptyReason emptyReason,
            String filterExpr,
            int recalledCount,
            int degradeStep) {

        public MatchReport(List<Suggestion> dishes, List<String> unrecognized, String fallback) {
            this(dishes, unrecognized, fallback, RecallEmptyReason.NONE, "", 0, 0);
        }

        public MatchReport(
                List<Suggestion> dishes,
                List<String> unrecognized,
                String fallback,
                RecallEmptyReason emptyReason,
                String filterExpr,
                int recalledCount) {
            this(dishes, unrecognized, fallback, emptyReason, filterExpr, recalledCount, 0);
        }
    }
}

