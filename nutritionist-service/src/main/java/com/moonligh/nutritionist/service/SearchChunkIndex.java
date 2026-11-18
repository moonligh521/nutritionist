package com.moonligh.nutritionist.service;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicLong;

import org.springframework.beans.factory.ObjectProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.moonligh.nutritionist.domain.recommend.HybridRecall;
import com.moonligh.nutritionist.domain.recommend.RecipeVectorizer;
import com.moonligh.nutritionist.infrastructure.persistence.SearchChunkMapper;

/**
 * MySQL 检索 chunk 的进程内索引。构建时加载，上传/seed 后 {@link #invalidate()}。
 */
@Component
public class SearchChunkIndex {

    private final SearchChunkMapper chunks;
    private final Object lock = new Object();
    private final AtomicLong generation = new AtomicLong();
    private volatile List<HybridRecall.Chunk> cached = List.of();
    private volatile long loadedGeneration = -1L;

    @Autowired
    public SearchChunkIndex(ObjectProvider<SearchChunkMapper> chunks) {
        this.chunks = chunks == null ? null : chunks.getIfAvailable();
    }

    /** 单测直接注入 mapper。 */
    public SearchChunkIndex(SearchChunkMapper chunks) {
        this.chunks = chunks;
    }

    public void invalidate() {
        generation.incrementAndGet();
    }

    public List<HybridRecall.Chunk> all() {
        long gen = generation.get();
        List<HybridRecall.Chunk> hit = cached;
        if (hit != null && loadedGeneration == gen) {
            return hit;
        }
        synchronized (lock) {
            if (loadedGeneration == generation.get() && cached != null) {
                return cached;
            }
            List<HybridRecall.Chunk> loaded = new ArrayList<>();
            if (chunks != null) {
                for (SearchChunkMapper.ChunkRow row : chunks.all()) {
                    loaded.add(new HybridRecall.Chunk(
                            row.recipeId(),
                            row.documentText(),
                            RecipeVectorizer.fromJson(row.embeddingJson())));
                }
            }
            cached = List.copyOf(loaded);
            loadedGeneration = generation.get();
            return cached;
        }
    }
}
