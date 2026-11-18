package com.moonligh.nutritionist.service;

import java.time.Duration;
import java.util.function.Consumer;

import org.springframework.beans.factory.ObjectProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

/**
 * 已经复核通过的菜卡。
 * 键固定是 dish:菜号，保存 7 天。判断能不能做时不读这里。
 * Redis 用挂号同一台测试机。连不上时，推荐结果照样返回。
 */
@Component
public class DishCardCache {

    private final StringRedisTemplate redis;
    private final Consumer<String> deleted;

    @Autowired
    public DishCardCache(ObjectProvider<StringRedisTemplate> redis) {
        this.redis = redis.getIfAvailable();
        this.deleted = null;
    }

    /** 测试不连 Redis，只记下被删掉的键。 */
    DishCardCache(Consumer<String> deleted) {
        this.redis = null;
        this.deleted = deleted;
    }

    public void remember(String recipeId, String card) {
        if (redis == null || recipeId == null || recipeId.isBlank() || card == null) {
            return;
        }
        try {
            redis.opsForValue().set("dish:" + recipeId, card, Duration.ofDays(7));
        } catch (RuntimeException ignored) {
            // 缓存写失败不影响这一次推荐。
        }
    }

    public void forget(String recipeId) {
        if (recipeId == null || recipeId.isBlank()) {
            return;
        }
        String key = "dish:" + recipeId;
        if (deleted != null) {
            deleted.accept(key);
        }
        if (redis == null) {
            return;
        }
        try {
            redis.delete(key);
        } catch (RuntimeException ignored) {
            // 删不掉时，最多多留 7 天旧菜卡。下一次检索仍以数据库为准。
        }
    }
}
