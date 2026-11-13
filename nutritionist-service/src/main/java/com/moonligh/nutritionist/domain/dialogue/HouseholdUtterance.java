package com.moonligh.nutritionist.domain.dialogue;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

/**
 * 把一句家常话拆成食材名、数量和目标。
 * 个数、一颗、一把不算克数。半斤按 250 克，一斤按 500 克。
 */
public final class HouseholdUtterance {

    private static final Pattern SPLIT = Pattern.compile("[\\s、,，;；]+|还有|以及|和");
    private static final Pattern INTENT = Pattern.compile("减肥|减重|减脂|控糖|低盐|咋做|怎么做|我想|应该");
    private static final Pattern RECALL = Pattern.compile("上次|之前|昨天|上个月|一个月");

    private HouseholdUtterance() {
    }

    public static Parsed parse(String text) {
        String raw = text == null ? "" : text.strip();
        String goal = goal(raw);
        boolean recall = RECALL.matcher(raw).find();
        List<Mention> mentions = new ArrayList<>();
        for (String part : SPLIT.split(raw)) {
            String piece = part.strip();
            if (piece.isEmpty() || INTENT.matcher(piece).find() || RECALL.matcher(piece).find()) {
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
        return new Parsed(goal, recall, List.copyOf(mentions));
    }

    private static String goal(String text) {
        if (text.contains("减肥") || text.contains("减重") || text.contains("减脂")) {
            return "WEIGHT_LOSS";
        }
        if (text.contains("控糖") || text.contains("血糖")) {
            return "GLUCOSE";
        }
        if (text.contains("低盐") || text.contains("少盐")) {
            return "LOW_SODIUM";
        }
        return null;
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
