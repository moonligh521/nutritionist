package com.moonligh.nutritionist.infrastructure.persistence;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface SolvedMealMapper {

    record DishRow(String recipeId, BigDecimal portions, String foodItemId, BigDecimal grams, String stepText) {
    }

    int deleteDishes(@Param("patientId") String patientId, @Param("mealDate") LocalDate mealDate);

    int deleteShortages(@Param("patientId") String patientId, @Param("mealDate") LocalDate mealDate);

    int insertShortage(
            @Param("patientId") String patientId,
            @Param("mealDate") LocalDate mealDate,
            @Param("foodItemId") String foodItemId);

    int insertDish(
            @Param("patientId") String patientId,
            @Param("mealDate") LocalDate mealDate,
            @Param("recipeId") String recipeId,
            @Param("portions") BigDecimal portions,
            @Param("foodItemId") String foodItemId,
            @Param("grams") BigDecimal grams,
            @Param("stepText") String stepText,
            @Param("representsDailyRemainder") int representsDailyRemainder);

    List<DishRow> findDishes(@Param("patientId") String patientId, @Param("mealDate") LocalDate mealDate);

    List<Integer> findRemainder(@Param("patientId") String patientId, @Param("mealDate") LocalDate mealDate);

    List<String> findShortages(@Param("patientId") String patientId, @Param("mealDate") LocalDate mealDate);
}
