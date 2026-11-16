package com.moonligh.nutritionist.domain.recommend;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.function.Supplier;

/** 精排只能重排已经通过主料门槛的菜。超时或加进新菜时，保持规则分顺序。 */
public final class PassedRerank {

    public static final long BUDGET_MS = 500;

    private PassedRerank() {
    }

    public static List<String> withinBudget(List<String> ruleOrder, Supplier<List<String>> rerank, long budgetMs) {
        if (rerank == null || ruleOrder == null || ruleOrder.isEmpty()) {
            return ruleOrder == null ? List.of() : ruleOrder;
        }
        ExecutorService pool = Executors.newSingleThreadExecutor();
        try {
            Future<List<String>> future = pool.submit(rerank::get);
            List<String> proposed = future.get(budgetMs, TimeUnit.MILLISECONDS);
            if (!sameIds(ruleOrder, proposed)) {
                return ruleOrder;
            }
            return proposed;
        } catch (TimeoutException error) {
            return ruleOrder;
        } catch (Exception error) {
            return ruleOrder;
        } finally {
            pool.shutdownNow();
        }
    }

    private static boolean sameIds(List<String> ruleOrder, List<String> proposed) {
        if (proposed == null || proposed.size() != ruleOrder.size()) {
            return false;
        }
        return new HashSet<>(ruleOrder).equals(new SetCopy(proposed).values);
    }

    private static final class SetCopy {
        private final Set<String> values;

        private SetCopy(List<String> ids) {
            this.values = new HashSet<>(ids);
        }
    }
}
