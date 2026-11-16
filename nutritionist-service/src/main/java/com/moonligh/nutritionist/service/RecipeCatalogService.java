package com.moonligh.nutritionist.service;

import java.math.BigDecimal;

import org.springframework.beans.factory.ObjectProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moonligh.consult.framework.BusinessException;
import com.moonligh.consult.framework.ErrorCode;
import com.moonligh.nutritionist.domain.common.EntityTable;
import com.moonligh.nutritionist.infrastructure.persistence.NutritionDataStore;
import com.moonligh.nutritionist.domain.recipe.Recipe;
import com.moonligh.nutritionist.domain.recipe.RecipeIngredient;
import com.moonligh.nutritionist.domain.recipe.RecipeStatus;

/**
 * 已审核菜谱目录。只有已发布的菜谱才能拿来配餐。
 */
@Service
public class RecipeCatalogService {

    private final EntityTable<Recipe> recipes = new EntityTable<>(recipe -> key(recipe.recipeId(), recipe.version()));
    private final NutritionDataStore records;
    private final DishCardCache cards;

    public RecipeCatalogService() {
        this(null, (DishCardCache) null);
    }

    public RecipeCatalogService(NutritionDataStore records) {
        this(records, (DishCardCache) null);
    }

    /** 测试直接传入缓存，用来确认改菜时会删掉旧菜卡。 */
    RecipeCatalogService(NutritionDataStore records, DishCardCache cards) {
        this.records = records;
        this.cards = cards;
    }

    @Autowired
    public RecipeCatalogService(NutritionDataStore records, ObjectProvider<DishCardCache> cards) {
        this(records, cards.getIfAvailable());
    }

    public void register(Recipe recipe) {
        recipes.save(recipe);
        if (records != null) {
            records.saveRecipe(recipe);
        }
        if (cards != null) {
            // 配料、做法或上下架变了，旧菜卡不能继续留在 Redis。
            cards.forget(recipe.recipeId());
        }
    }

    public Recipe detail(String recipeId, String version) {
        Recipe recipe = recipes.find(key(recipeId, version)).orElse(null);
        if (recipe == null && records != null) {
            recipe = records.findRecipe(recipeId, version).orElse(null);
            if (recipe != null) {
                recipes.save(recipe);
            }
        }
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
