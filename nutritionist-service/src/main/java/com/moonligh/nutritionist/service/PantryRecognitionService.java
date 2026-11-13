package com.moonligh.nutritionist.service;

import java.math.BigDecimal;
import java.time.Duration;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.Semaphore;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moonligh.nutritionist.domain.common.EntityTable;
import com.moonligh.nutritionist.domain.dialogue.HouseholdUtterance;
import com.moonligh.nutritionist.domain.recognition.ModelCompletion;
import com.moonligh.nutritionist.infrastructure.persistence.NutritionDataStore;

/**
 * 拍照或一句话识别库存时，只生成草稿。
 * 用户确认之前，不会改正式库存。
 */
@Service
public class PantryRecognitionService {

    private static final int MODEL_PERMITS = 16;

    /** 还没确认的识别草稿，按草稿编号查找。 */
    private final EntityTable<RecognitionDraft> drafts = new EntityTable<>(RecognitionDraft::draftId);
    private final ModelCompletion model;
    private final NutritionDataStore records;
    private final Duration modelTimeout;
    private final Semaphore modelPermits = new Semaphore(MODEL_PERMITS);
    private final ExecutorService modelCalls = Executors.newVirtualThreadPerTaskExecutor();

    public PantryRecognitionService() {
        this(prompt -> Optional.empty(), Duration.ofSeconds(2), null);
    }

    @Autowired
    public PantryRecognitionService(ModelCompletion model, NutritionDataStore records) {
        this(model, Duration.ofSeconds(2), records);
    }

    PantryRecognitionService(ModelCompletion model, Duration modelTimeout) {
        this(model, modelTimeout, null);
    }

    private PantryRecognitionService(ModelCompletion model, Duration modelTimeout, NutritionDataStore records) {
        this.model = model;
        this.modelTimeout = modelTimeout;
        this.records = records;
    }

    public RecognitionDraft recognizeText(String patientId, String text) {
        if (blank(patientId) || blank(text)) {
            throw new IllegalArgumentException("patientId and text are required");
        }
        String draftId = UUID.randomUUID().toString();
        HouseholdUtterance.Parsed parsed = HouseholdUtterance.parse(text);
        List<RecognitionCandidate> candidates = new ArrayList<>();
        if (parsed.mentions().size() > 1) {
            for (HouseholdUtterance.Mention mention : parsed.mentions()) {
                candidates.add(new RecognitionCandidate(
                        UUID.randomUUID().toString(),
                        mention.name(),
                        null,
                        mention.grams(),
                        null,
                        new BigDecimal("0.50"),
                        true));
            }
        } else {
            String display = boundedModel(text).filter(value -> !value.isBlank()).orElse(text.strip());
            candidates.add(new RecognitionCandidate(
                    UUID.randomUUID().toString(), display, null, inferQuantity(text), null, new BigDecimal("0.50"), true));
        }
        RecognitionDraft draft = new RecognitionDraft(draftId, patientId, candidates);
        drafts.save(draft);
        if (records != null) {
            records.saveDraft(draft, 1, text);
        }
        return draft;
    }

    public RecognitionDraft recognizeImage(String patientId, String imageReference) {
        RecognitionDraft draft = recognizeText(patientId, "image:" + imageReference);
        return draft;
    }

    public Optional<RecognitionDraft> findDraft(String draftId) {
        Optional<RecognitionDraft> cached = drafts.find(draftId);
        if (cached.isPresent() || records == null) {
            return cached;
        }
        Optional<RecognitionDraft> stored = records.findDraft(draftId);
        stored.ifPresent(drafts::save);
        return stored;
    }

    public RecognitionDraft requireDraft(String draftId, String patientId) {
        RecognitionDraft draft = findDraft(draftId).orElse(null);
        if (draft == null || !draft.patientId().equals(patientId)) {
            throw new IllegalArgumentException("draft not found");
        }
        return draft;
    }

    public void consume(String draftId) {
        drafts.remove(draftId);
        if (records != null) {
            records.deleteDraft(draftId);
        }
    }

    private Optional<String> boundedModel(String text) {
        if (!modelPermits.tryAcquire()) {
            return Optional.empty();
        }
        Future<Optional<String>> call = modelCalls.submit(() -> model.complete(text));
        try {
            return call.get(modelTimeout.toMillis(), TimeUnit.MILLISECONDS);
        } catch (TimeoutException error) {
            call.cancel(true);
            return Optional.empty();
        } catch (Exception error) {
            return Optional.empty();
        } finally {
            modelPermits.release();
        }
    }

    private static BigDecimal inferQuantity(String text) {
        return text.contains("半斤") ? new BigDecimal("250") : null;
    }

    private static boolean blank(String value) {
        return value == null || value.isBlank();
    }

    public record RecognitionDraft(
            /** 草稿标识。 */
            String draftId,
            /** 患者标识。 */
            String patientId,
            /** 待确认候选。 */
            List<RecognitionCandidate> candidates) {
        public RecognitionDraft {
            candidates = List.copyOf(candidates);
        }
    }

    public record RecognitionCandidate(
            /** 候选标识。 */
            String draftId,
            /** 展示名称。 */
            String displayName,
            /** 食材标识。未匹配时为空。 */
            String foodItemId,
            /** 识别数量。不确定时为空。 */
            BigDecimal quantity,
            /** 数量单位代码。不确定时为空。 */
            Integer unitCode,
            /** 置信度，0 到 1。 */
            BigDecimal confidence,
            /** 是否必须经用户确认后才能入库。 */
            boolean needsConfirmation) {
    }
}
