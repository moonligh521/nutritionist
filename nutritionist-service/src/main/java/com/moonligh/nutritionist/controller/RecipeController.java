package com.moonligh.nutritionist.controller;

import java.math.BigDecimal;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.moonligh.consult.framework.Result;
import com.moonligh.nutritionist.domain.recipe.Recipe;
import com.moonligh.nutritionist.service.RecipeCatalogService;

@RestController
@RequestMapping("/api/nutrition/recipes")
public class RecipeController {

    private final RecipeCatalogService recipes;

    public RecipeController(RecipeCatalogService recipes) {
        this.recipes = recipes;
    }

    @GetMapping("/{recipeId}/versions/{version}")
    public Result<Recipe> detail(@PathVariable String recipeId, @PathVariable String version) {
        return Result.ok(recipes.detail(recipeId, version));
    }

    @PostMapping("/{recipeId}/scale")
    public Result<Recipe> scale(@PathVariable String recipeId, @RequestBody ScaleRecipeReq request) {
        return Result.ok(recipes.scale(recipeId, request.version(), request.servings()));
    }

    public record ScaleRecipeReq(String version, BigDecimal servings) {
    }
}
