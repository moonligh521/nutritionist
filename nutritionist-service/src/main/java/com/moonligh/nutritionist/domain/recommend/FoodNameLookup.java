package com.moonligh.nutritionist.domain.recommend;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

/**
 * 食材名 → 编号查找表。对外是对象列表与按名查询，不暴露裸 Map。
 */
public final class FoodNameLookup {

    private final List<NamedFood> foods;
    private final List<FoodAlias> aliases;

    public FoodNameLookup(List<NamedFood> foods, List<FoodAlias> aliases) {
        this.foods = foods == null ? List.of() : List.copyOf(foods);
        this.aliases = aliases == null ? List.of() : List.copyOf(aliases);
    }

    public Optional<String> idOf(String token) {
        if (token == null || token.isBlank()) {
            return Optional.empty();
        }
        String key = token.trim();
        for (FoodAlias alias : aliases) {
            if (alias.usable() && alias.alias().equals(key)) {
                return Optional.of(alias.foodId());
            }
        }
        for (NamedFood food : foods) {
            if (food.name().equals(key)) {
                return Optional.of(food.id());
            }
        }
        return Optional.empty();
    }

    public boolean knownId(String id) {
        if (id == null || id.isBlank()) {
            return false;
        }
        for (NamedFood food : foods) {
            if (food.id().equals(id)) {
                return true;
            }
        }
        return false;
    }

    public static FoodNameLookup of(List<NamedFood> foods, List<FoodAlias> aliases) {
        return new FoodNameLookup(foods, aliases);
    }

    public record NamedFood(String id, String name) {
        public NamedFood {
            id = id == null ? "" : id;
            name = name == null ? "" : name;
        }
    }

    /** 构建期收集，最终 freeze 成 FoodNameLookup。 */
    public static final class Builder {
        private final List<NamedFood> foods = new ArrayList<>();
        private final List<FoodAlias> aliases = new ArrayList<>();

        public Builder addFood(String id, String name) {
            foods.add(new NamedFood(id, name));
            return this;
        }

        public Builder addAlias(FoodAlias alias) {
            if (alias != null && alias.usable()) {
                aliases.add(alias);
            }
            return this;
        }

        public Builder addAliases(List<FoodAlias> more) {
            if (more != null) {
                more.forEach(this::addAlias);
            }
            return this;
        }

        public FoodNameLookup build() {
            return new FoodNameLookup(foods, aliases);
        }
    }
}
