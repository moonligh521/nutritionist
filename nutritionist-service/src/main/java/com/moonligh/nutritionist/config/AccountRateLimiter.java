package com.moonligh.nutritionist.config;

import java.util.concurrent.atomic.AtomicInteger;

import org.springframework.beans.factory.ObjectProvider;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

import com.moonligh.consult.framework.BusinessException;
import com.moonligh.consult.framework.ErrorCode;
import com.moonligh.nutritionist.domain.common.EntityTable;

/**
 * 账号级限流。Redis 计数失败时退回本机窗口，不把请求打挂。
 */
@Component
public class AccountRateLimiter {

    private final StringRedisTemplate redis;
    /** 每个账号、每种操作各有一个计数窗口。 */
    private final EntityTable<LocalRateBucket> local = new EntityTable<>(LocalRateBucket::id);

    @org.springframework.beans.factory.annotation.Autowired
    public AccountRateLimiter(ObjectProvider<StringRedisTemplate> redis) {
        this(redis.getIfAvailable());
    }

    public AccountRateLimiter(StringRedisTemplate redis) {
        this.redis = redis;
    }

    public void acquire(String accountId, String bucket, int permitsPerSecond) {
        String key = accountId + ":" + bucket;
        if (tryRedis(key, permitsPerSecond)) {
            return;
        }
        LocalRateBucket bucketRow = local.findOrCreate(key, () -> new LocalRateBucket(key, new Window()));
        if (!bucketRow.window().tryAcquire(permitsPerSecond)) {
            throw new BusinessException(ErrorCode.TOO_MANY_REQUESTS);
        }
    }

    private boolean tryRedis(String key, int permitsPerSecond) {
        if (redis == null) {
            return false;
        }
        try {
            String redisKey = "nutrition:rate:" + key + ":" + (System.currentTimeMillis() / 1000);
            Long count = redis.opsForValue().increment(redisKey);
            redis.expire(redisKey, java.time.Duration.ofSeconds(2));
            if (count != null && count > permitsPerSecond) {
                throw new BusinessException(ErrorCode.TOO_MANY_REQUESTS);
            }
            return true;
        } catch (BusinessException error) {
            throw error;
        } catch (RuntimeException error) {
            return false;
        }
    }

    /** 本机限流的一行：谁、哪种操作、当前这一秒已经过了几次。 */
    record LocalRateBucket(String id, Window window) {
    }

    static final class Window {
        private long second = Long.MIN_VALUE;
        private final AtomicInteger count = new AtomicInteger();

        synchronized boolean tryAcquire(int permitsPerSecond) {
            long now = System.currentTimeMillis() / 1000;
            if (now != second) {
                second = now;
                count.set(0);
            }
            return count.incrementAndGet() <= permitsPerSecond;
        }
    }
}
