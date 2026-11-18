package com.moonligh.nutritionist.service;

import java.util.List;

import org.springframework.stereotype.Component;

import com.moonligh.nutritionist.config.RecallDegradeProperties;
import com.moonligh.nutritionist.domain.recommend.RecallContext;
import com.moonligh.nutritionist.domain.recommend.RecallEmptyReason;

/**
 * 软约束降级阶梯。硬约束/点名菜系空结果不降级。
 */
@Component
public class RecallDegradeLadder {

    private final RecallDegradeProperties properties;

    /** 生产注入；单测传 properties（含 enabled）。无参构造会丢掉 yml 绑定，已删除。 */
    public RecallDegradeLadder(RecallDegradeProperties properties) {
        this.properties = properties == null ? new RecallDegradeProperties() : properties;
    }

    public boolean enabled() {
        return properties.isEnabled();
    }

    /** 点名菜系且标量空 → 禁止降级（Accept R8）。 */
    public boolean allowDegrade(RecallContext ctx, RecallEmptyReason reason) {
        if (!enabled() || ctx == null) {
            return false;
        }
        if (!ctx.cuisine().isBlank()
                && (reason == RecallEmptyReason.SCALAR_EMPTY
                        || reason == RecallEmptyReason.FILTER_FAIL_CLOSED
                        || reason == RecallEmptyReason.NO_PUBLISHED_INTERSECT)) {
            return false;
        }
        return reason == RecallEmptyReason.SCALAR_EMPTY
                || reason == RecallEmptyReason.FILTER_FAIL_CLOSED
                || reason == RecallEmptyReason.ANN_EMPTY
                || reason == RecallEmptyReason.NO_FEASIBLE_MAINS;
    }

    /**
     * @return 下一步上下文；null 表示无更多降级步骤
     */
    public RecallContext next(RecallContext ctx, int currentStep) {
        if (ctx == null) {
            return null;
        }
        return switch (currentStep) {
            case 0 -> dropTagsAndFuzzy(ctx); // → step 1
            case 1 -> dropCuisineKeepConditions(ctx); // → step 2
            case 2 -> mainsAndClinicalOnly(ctx); // → step 3
            default -> null;
        };
    }

    public static RecallContext dropTagsAndFuzzy(RecallContext ctx) {
        return new RecallContext(ctx.cuisine(), ctx.kind(), List.of(), ctx.conditions(), "");
    }

    public static RecallContext dropCuisineKeepConditions(RecallContext ctx) {
        return new RecallContext("", ctx.kind(), List.of(), ctx.conditions(), "");
    }

    public static RecallContext mainsAndClinicalOnly(RecallContext ctx) {
        return new RecallContext("", "", List.of(), ctx.conditions(), "");
    }
}
