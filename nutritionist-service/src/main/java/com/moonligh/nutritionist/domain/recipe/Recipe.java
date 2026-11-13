package com.moonligh.nutritionist.domain.recipe;

import java.util.List;

/** 一道菜谱。只有已发布的版本才能拿来配餐。 */
public record Recipe(
        /** 菜谱标识。 */
        String recipeId,
        /** 菜谱版本。配料变更产生新版本。 */
        String version,
        /** 审核状态。未发布版本不可入选。 */
        RecipeStatus status,
        /** 配料。 */
        List<RecipeIngredient> ingredients,
        /** 步骤。按序号执行。 */
        List<RecipeStep> steps,
        /** 完成这道菜需要的厨具。 */
        String cookware) {

    public Recipe(
            String recipeId,
            String version,
            RecipeStatus status,
            List<RecipeIngredient> ingredients,
            List<RecipeStep> steps) {
        this(recipeId, version, status, ingredients, steps, null);
    }

    public Recipe {
        ingredients = List.copyOf(ingredients);
        steps = List.copyOf(steps);
    }
}
