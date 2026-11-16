package com.moonligh.nutritionist.domain.recommend;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;
import java.util.Set;

import org.junit.jupiter.api.Test;

import com.moonligh.nutritionist.domain.recommend.IngredientDishRanker.Dish;
import com.moonligh.nutritionist.domain.recommend.IngredientDishRanker.Ingredient;
import com.moonligh.nutritionist.domain.recommend.IngredientDishRanker.Match;

class IngredientDishRankerTest {

    private static final Ingredient EGG = new Ingredient("580", "鸡蛋", false);
    private static final Ingredient TOMATO = new Ingredient("138", "西红柿", false);
    private static final Ingredient BEEF = new Ingredient("352", "猪里脊", false);
    private static final Ingredient OIL = new Ingredient("654", "菜籽油", true);
    private static final Ingredient SALT = new Ingredient("668", "食盐", true);
    private static final Ingredient SCALLION = new Ingredient("186", "大葱", false);

    @Test
    void dropsDishWhenAMainIngredientIsMissing() {
        Dish eggTomato = dish("wl-egg-tomato", "番茄炒蛋", List.of(EGG, TOMATO), List.of(OIL, SALT));
        Dish pork = dish("wl-pork", "里脊", List.of(BEEF), List.of(OIL));

        List<Match> matches = IngredientDishRanker.top(Set.of("580", "138"), List.of(eggTomato, pork));

        assertEquals(List.of("wl-egg-tomato"), matches.stream().map(match -> match.dish().id()).toList());
        assertTrue(matches.getFirst().bring().isEmpty());
    }

    @Test
    void returnsNothingWhenTheUserListedNoFood() {
        Dish egg = dish("wl-boiled-egg", "水煮蛋", List.of(EGG), List.of());

        assertTrue(IngredientDishRanker.top(Set.of(), List.of(egg)).isEmpty());
    }

    @Test
    void ranksRicherMainsFirstAndKeepsThree() {
        List<Dish> dishes = List.of(
                dish("one", "一", List.of(EGG), List.of()),
                dish("two", "二", List.of(EGG, TOMATO), List.of(SCALLION)),
                dish("three", "三", List.of(EGG, TOMATO, BEEF), List.of()),
                dish("four", "四", List.of(TOMATO), List.of()));

        List<Match> matches = IngredientDishRanker.top(Set.of("580", "138", "352"), dishes);

        assertEquals(List.of("three", "one", "four"), matches.stream().map(match -> match.dish().id()).toList());
        assertEquals(85, IngredientDishRanker.score(Set.of("580", "138", "352"), dishes.get(1)).score());
        assertEquals(List.of("大葱"), IngredientDishRanker.score(Set.of("580", "138", "352"), dishes.get(1)).bring());
    }

    @Test
    void dropsACookableDishWhenTooManyAuxIngredientsAreMissing() {
        List<Ingredient> missing = List.of(
                new Ingredient("1", "一", false),
                new Ingredient("2", "二", false),
                new Ingredient("3", "三", false),
                new Ingredient("4", "四", false),
                new Ingredient("5", "五", false));
        Dish dish = dish("many", "辅料太多", List.of(EGG), missing);

        assertTrue(IngredientDishRanker.top(Set.of("580"), List.of(dish)).isEmpty());
        assertEquals(25, IngredientDishRanker.score(Set.of("580"), dish).score());
    }

    private static Dish dish(String id, String name, List<Ingredient> mains, List<Ingredient> aux) {
        return new Dish(id, name, 100, "步骤", mains, aux);
    }
}
