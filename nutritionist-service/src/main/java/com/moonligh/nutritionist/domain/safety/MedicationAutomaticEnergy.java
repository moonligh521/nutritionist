package com.moonligh.nutritionist.domain.safety;

import java.util.List;
import java.util.Locale;
import java.util.function.Predicate;

/**
 * 设计第 2.2 节：胰岛素、磺脲类不能自行推能量。
 * SGLT2 抑制剂只在同时有断食、低碳或当次急性情况时不能自行推能量。
 * 类别代码是本系统的用药分类，不是剂量。
 */
public final class MedicationAutomaticEnergy {

    /** 胰岛素。 */
    public static final int INSULIN = 1;
    /** 磺脲类。 */
    public static final int SULFONYLUREA = 2;
    /** SGLT2 抑制剂。 */
    public static final int SGLT2_INHIBITOR = 3;
    /** 断食。与 SGLT2 抑制剂同时存在时不能自行推能量。 */
    public static final String FASTING = "FASTING";
    /** 低碳。与 SGLT2 抑制剂同时存在时不能自行推能量。 */
    public static final String LOW_CARB = "LOW_CARB";

    private MedicationAutomaticEnergy() {
    }

    public static boolean requiresProfessionalEnergy(
            List<String> medicationNames,
            List<Integer> categoryCodes,
            Predicate<String> hasCondition) {
        boolean insulin = hasCategory(categoryCodes, INSULIN) || named(medicationNames, true, false, false);
        boolean sulfonylurea = hasCategory(categoryCodes, SULFONYLUREA) || named(medicationNames, false, true, false);
        if (insulin || sulfonylurea) {
            return true;
        }
        boolean sglt2 = hasCategory(categoryCodes, SGLT2_INHIBITOR) || named(medicationNames, false, false, true);
        return sglt2 && sglt2Context(hasCondition);
    }

    private static boolean sglt2Context(Predicate<String> hasCondition) {
        if (hasCondition.test(FASTING) || hasCondition.test(LOW_CARB)) {
            return true;
        }
        return AutomaticPlanningExclusions.STOP.stream().anyMatch(hasCondition);
    }

    private static boolean hasCategory(List<Integer> categoryCodes, int code) {
        return categoryCodes != null && categoryCodes.stream().anyMatch(item -> item != null && item == code);
    }

    private static boolean named(List<String> names, boolean insulin, boolean sulfonylurea, boolean sglt2) {
        if (names == null) {
            return false;
        }
        for (String name : names) {
            if (name == null || name.isBlank()) {
                continue;
            }
            String upper = name.toUpperCase(Locale.ROOT);
            if (insulin && (upper.contains("INSULIN") || name.contains("胰岛素"))) {
                return true;
            }
            if (sulfonylurea && (upper.contains("SULFONYLUREA") || name.contains("磺脲"))) {
                return true;
            }
            if (sglt2 && (upper.contains("SGLT2") || name.contains("列净"))) {
                return true;
            }
        }
        return false;
    }
}
