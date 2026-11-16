package com.moonligh.nutritionist.statute;

/** 把「第一百四十三条」和「143」对成同一个数字。 */
public final class StatuteNumbers {

    private StatuteNumbers() {
    }

    public static Integer parse(String raw) {
        if (raw == null || raw.isBlank()) {
            return null;
        }
        String text = raw.trim().replace(" ", "");
        text = text.replaceFirst("^第", "");
        text = text.replaceFirst("条.*$", "");
        if (text.matches("\\d+")) {
            return Integer.parseInt(text);
        }
        return chinese(text);
    }

    private static Integer chinese(String text) {
        int total = 0;
        int section = 0;
        int number = 0;
        boolean seen = false;
        for (int index = 0; index < text.length(); index++) {
            char current = text.charAt(index);
            int digit = digit(current);
            if (digit >= 0) {
                number = digit;
                seen = true;
                continue;
            }
            int unit = unit(current);
            if (unit == 0) {
                return null;
            }
            seen = true;
            if (unit == 10_000) {
                section = (section + (number == 0 ? 1 : number)) * unit;
                total += section;
                section = 0;
                number = 0;
            } else {
                section += (number == 0 ? 1 : number) * unit;
                number = 0;
            }
        }
        return seen ? total + section + number : null;
    }

    private static int digit(char current) {
        return switch (current) {
            case '零', '〇' -> 0;
            case '一' -> 1;
            case '二' -> 2;
            case '三' -> 3;
            case '四' -> 4;
            case '五' -> 5;
            case '六' -> 6;
            case '七' -> 7;
            case '八' -> 8;
            case '九' -> 9;
            default -> -1;
        };
    }

    private static int unit(char current) {
        return switch (current) {
            case '十' -> 10;
            case '百' -> 100;
            case '千' -> 1000;
            case '万' -> 10_000;
            default -> 0;
        };
    }
}
