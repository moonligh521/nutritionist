package com.moonligh.nutritionist.domain.recommend;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.junit.jupiter.api.Test;

class RecipeSheetTest {

    @Test
    void templateCoversKindsCuisineAndTags() {
        String text = new String(RecipeSheet.template(), StandardCharsets.UTF_8);
        assertTrue(text.contains("汤"));
        assertTrue(text.contains("主食"));
        assertTrue(text.contains("小吃"));
        assertTrue(text.contains("菜系"));
        assertTrue(text.contains("减肥"));
        assertTrue(text.contains("控糖"));
        assertTrue(text.contains("川菜") || text.contains("家常"));
        assertEquals(0, RecipeSheet.parse(text).size());
    }

    @Test
    void uploadVectorizesOneRowAndKeepsUnpublishedOutOfPlanning() {
        String csv = """
                菜号,菜名,种类,菜系,标签,主料,辅料,调味,做法,厨具,示例
                wl-egg-tomato,番茄炒蛋,菜,家常,减肥;减脂,西红柿:200;鸡蛋:2,,,西红柿切块。,锅,否
                new-soup,紫菜蛋花汤,汤,家常,控糖;控盐,紫菜:5;鸡蛋:1,,,水开后淋蛋液。,锅,
                """;
        List<RecipeVectorizer.Stored> saved = new ArrayList<>();
        RecipeVectorizer.Report report = RecipeVectorizer.store(
                csv, Set.of("wl-egg-tomato"), text -> new float[] {1f, 0f}, saved::add);

        assertEquals(2, saved.size());
        assertEquals(2, report.vectorized());
        assertEquals(1, report.pending());
        assertEquals(List.of("紫菜蛋花汤"), report.pendingNames());
        assertTrue(saved.getFirst().document().contains("种类：菜"));
        assertTrue(saved.getFirst().document().contains("菜系：家常"));
        assertTrue(saved.getFirst().document().contains("减肥"));
        assertTrue(!saved.getFirst().document().contains("\n种类：菜\n种类："));
    }
}
