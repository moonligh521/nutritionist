package com.moonligh.nutritionist.service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Service;

/**
 * Recognition is deliberately draft-only. Formal inventory changes are made
 * exclusively by PantryService after explicit confirmation.
 */
@Service
public class PantryRecognitionService {

    private final ConcurrentHashMap<String, RecognitionDraft> drafts = new ConcurrentHashMap<>();

    public RecognitionDraft recognizeText(String patientId, String text) {
        if (blank(patientId) || blank(text)) {
            throw new IllegalArgumentException("patientId and text are required");
        }
        String draftId = UUID.randomUUID().toString();
        RecognitionCandidate candidate = new RecognitionCandidate(
                UUID.randomUUID().toString(), text.strip(), null, inferQuantity(text), null, new BigDecimal("0.50"), true);
        RecognitionDraft draft = new RecognitionDraft(draftId, patientId, List.of(candidate));
        drafts.put(draftId, draft);
        return draft;
    }

    public RecognitionDraft recognizeImage(String patientId, String imageReference) {
        return recognizeText(patientId, "image:" + imageReference);
    }

    public Optional<RecognitionDraft> findDraft(String draftId) {
        return Optional.ofNullable(drafts.get(draftId));
    }

    public RecognitionDraft requireDraft(String draftId, String patientId) {
        RecognitionDraft draft = drafts.get(draftId);
        if (draft == null || !draft.patientId().equals(patientId)) {
            throw new IllegalArgumentException("draft not found");
        }
        return draft;
    }

    public void consume(String draftId) {
        drafts.remove(draftId);
    }

    private static BigDecimal inferQuantity(String text) {
        return text.contains("半斤") ? new BigDecimal("250") : null;
    }

    private static boolean blank(String value) {
        return value == null || value.isBlank();
    }

    public record RecognitionDraft(String draftId, String patientId, List<RecognitionCandidate> candidates) {
        public RecognitionDraft {
            candidates = List.copyOf(candidates);
        }
    }

    public record RecognitionCandidate(
            String draftId,
            String displayName,
            String foodItemId,
            BigDecimal quantity,
            Integer unitCode,
            BigDecimal confidence,
            boolean needsConfirmation) {
    }
}
