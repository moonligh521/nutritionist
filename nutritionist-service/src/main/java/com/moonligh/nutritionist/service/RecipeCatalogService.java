package com.moonligh.nutritionist.service;

import java.math.BigDecimal;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Service;

import com.moonligh.consult.framework.BusinessException;
import com.moonligh.consult.framework.ErrorCode;
import com.moonligh.nutritionist.domain.recipe.Recipe;
import com.moonligh.nutritionist.domain.recipe.RecipeIngredient;
import com.moonligh.nutritionist.domain.recipe.RecipeStatus;

@Service
public class RecipeCatalogService {

    private final ConcurrentHashMap<String, Recipe> recipes = new ConcurrentHashMap<>();

    public void register(Recipe recipe) {
        recipes.put(key(recipe.recipeId(), recipe.version()), recipe);
    }

    public Recipe detail(String recipeId, String version) {
        Recipe recipe = recipes.get(key(recipeId, version));
        if (recipe == null || recipe.status() != RecipeStatus.PUBLISHED) {
            throw new BusinessException(ErrorCode.RECIPE_NOT_PUBLISHED);
        }
        return recipe;
    }

    public Recipe scale(String recipeId, String version, BigDecimal servings) {
        if (servings == null || servings.signum() <= 0) {
            throw new BusinessException(ErrorCode.PARAM_INVALID);
        }
        Recipe source = detail(recipeId, version);
        var ingredients = source.ingredients().stream()
                .map(item -> new RecipeIngredient(
                        item.foodItemId(), item.quantity().multiply(servings), item.unitCode()))
                .toList();
        return new Recipe(source.recipeId(), source.version(), source.status(), ingredients, source.steps());
    }

    private static String key(String recipeId, String version) {
        return recipeId + "|" + version;
    }
}
