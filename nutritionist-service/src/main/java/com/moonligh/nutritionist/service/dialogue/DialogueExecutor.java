package com.moonligh.nutritionist.service.dialogue;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.moonligh.nutritionist.domain.dialogue.DialogueTask;
import com.moonligh.nutritionist.domain.dialogue.DishSlot;
import com.moonligh.nutritionist.domain.dialogue.DishSlotStatus;
import com.moonligh.nutritionist.domain.dialogue.LongTermMemory;
import com.moonligh.nutritionist.domain.dialogue.SessionMemory;
import com.moonligh.nutritionist.domain.dialogue.TaskType;
import com.moonligh.nutritionist.domain.recommend.RecallContext;
import com.moonligh.nutritionist.domain.solver.SolverInfeasibleException;
import com.moonligh.nutritionist.service.CatalogBrowse;
import com.moonligh.nutritionist.service.DayMenuService;
import com.moonligh.nutritionist.service.DishRecommendService;
import com.moonligh.nutritionist.service.DishRecommendService.Suggestion;
import com.moonligh.nutritionist.service.IngredientAgent.Profile;

/** 按固定计划增量执行；不整表重跑推荐，除非任务就是 RECOMMEND。 */
@Component
public class DialogueExecutor {

    static final String IDENTITY =
            "我是营养食材推荐助手。主要根据你家里的食材，从已发布菜谱里选出最多 3 道能做的菜，并给出做法和克数。";
    static final String GREETING =
            IDENTITY + "很高兴认识你。请告诉我家里有哪些食材，或说想换菜、加个汤，我来帮你。";
    static final String OUT_OF_SCOPE =
            IDENTITY + "我只处理食材选菜、换菜和代替相关问题，不能回答其他问题。你可以告诉我家里有什么食材。";

    private final DishRecommendService dishes;
    private final DayMenuService dayMenu;
    private final CatalogBrowse catalog;
    private final EmptyGuideComposer emptyGuide;

    public DialogueExecutor(DishRecommendService dishes, DayMenuService dayMenu, CatalogBrowse catalog) {
        this(dishes, dayMenu, catalog, new EmptyGuideComposer());
    }

    @Autowired
    public DialogueExecutor(
            DishRecommendService dishes, DayMenuService dayMenu, CatalogBrowse catalog, EmptyGuideComposer emptyGuide) {
        this.dishes = dishes;
        this.dayMenu = dayMenu;
        this.catalog = catalog;
        this.emptyGuide = emptyGuide == null ? new EmptyGuideComposer() : emptyGuide;
    }

    public void run(DialogueTask task, RunState state) {
        if (blocksPlanning(task, state)) {
            state.append("当前测量状态禁止自动配餐，请先处理安全提示。我仍可以介绍能力，但不能继续推荐或换菜。");
            state.plan.add(task.type().name());
            return;
        }
        switch (task.type()) {
            case GREETING -> state.append(GREETING);
            case OUT_OF_SCOPE -> state.append(OUT_OF_SCOPE);
            case CONFIRM_FOODS -> confirm(task, state);
            case RECOMMEND -> recommend(task, state);
            case REPLACE_ONE -> replaceOne(task, state);
            case ADD_KIND -> addKind(task, state);
            case MISSING -> missing(task, state);
            case SUBSTITUTE -> substitute(task, state);
        }
        state.plan.add(task.type().name());
    }

    private static boolean blocksPlanning(DialogueTask task, RunState state) {
        if (!state.memory.longTerm().measurementStopsPlanning()) {
            return false;
        }
        return task.type() == TaskType.RECOMMEND
                || task.type() == TaskType.REPLACE_ONE
                || task.type() == TaskType.ADD_KIND
                || task.type() == TaskType.MISSING
                || task.type() == TaskType.SUBSTITUTE;
    }

    private void confirm(DialogueTask task, RunState state) {
        state.needConfirm.addAll(task.confirmCandidates());
        state.append("有食材需要确认后才能继续推荐：" + summarizeConfirm(task) + "。请回复选定的标准名称。");
    }

    private void recommend(DialogueTask task, RunState state) {
        List<String> raw = task.rawFoods().isEmpty() ? state.requestFoods : task.rawFoods();
        FoodNormalizer.Result normalized = state.normalizer.normalize(raw, state.memory);
        state.corrections.addAll(normalized.autoCorrections());
        state.unrecognized.addAll(normalized.unrecognized());
        if (normalized.needsConfirm()) {
            state.needConfirm.addAll(normalized.lowConfidence());
            state.append("有食材需要确认：" + summarizeConfirm(DialogueTask.confirmFoods(normalized.lowConfidence())));
            return;
        }
        if (normalized.ids().isEmpty()) {
            applyEmptyGuide(state, emptyGuide.noFoodsRecognized());
            return;
        }
        state.memory.setFoodIds(normalized.ids());
        DishRecommendService.MatchReport found = dishes.matchIds(
                normalized.ids(),
                normalized.unrecognized(),
                "",
                recallContext(state, ""));
        List<Suggestion> kept = softRank(uniqueById(excludeAvoidAndMissing(found.dishes(), state)), state);
        state.memory.setCurrentDishes(kept);
        state.unrecognized.addAll(found.unrecognized());
        state.fallback = found.fallback();
        state.emptyReason = found.emptyReason() == null ? "" : found.emptyReason().name();
        state.degradeStep = found.degradeStep();
        if (!normalized.autoCorrections().isEmpty()) {
            state.append("已识别：" + String.join("，", normalized.autoCorrections()) + "。");
        }
        if (kept.isEmpty()) {
            boolean hasCuisine = !state.memory.longTerm().preferCuisines().isEmpty()
                    || (state.utteranceText != null && state.utteranceText.contains("菜"));
            boolean hasTags = !state.memory.longTerm().preferTags().isEmpty();
            EmptyGuideComposer.Guide guide = emptyGuide.compose(found.emptyReason(), hasCuisine, hasTags);
            if (guide.empty()) {
                state.append(found.fallback().isBlank() ? "没有主料齐全的已发布菜，不会另外编一道。" : found.fallback());
            } else {
                applyEmptyGuide(state, guide);
            }
            return;
        }
        state.memory.clearEmptyGuide();
        state.emptyReason = "";
        state.append(reasons(kept));
        maybeSolve(state);
    }

    private static void applyEmptyGuide(RunState state, EmptyGuideComposer.Guide guide) {
        // 空引导覆盖上一轮荐菜，避免 advancePhase 因残留 dishes 回到 RECOMMENDED 并清掉 guide。
        state.memory.setCurrentDishes(List.of());
        state.memory.setLastEmptyReason(guide.reason().name());
        state.memory.setGuideActions(guide.actions());
        state.memory.setPhase(com.moonligh.nutritionist.domain.dialogue.DialoguePhase.EMPTY_GUIDE);
        state.emptyReason = guide.reason().name();
        state.append(guide.text());
    }

    /**
     * 新 ABSOLUTE 忌口命中已荐菜时：走换菜状态机，无可行则 NO_FEASIBLE。
     */
    public void autoReplaceHitByAbsoluteAvoid(RunState state) {
        List<String> absolute = state.memory.longTerm().absoluteAvoidFoods();
        if (absolute.isEmpty() || state.memory.dishSlots().isEmpty()) {
            return;
        }
        List<DishSlot> slots = new ArrayList<>(state.memory.dishSlots());
        boolean changed = false;
        for (int i = 0; i < slots.size(); i++) {
            DishSlot slot = slots.get(i);
            if (slot.dish() == null || !slot.countable()) {
                continue;
            }
            if (!usesBanned(slot.dish().id(), absolute, normalizeNames(absolute), state)) {
                continue;
            }
            state.memory.rememberExcludedDishId(slot.dish().id());
            Set<String> exclude = new LinkedHashSet<>(idsOfSlots(slots));
            exclude.addAll(state.memory.excludedDishIds());
            Suggestion replacement = firstNew(state, exclude, "");
            if (replacement == null) {
                slots.set(i, slot.noFeasible());
                state.append("「" + slot.dish().name() + "」触犯现行绝对忌口，暂无安全替代，已标记不可替换。");
            } else {
                slots.set(i, slot.replacedBy(replacement));
                state.append("「" + slot.dish().name() + "」触犯绝对忌口，已换为「" + replacement.name() + "」。");
            }
            changed = true;
        }
        if (changed) {
            state.memory.setDishSlots(slots);
        }
    }

    private void replaceOne(DialogueTask task, RunState state) {
        List<DishSlot> slots = new ArrayList<>(state.memory.dishSlots());
        if (slots.isEmpty()) {
            // 兼容仅写了 currentDishes 的旧会话
            for (Suggestion dish : state.memory.currentDishes()) {
                slots.add(DishSlot.valid(dish));
            }
        }
        if (slots.isEmpty()) {
            state.append("还没有推荐结果，请先告诉我食材，我再给你换菜。");
            return;
        }
        int index = findSlotIndex(slots, task.dishHint());
        if (index < 0) {
            state.append("没有找到要换的菜，请说出菜名，例如「番茄炒蛋换一个」。");
            return;
        }
        DishSlot target = slots.get(index);
        if (target.dish() != null) {
            state.memory.rememberExcludedDishId(target.dish().id());
        }
        slots.set(index, target.invalidated().pending());
        Set<String> exclude = new LinkedHashSet<>(idsOfSlots(slots));
        exclude.addAll(state.memory.excludedDishIds());
        Suggestion replacement = firstNew(state, exclude, "");
        if (replacement == null) {
            // VALID → INVALIDATED → NO_FEASIBLE：不伪造违规菜
            slots.set(index, target.noFeasible());
            state.memory.setDishSlots(slots);
            state.append("暂时没有可替换的已发布菜，已标记「"
                    + (target.dish() == null ? task.dishHint() : target.dish().name())
                    + "」为不可替换，其余菜保持不变。不会突破安全约束硬凑一道。");
            return;
        }
        slots.set(index, target.replacedBy(replacement));
        state.memory.setDishSlots(slots);
        state.memory.setLastFocusedDishName(replacement.name());
        state.memory.clearEmptyGuide();
        state.append("已将「"
                + (target.dish() == null ? task.dishHint() : target.dish().name())
                + "」换为「" + replacement.name() + "」，其余菜不变。");
    }

    private static int findSlotIndex(List<DishSlot> slots, String hint) {
        if (hint == null || hint.isBlank()) {
            for (int i = 0; i < slots.size(); i++) {
                DishSlotStatus status = slots.get(i).status();
                if (status == DishSlotStatus.VALID || status == DishSlotStatus.REPLACED) {
                    return i;
                }
            }
            return slots.isEmpty() ? -1 : 0;
        }
        String needle = hint.trim();
        for (int i = 0; i < slots.size(); i++) {
            Suggestion dish = slots.get(i).dish();
            if (dish != null && dish.name() != null && dish.name().contains(needle)) {
                return i;
            }
        }
        return -1;
    }

    private static Set<String> idsOfSlots(List<DishSlot> slots) {
        Set<String> ids = new LinkedHashSet<>();
        for (DishSlot slot : slots) {
            if (slot != null && slot.dish() != null && slot.dish().id() != null) {
                ids.add(slot.dish().id());
            }
        }
        return ids;
    }

    private void addKind(DialogueTask task, RunState state) {
        List<Suggestion> current = new ArrayList<>(state.memory.currentDishes());
        String kind = task.kind() == null || task.kind().isBlank() ? "汤" : task.kind().trim();
        // 未明确要求减少时不删已有菜，只追加且禁止菜号重复。
        Suggestion added = firstNew(state, idsOf(current), kind);
        if (added == null) {
            state.append("没有找到未出现过的合适" + kind + "。");
            return;
        }
        current.add(added);
        state.memory.setCurrentDishes(uniqueById(current));
        state.append("已追加一道" + kind + "：「" + added.name() + "」，原有菜保留。");
    }

    private void missing(DialogueTask task, RunState state) {
        if (task.missingFood() == null || task.missingFood().isBlank()) {
            state.append("请说明缺少哪一样食材。");
            return;
        }
        state.memory.addMissing(task.missingFood().trim());
        List<Suggestion> current = new ArrayList<>(state.memory.currentDishes());
        List<Suggestion> kept = excludeAvoidAndMissing(current, state);
        int need = Math.max(0, current.size() - kept.size());
        Set<String> exclude = idsOf(kept);
        for (int i = 0; i < need; i++) {
            Suggestion fill = firstNew(state, exclude, "");
            if (fill == null) {
                break;
            }
            kept.add(fill);
            exclude.add(fill.id());
        }
        state.memory.setCurrentDishes(uniqueById(kept));
        state.append("已记住没有「" + task.missingFood() + "」，并只补了受影响的菜。");
    }

    private void substitute(DialogueTask task, RunState state) {
        if (task.fromFood().isBlank() || task.toFood().isBlank()) {
            state.append("请说明把什么换成什么，例如「把鸡蛋换成鸭蛋」。");
            return;
        }
        if (!state.memory.conditionsSnapshot().isEmpty()) {
            DishRecommendService.Normalized to = dishes.normalize(List.of(task.toFood()), "");
            if (to.ids().isEmpty()) {
                state.append("代替品「" + task.toFood() + "」无法识别，做法保持原样。");
                return;
            }
            // 有病情时：未在适合字段体系核验前，不改做法（与方案一致：没标就不能换）。
            state.append("已记录病情约束。代替品「"
                    + task.toFood()
                    + "」若未标注适合当前限制，不能替换；当前做法保持原样。克数不会改。");
            return;
        }
        state.append("可以将说法中的「"
                + task.fromFood()
                + "」改为「"
                + task.toFood()
                + "」；克数仍按已发布配料锁定，不会改。");
    }

    private Suggestion firstNew(RunState state, Set<String> exclude, String textHint) {
        List<String> ids = state.memory.foodIds();
        if (ids.isEmpty()) {
            return null;
        }
        Set<String> blocked = new LinkedHashSet<>(exclude);
        blocked.addAll(state.memory.excludedDishIds());
        DishRecommendService.MatchReport found = dishes.matchIds(
                ids, List.of(), "", recallContext(state, textHint));
        for (Suggestion dish : excludeAvoidAndMissing(found.dishes(), state)) {
            if (!blocked.contains(dish.id())) {
                return dish;
            }
        }
        if (!textHint.isBlank()) {
            found = dishes.matchIds(ids, List.of(), "", recallContext(state, ""));
            for (Suggestion dish : excludeAvoidAndMissing(found.dishes(), state)) {
                if (!blocked.contains(dish.id()) && dish.name().contains(textHint)) {
                    return dish;
                }
            }
        }
        return null;
    }

    /** 话术 + 长期菜系/标签/病情 → 结构化 Context；禁止把记忆列表拼进字符串再抠词。 */
    private static RecallContext recallContext(RunState state, String extraHint) {
        return RecallContext.from(
                state.utteranceText,
                state.memory.longTerm(),
                joinHints(state.memory.turnHints(), extraHint));
    }

    private static String joinHints(String turnHints, String extra) {
        StringBuilder text = new StringBuilder(turnHints == null ? "" : turnHints.trim());
        if (extra != null && !extra.isBlank()) {
            if (!text.isEmpty()) {
                text.append(' ');
            }
            text.append(extra.trim());
        }
        return text.toString();
    }

    private List<Suggestion> excludeAvoidAndMissing(List<Suggestion> candidates, RunState state) {
        if (candidates == null || candidates.isEmpty()) {
            return List.of();
        }
        List<String> bannedNames = new ArrayList<>(state.memory.missing());
        LongTermMemory longTerm = state.memory.longTerm();
        // 硬过滤：临床过敏 + ABSOLUTE 偏好 + 本轮口头绝对忌口；普通「不喜欢」不在此硬砍
        bannedNames.addAll(longTerm.absoluteAvoidFoods());
        bannedNames.addAll(state.memory.turnAbsoluteAvoidFoods());
        bannedNames.addAll(longTerm.allergens());
        Set<String> bannedIds = normalizeNames(bannedNames);
        List<Suggestion> kept = new ArrayList<>();
        for (Suggestion dish : candidates) {
            if (!usesBanned(dish.id(), bannedNames, bannedIds, state)) {
                kept.add(dish);
            }
        }
        return kept;
    }

    /** 软偏好：非 ABSOLUTE 的 AVOID 降权，LIKE 加分；不剔除。 */
    private List<Suggestion> softRank(List<Suggestion> candidates, RunState state) {
        if (candidates == null || candidates.isEmpty()) {
            return List.of();
        }
        LongTermMemory longTerm = state.memory.longTerm();
        return candidates.stream()
                .sorted(Comparator
                        .comparingInt((Suggestion dish) -> dish.score() + softDelta(dish, longTerm, state))
                        .reversed()
                        .thenComparing(Suggestion::id))
                .toList();
    }

    private int softDelta(Suggestion dish, LongTermMemory longTerm, RunState state) {
        CatalogBrowse.RecipeView recipe = recipeOf(dish.id(), state);
        if (recipe == null) {
            return 0;
        }
        int delta = 0;
        for (CatalogBrowse.IngredientView ingredient : recipe.ingredients()) {
            delta += longTerm.softScoreDelta(ingredient.name(), state.memory.turnHints());
            for (String avoid : state.memory.turnAvoidFoods()) {
                if (avoid != null && !avoid.isBlank()
                        && (ingredient.name().contains(avoid) || avoid.contains(ingredient.name()))) {
                    delta -= 40;
                }
            }
        }
        return delta;
    }

    private Set<String> normalizeNames(List<String> names) {
        Set<String> ids = new LinkedHashSet<>();
        for (String name : names) {
            ids.addAll(this.dishes.normalize(List.of(name), "").ids());
        }
        return ids;
    }

    private boolean usesBanned(String recipeId, List<String> bannedNames, Set<String> bannedIds, RunState state) {
        CatalogBrowse.RecipeView recipe = recipeOf(recipeId, state);
        if (recipe == null) {
            return false;
        }
        for (CatalogBrowse.IngredientView ingredient : recipe.ingredients()) {
            if (bannedIds.contains(ingredient.foodId())) {
                return true;
            }
            for (String name : bannedNames) {
                if (name != null && !name.isBlank() && ingredient.name() != null && ingredient.name().contains(name)) {
                    return true;
                }
            }
        }
        return false;
    }

    private CatalogBrowse.RecipeView recipeOf(String recipeId, RunState state) {
        if (state.catalog == null) {
            state.catalog = catalog.snapshot("");
        }
        return state.catalog.recipe(recipeId).orElse(null);
    }

    private void maybeSolve(RunState state) {
        Profile profile = state.memory.profile();
        if (profile == null || state.memory.foodIds().isEmpty()) {
            return;
        }
        try {
            state.day = dayMenu.plan(
                    profile.sex(), profile.age(), profile.activity(), profile.mode(), state.memory.foodIds());
            state.append("已按资料计算当日克数。");
        } catch (SolverInfeasibleException error) {
            state.append("按这个额度和食材配不出完整的一天。");
        } catch (IllegalArgumentException error) {
            state.append(error.getMessage());
        }
    }

    private static Set<String> idsOf(List<Suggestion> dishes) {
        Set<String> ids = new LinkedHashSet<>();
        for (Suggestion dish : dishes) {
            ids.add(dish.id());
        }
        return ids;
    }

    /** 所有推荐结果按菜号去重，先出现的保留。 */
    static List<Suggestion> uniqueById(List<Suggestion> dishes) {
        if (dishes == null || dishes.isEmpty()) {
            return List.of();
        }
        Set<String> seen = new LinkedHashSet<>();
        List<Suggestion> unique = new ArrayList<>();
        for (Suggestion dish : dishes) {
            if (dish == null || dish.id() == null || dish.id().isBlank()) {
                continue;
            }
            if (seen.add(dish.id())) {
                unique.add(dish);
            }
        }
        return unique;
    }

    private static String reasons(List<Suggestion> dishes) {
        StringBuilder text = new StringBuilder();
        for (Suggestion dish : dishes) {
            text.append(dish.name()).append("：").append(dish.reason());
        }
        return text.toString();
    }

    private static String summarizeConfirm(DialogueTask task) {
        StringBuilder text = new StringBuilder();
        for (var item : task.confirmCandidates()) {
            if (!text.isEmpty()) {
                text.append("；");
            }
            text.append(item.raw()).append("→").append(item.options());
        }
        return text.toString();
    }

    /** 单回合执行中的可变状态。 */
    public static final class RunState {
        final SessionMemory memory;
        final FoodNormalizer normalizer;
        final List<String> requestFoods;
        /** 本轮用户原文（不含记忆拼词）；记忆经 {@link RecallContext} 注入。 */
        final String utteranceText;
        CatalogBrowse.CatalogSnapshot catalog;
        final List<String> plan = new ArrayList<>();
        final List<String> corrections = new ArrayList<>();
        final List<String> unrecognized = new ArrayList<>();
        final List<DialogueTask.ConfirmCandidate> needConfirm = new ArrayList<>();
        final StringBuilder explanation = new StringBuilder();
        String fallback = "";
        String emptyReason = "";
        int degradeStep = 0;
        DayMenuService.DayMenu day;

        public RunState(
                SessionMemory memory,
                FoodNormalizer normalizer,
                List<String> requestFoods,
                String utteranceText) {
            this.memory = memory;
            this.normalizer = normalizer;
            this.requestFoods = requestFoods == null ? List.of() : requestFoods;
            this.utteranceText = utteranceText == null ? "" : utteranceText;
        }

        void append(String text) {
            if (text == null || text.isBlank()) {
                return;
            }
            if (!explanation.isEmpty()) {
                explanation.append(' ');
            }
            explanation.append(text);
        }
    }
}
