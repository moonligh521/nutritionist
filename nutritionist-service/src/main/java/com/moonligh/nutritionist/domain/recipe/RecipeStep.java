package com.moonligh.nutritionist.domain.recipe;

/** 菜谱里的一步做法。 */
public record RecipeStep(
        /** 步骤序号。从 1 起。 */
        int stepNo,
        /** 步骤说明。 */
        String instruction) {
}
