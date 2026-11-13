package com.moonligh.nutritionist.domain.safety;

import java.util.List;
import java.util.function.Predicate;

/**
 * 不能自动生成食材克数的病情代码。
 * 来源：设计第 2.3 节和第 2.4 节列出的场景。这里不写血糖、血压的数字阈值。
 * 妊娠和哺乳仍要求专业能量目标，不在这张名单里。
 * 慢性肾脏病 3 至 5 期按食养指南配餐，也不在这张名单里。
 */
public final class AutomaticPlanningExclusions {

    /** 只记录和转介，不自动配餐。 */
    public static final List<String> RECORD_ONLY = List.of(
            "TYPE_1_DIABETES",
            "GESTATIONAL_DIABETES",
            "DIABETES_TYPE_UNKNOWN",
            "DIALYSIS",
            "CIRRHOSIS",
            "HEART_FAILURE",
            "CANCER",
            "DYSPHAGIA",
            "MALABSORPTION",
            "IBD",
            "CELIAC",
            "FRAILTY",
            "SARCOPENIA",
            "LOW_BMI",
            "MALNUTRITION",
            "POST_BARIATRIC",
            "EATING_DISORDER",
            "UNINTENTIONAL_WEIGHT_LOSS");

    /** 当次停止推荐。由病情代码表示，不在代码里另设测量阈值。 */
    public static final List<String> STOP = List.of(
            "SEVERE_HYPOGLYCEMIA",
            "SEVERE_HYPERGLYCEMIA",
            "IMPAIRED_CONSCIOUSNESS",
            "UNSAFE_SWALLOW",
            "SUSPECTED_DKA",
            "HYPEROSMOLAR_HYPERGLYCEMIC_STATE",
            "HYPERTENSIVE_EMERGENCY",
            "PERSISTENT_VOMITING",
            "DEHYDRATION");

    private AutomaticPlanningExclusions() {
    }

    public static boolean blocks(Predicate<String> hasCondition) {
        return RECORD_ONLY.stream().anyMatch(hasCondition) || STOP.stream().anyMatch(hasCondition);
    }
}
