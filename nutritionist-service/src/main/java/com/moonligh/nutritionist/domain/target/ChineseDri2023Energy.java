package com.moonligh.nutritionist.domain.target;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Optional;

/**
 * 中国营养学会《中国居民膳食营养素参考摄入量（2023版）》成年能量需要量。
 * 已收录 18 岁及以上各成年年龄段。表内单位是兆焦，脚注写明 1 兆焦按 239 千卡换算。
 * 活动水平代码 1、2、3 对应表中的 PALⅠ、PALⅡ、PALⅢ。
 * 65 岁及以上的 PALⅢ 在表中为空，不估算。18 岁以下不估算。
 */
public final class ChineseDri2023Energy {

    public static final String RULE_ID = "cns-dri-2023-eer";
    /** 膳食纤维适宜摄入量下限，单位克。表内写明 25 至 30，全天按 25 克执行。 */
    public static final BigDecimal FIBER_AI_MINIMUM_GRAMS = new BigDecimal("25");
    private static final BigDecimal KCAL_PER_MEGAJOULE = new BigDecimal("239");

    private ChineseDri2023Energy() {
    }

    public static Optional<BigDecimal> kcal(int sexCode, int ageYears, int activityLevelCode) {
        String megajoules = switch (sexCode) {
            case 1 -> male(ageYears, activityLevelCode);
            case 2 -> female(ageYears, activityLevelCode);
            default -> null;
        };
        if (megajoules == null) {
            return Optional.empty();
        }
        return Optional.of(new BigDecimal(megajoules).multiply(KCAL_PER_MEGAJOULE).setScale(0, RoundingMode.HALF_UP));
    }

    /**
     * 同一套表里的蛋白质推荐摄入量，单位克。
     * 18 至 64 岁男性 65、女性 55；65 岁及以上男性 72、女性 62。
     */
    public static Optional<BigDecimal> proteinGrams(int sexCode, int ageYears) {
        if (ageYears < 18) {
            return Optional.empty();
        }
        if (sexCode == 1) {
            return Optional.of(new BigDecimal(ageYears <= 64 ? "65" : "72"));
        }
        if (sexCode == 2) {
            return Optional.of(new BigDecimal(ageYears <= 64 ? "55" : "62"));
        }
        return Optional.empty();
    }

    /**
     * 脂肪供能不超过能量的 30%。同一套参考摄入量表写明总脂肪占能量 20% 至 30%。
     * 每克脂肪按 9 千卡换算。只取上限，避免现有菜谱达不到下限时整餐无解。
     */
    public static BigDecimal fatMaximumGrams(BigDecimal energyKcal) {
        return energyKcal.multiply(new BigDecimal("0.30")).divide(new BigDecimal("9"), 1, RoundingMode.HALF_UP);
    }

    /** 脂肪供能不低于能量的 20%。作为软目标，达不到时不把整餐判成无解。 */
    public static BigDecimal fatMinimumGrams(BigDecimal energyKcal) {
        return energyKcal.multiply(new BigDecimal("0.20")).divide(new BigDecimal("9"), 1, RoundingMode.HALF_UP);
    }

    private static String male(int ageYears, int activityLevelCode) {
        if (ageYears >= 18 && ageYears <= 29) {
            return switch (activityLevelCode) {
                case 1 -> "9.00";
                case 2 -> "10.67";
                case 3 -> "12.55";
                default -> null;
            };
        }
        if (ageYears >= 30 && ageYears <= 49) {
            return switch (activityLevelCode) {
                case 1 -> "8.58";
                case 2 -> "10.46";
                case 3 -> "12.34";
                default -> null;
            };
        }
        if (ageYears >= 50 && ageYears <= 64) {
            return switch (activityLevelCode) {
                case 1 -> "8.16";
                case 2 -> "10.04";
                case 3 -> "11.72";
                default -> null;
            };
        }
        if (ageYears >= 65 && ageYears <= 74) {
            return switch (activityLevelCode) {
                case 1 -> "7.95";
                case 2 -> "9.62";
                default -> null;
            };
        }
        if (ageYears >= 75) {
            return switch (activityLevelCode) {
                case 1 -> "7.53";
                case 2 -> "9.20";
                default -> null;
            };
        }
        return null;
    }

    private static String female(int ageYears, int activityLevelCode) {
        if (ageYears >= 18 && ageYears <= 29) {
            return switch (activityLevelCode) {
                case 1 -> "7.11";
                case 2 -> "8.79";
                case 3 -> "10.25";
                default -> null;
            };
        }
        if (ageYears >= 30 && ageYears <= 49) {
            return switch (activityLevelCode) {
                case 1 -> "7.11";
                case 2 -> "8.58";
                case 3 -> "10.04";
                default -> null;
            };
        }
        if (ageYears >= 50 && ageYears <= 64) {
            return switch (activityLevelCode) {
                case 1 -> "6.69";
                case 2 -> "8.16";
                case 3 -> "9.62";
                default -> null;
            };
        }
        if (ageYears >= 65 && ageYears <= 74) {
            return switch (activityLevelCode) {
                case 1 -> "6.49";
                case 2 -> "7.74";
                default -> null;
            };
        }
        if (ageYears >= 75) {
            return switch (activityLevelCode) {
                case 1 -> "6.28";
                case 2 -> "7.32";
                default -> null;
            };
        }
        return null;
    }
}
