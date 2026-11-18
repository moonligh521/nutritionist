package com.moonligh.nutritionist.service;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicInteger;

import org.junit.jupiter.api.Test;

import com.moonligh.nutritionist.domain.recognition.ModelCompletion;
import com.moonligh.nutritionist.service.DayMenuService.DayMenu;
import com.moonligh.nutritionist.service.DayMenuService.DishView;
import com.moonligh.nutritionist.service.DayMenuService.IngredientView;
import com.moonligh.nutritionist.service.DishRecommendService.MatchReport;
import com.moonligh.nutritionist.service.DishRecommendService.Normalized;
import com.moonligh.nutritionist.service.DishRecommendService.Suggestion;

class IngredientAgentTest {

    @Test
    void withoutModelRunsNormalizeAndSearch() {
        IngredientAgent agent = new IngredientAgent(new FakeTools(false), null);

        IngredientAgent.Turn turn = agent.run(List.of("番茄", "鸡蛋"), null);

        assertEquals(List.of("normalize_ingredients", "search_dishes"), turn.toolCalls());
        assertEquals("7", turn.dishes().getFirst().id());
        assertTrue(!turn.explanation().isBlank());
    }

    @Test
    void unknownFoodIsRefused() {
        IngredientAgent agent = new IngredientAgent(new FakeTools(true), null);

        IngredientAgent.Turn turn = agent.run(List.of("火星菜"), null);

        assertTrue(turn.dishes().isEmpty());
        assertEquals(List.of("火星菜"), turn.unrecognized());
        assertTrue(!turn.fallback().isBlank());
    }

    @Test
    void changedGramsAreRejected() {
        AtomicInteger step = new AtomicInteger();
        ModelCompletion model = prompt -> {
            int current = step.getAndIncrement();
            if (current == 0) {
                return Optional.of("{\"tool\":\"solve_day\"}");
            }
            if (current == 1) {
                return Optional.of("{\"explanation\":\"改少了\",\"items\":[{\"foodItemId\":\"138\",\"grams\":\"1\"}]}");
            }
            return Optional.of("{\"explanation\":\"还是改\",\"items\":[{\"foodItemId\":\"138\",\"grams\":\"9\"}]}");
        };
        IngredientAgent agent = new IngredientAgent(new FakeTools(false), model);

        IngredientAgent.Turn turn = agent.run(
                List.of("番茄"), new IngredientAgent.Profile(2, 30, 2, "cut"), "");

        // 有模型时，检索和求解要等模型自己请求，系统不能提前做完。
        assertEquals(List.of("normalize_ingredients", "solve_day"), turn.toolCalls());
        assertTrue(turn.explanation().contains("138"));
        assertTrue(turn.explanation().contains("200"));
        assertTrue(!turn.explanation().contains("还是改"));
    }

    @Test
    void modelReadsTheRecipeBeforeExplaining() {
        List<String> prompts = new java.util.ArrayList<>();
        ModelCompletion model = prompt -> {
            prompts.add(prompt);
            if (prompts.size() == 1) {
                return Optional.of("{\"tool\":\"read_recipe\",\"id\":\"7\"}");
            }
            return Optional.of("{\"explanation\":\"按做法来\",\"items\":[]}");
        };
        IngredientAgent agent = new IngredientAgent(new FakeTools(false), model);

        IngredientAgent.Turn turn = agent.run(List.of("番茄"), null, "今晚清淡");

        assertTrue(prompts.get(0).contains("今晚清淡"));
        assertTrue(prompts.get(1).contains("西红柿切块"));
        assertEquals(List.of("normalize_ingredients", "read_recipe"), turn.toolCalls());
        assertEquals("按做法来", turn.explanation());
    }

    @Test
    void modelReadsEmptyLongTermMemory() {
        List<String> prompts = new java.util.ArrayList<>();
        ModelCompletion model = prompt -> {
            prompts.add(prompt);
            if (prompts.size() == 1) {
                return Optional.of("{\"tool\":\"read_long_term_memory\"}");
            }
            return Optional.of("{\"explanation\":\"没有病情记录\",\"items\":[]}");
        };
        IngredientAgent agent = new IngredientAgent(new FakeTools(false), model);

        agent.run(List.of("番茄"), null, "");

        assertTrue(prompts.get(1).contains("\"conditions\":[]"));
        assertTrue(prompts.get(1).contains("\"measurementStopsPlanning\":false"));
    }

    @Test
    void modelSeesLockedGramsFromMealFacts() {
        List<String> prompts = new java.util.ArrayList<>();
        ModelCompletion model = prompt -> {
            prompts.add(prompt);
            if (prompts.size() == 1) {
                return Optional.of("{\"tool\":\"solve_day\"}");
            }
            if (prompts.size() == 2) {
                return Optional.of("{\"tool\":\"read_meal_facts\"}");
            }
            return Optional.of("{\"explanation\":\"锁定没变\",\"items\":[{\"foodItemId\":\"138\",\"grams\":\"200\"}]}");
        };
        IngredientAgent agent = new IngredientAgent(new FakeTools(false), model);

        IngredientAgent.Turn turn = agent.run(
                List.of("番茄"), new IngredientAgent.Profile(2, 30, 2, "cut"), "");

        assertTrue(prompts.get(2).contains("本餐食材"));
        assertEquals("锁定没变", turn.explanation());
    }

    @Test
    void modelTimeoutUsesTheFoodRules() {
        ModelCompletion model = prompt -> Optional.empty();
        IngredientAgent agent = new IngredientAgent(new FakeTools(false), model);

        IngredientAgent.Turn turn = agent.run(List.of("番茄", "鸡蛋"), null, "");

        assertEquals(List.of("normalize_ingredients", "search_dishes"), turn.toolCalls());
        assertEquals("7", turn.dishes().getFirst().id());
        assertTrue(turn.explanation().contains("模型超时"));
        assertTrue(turn.explanation().contains("主料都有"));
    }

    @Test
    void modelTimeoutWithNoDishOnlyShowsTheNotice() {
        ModelCompletion model = prompt -> Optional.empty();
        IngredientAgent agent = new IngredientAgent(new FakeTools(true), model);

        IngredientAgent.Turn turn = agent.run(List.of("火星菜"), null, "随便编一道");

        assertTrue(turn.dishes().isEmpty());
        assertTrue(turn.explanation().contains("模型超时"));
        assertTrue(turn.explanation().contains("不会另外编一道"));
        assertTrue(!turn.explanation().contains("随便编一道"));
    }

    @Test
    void emptySearchStopsTheModel() {
        AtomicInteger calls = new AtomicInteger();
        ModelCompletion model = prompt -> {
            calls.incrementAndGet();
            return Optional.of("{\"tool\":\"search_dishes\"}");
        };
        IngredientAgent agent = new IngredientAgent(new FakeTools(true), model);

        IngredientAgent.Turn turn = agent.run(List.of("火星菜"), null, "随便编一道");

        assertEquals(1, calls.get());
        assertTrue(turn.dishes().isEmpty());
        assertEquals(List.of("火星菜"), turn.unrecognized());
        assertTrue(!turn.fallback().isBlank());
        assertTrue(!turn.explanation().contains("随便编一道"));
    }

    /** 测试用的工具。不连数据库，返回写死的菜和克数。 */
    private static final class FakeTools implements IngredientAgent.ToolBox {
        private final boolean unknown;

        private FakeTools(boolean unknown) {
            this.unknown = unknown;
        }

        @Override
        public Normalized normalize(List<String> foods) {
            if (unknown) {
                return new Normalized(List.of(), List.of("火星菜"));
            }
            return new Normalized(List.of("138", "580"), List.of());
        }

        @Override
        public MatchReport search(List<String> ids, String text) {
            if (ids.isEmpty()) {
                return new MatchReport(List.of(), List.of(), "没有主料齐全的已发布菜，不会另外编一道。");
            }
            Suggestion dish = new Suggestion("7", "番茄炒蛋", 250, 100, "主料都有：鸡蛋、西红柿。", "", "步骤");
            return new MatchReport(List.of(dish), List.of(), "");
        }

        @Override
        public IngredientAgent.SolveOutcome solve(IngredientAgent.Profile profile, List<String> ids) {
            DayMenu day = new DayMenu(1743, List.of(), List.of(), List.of(
                    new DishView("7", BigDecimal.ONE, 250, List.of(
                            new IngredientView("138", "西红柿", new BigDecimal("200"))))));
            return new IngredientAgent.SolveOutcome(true, "", day);
        }

        @Override
        public String readRecipe(String id) {
            if (!"7".equals(id)) {
                return "{\"found\":false}";
            }
            return "{\"id\":\"7\",\"step\":\"西红柿切块\"}";
        }

        @Override
        public String memory() {
            return "{\"conditions\":[],\"medications\":[],\"measurementStopsPlanning\":false}";
        }
    }
}
