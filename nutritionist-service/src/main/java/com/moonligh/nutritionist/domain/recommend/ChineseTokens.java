package com.moonligh.nutritionist.domain.recommend;

import java.util.ArrayList;
import java.util.List;

/** 中文按相邻两个字切，英文按单词切。用来做关键词检索，不是判断能不能做。 */
public final class ChineseTokens {

    private ChineseTokens() {
    }

    public static List<String> of(String text) {
        List<String> tokens = new ArrayList<>();
        if (text == null || text.isBlank()) {
            return tokens;
        }
        StringBuilder latin = new StringBuilder();
        StringBuilder cjk = new StringBuilder();
        for (int index = 0; index < text.length(); index++) {
            char current = text.charAt(index);
            if (isCjk(current)) {
                flushLatin(tokens, latin);
                cjk.append(current);
            } else if (Character.isLetterOrDigit(current)) {
                flushCjk(tokens, cjk);
                latin.append(Character.toLowerCase(current));
            } else {
                flushLatin(tokens, latin);
                flushCjk(tokens, cjk);
            }
        }
        flushLatin(tokens, latin);
        flushCjk(tokens, cjk);
        return tokens;
    }

    private static void flushLatin(List<String> tokens, StringBuilder latin) {
        if (!latin.isEmpty()) {
            tokens.add(latin.toString());
            latin.setLength(0);
        }
    }

    private static void flushCjk(List<String> tokens, StringBuilder cjk) {
        if (cjk.isEmpty()) {
            return;
        }
        if (cjk.length() == 1) {
            tokens.add(cjk.toString());
        } else {
            String word = cjk.toString();
            for (int index = 0; index < word.length() - 1; index++) {
                tokens.add(word.substring(index, index + 2));
            }
        }
        cjk.setLength(0);
    }

    private static boolean isCjk(char current) {
        return current >= 0x4E00 && current <= 0x9FFF;
    }
}
