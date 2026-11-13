package com.moonligh.nutritionist.domain.workflow;

import java.util.Set;

/**
 * 模型在生成说明时可以调用的只读工具。
 * 改目标、确认方案、写摄入、改药、放宽禁忌都不在白名单里。
 */
public final class ToolCatalog {

    public static final String READ_MEAL_FACTS = "read_meal_facts";
    public static final String READ_LONG_TERM_MEMORY = "read_long_term_memory";
    public static final Set<String> ALLOWED = Set.of(READ_MEAL_FACTS, READ_LONG_TERM_MEMORY);
    public static final Set<String> FORBIDDEN = Set.of(
            "update_target",
            "confirm_plan",
            "record_intake",
            "change_medication",
            "relax_constraint");

    private ToolCatalog() {
    }

    public static boolean allowed(String name) {
        return name != null && ALLOWED.contains(name);
    }
}
