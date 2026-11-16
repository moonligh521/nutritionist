package com.moonligh.nutritionist.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.moonligh.nutritionist.domain.recognition.ModelCompletion;
import com.moonligh.nutritionist.domain.solver.SolverInfeasibleException;

/** 把真实的检索和求解接进循环。模型没有配置时，complete 会是空的，循环走兜底说明。 */
@Service
public class AgentTurnService implements IngredientAgent.ToolBox {

    private final DishRecommendService dishes;
    private final DayMenuService dayMenu;
    private final ModelCompletion model;

    public AgentTurnService(DishRecommendService dishes, DayMenuService dayMenu, ModelCompletion model) {
        this.dishes = dishes;
        this.dayMenu = dayMenu;
        this.model = model;
    }

    public IngredientAgent.Turn turn(List<String> foods, IngredientAgent.Profile profile, String text) {
        return new IngredientAgent(this, model).run(foods, profile, text);
    }

    @Override
    public DishRecommendService.Normalized normalize(List<String> foods) {
        return dishes.normalize(foods, "");
    }

    @Override
    public DishRecommendService.MatchReport search(List<String> ids, String text) {
        return dishes.matchIds(ids, List.of(), "", text);
    }

    @Override
    public IngredientAgent.SolveOutcome solve(IngredientAgent.Profile profile, List<String> ids) {
        try {
            DayMenuService.DayMenu day = dayMenu.plan(
                    profile.sex(), profile.age(), profile.activity(), profile.mode(), ids);
            return new IngredientAgent.SolveOutcome(true, "", day);
        } catch (SolverInfeasibleException error) {
            return new IngredientAgent.SolveOutcome(false, "按这个额度和食材配不出完整的一天", null);
        } catch (IllegalArgumentException error) {
            return new IngredientAgent.SolveOutcome(false, error.getMessage(), null);
        }
    }

    @Override
    public String readRecipe(String id) {
        return dishes.recipeCard(id);
    }

    @Override
    public String memory() {
        // 这个回合没有患者编号。病情和用药在挂号同一库里，这里不猜是谁，所以三项皆空。
        // 这些字段只给说明引用，不参与能不能做。
        return "{\"conditions\":[],\"medications\":[],\"measurementStopsPlanning\":false}";
    }
}
