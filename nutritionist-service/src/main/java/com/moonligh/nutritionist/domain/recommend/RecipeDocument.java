package com.moonligh.nutritionist.domain.recommend;

import java.util.List;

/** 一道已发布菜写成一条文档。不按字数把做法切成多段。 */
public final class RecipeDocument {

    private RecipeDocument() {
    }

    public static String text(String name, List<String> ingredientNames, String step) {
        String foods = ingredientNames == null || ingredientNames.isEmpty()
                ? ""
                : String.join(" ", ingredientNames);
        String method = step == null ? "" : step;
        return "菜名：" + (name == null ? "" : name) + "\n食材：" + foods + "\n做法：" + method;
    }
}
