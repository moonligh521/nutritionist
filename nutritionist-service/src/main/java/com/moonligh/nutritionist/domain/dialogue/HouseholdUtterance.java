package com.moonligh.nutritionist.domain.dialogue;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

/**
 * 库存识别用的轻量切词与斤两换算，不是对话意图理解器。
 * 换菜 / 加汤 / 代替 / 多任务意图一律走 IntentUnderstander（模型）。
 * 半斤按 250 克，一斤按 500 克；个数、一颗、一把不算克数。
 */
public final class HouseholdUtterance {

    private static final Pattern SPLIT = Pattern.compile("[\\s、,，;；]+|还有|以及|和");
    private static final Pattern SKIP = Pattern.compile("减肥|减重|减脂|控糖|低盐|咋做|怎么做|我想|应该|上次|之前|昨天|上个月|一个月");

    private HouseholdUtterance() {
    }

    public static Parsed parse(String text) {
        String raw = text == null ? "" : text.strip();
        List<Mention> mentions = new ArrayList<>();
        for (String part : SPLIT.split(raw)) {
            String piece = part.strip();
            if (piece.isEmpty() || SKIP.matcher(piece).find()) {
                continue;
            }
            piece = piece.replaceFirst("^(我家里有|家里有|我有|有)", "");
            BigDecimal grams = grams(piece);
            String name = piece.replace("半斤", "").replace("一斤", "").replaceAll("\\d+(\\.\\d+)?\\s*(克|g|G)", "").strip();
            if (name.length() < 2) {
                continue;
            }
            mentions.add(new Mention(name, grams));
        }
        // goal/recall 不再用词典猜；对话层由模型理解，库存识别只关心食材名与克数。
        return new Parsed(null, false, List.copyOf(mentions));
    }

    private static BigDecimal grams(String piece) {
        if (piece.contains("半斤")) {
            return new BigDecimal("250");
        }
        if (piece.contains("一斤")) {
            return new BigDecimal("500");
        }
        var matcher = Pattern.compile("(\\d+(?:\\.\\d+)?)\\s*(克|g|G)").matcher(piece);
        if (matcher.find()) {
            return new BigDecimal(matcher.group(1));
        }
        return null;
    }

    public record Parsed(String goalCode, boolean recall, List<Mention> mentions) {
    }

    public record Mention(String name, BigDecimal grams) {
    }
}
