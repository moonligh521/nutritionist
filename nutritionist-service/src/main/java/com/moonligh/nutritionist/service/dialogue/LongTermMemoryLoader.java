package com.moonligh.nutritionist.service.dialogue;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.moonligh.nutritionist.domain.dialogue.LongTermMemory;
import com.moonligh.nutritionist.domain.dialogue.PreferenceItem;
import com.moonligh.nutritionist.domain.dialogue.PreferencePolarity;
import com.moonligh.nutritionist.domain.dialogue.PreferenceScope;
import com.moonligh.nutritionist.domain.dialogue.PreferenceSnapshot;
import com.moonligh.nutritionist.domain.dialogue.PreferenceStrength;
import com.moonligh.nutritionist.domain.dialogue.SubjectType;
import com.moonligh.nutritionist.service.ClinicalRecordService;

/** 从临床档案 + 偏好事实链组装长期记忆快照。 */
@Component
public class LongTermMemoryLoader {

    private final ClinicalRecordService records;
    private final PreferenceStore preferences;

    @Autowired
    public LongTermMemoryLoader(ClinicalRecordService records, PreferenceStore preferences) {
        this.records = records;
        this.preferences = preferences;
    }

    public LongTermMemory loadPatient(String patientId) {
        if (patientId == null || patientId.isBlank()) {
            return LongTermMemory.empty();
        }
        String id = patientId.trim();
        PreferenceSnapshot taste = preferences.snapshot(id);
        List<String> conditions = List.of();
        List<String> allergens = List.of();
        List<String> medications = List.of();
        boolean stop = false;
        if (records != null) {
            conditions = mapConditions(records.conditionCodes(id));
            allergens = records.confirmedAllergenCodes(id);
            medications = records.medicationNames(id);
            stop = records.latestMeasurementStopsPlanning(id);
        }
        return fromTaste("patient:" + id, taste, conditions, allergens, medications, stop);
    }

    public LongTermMemory loadOwner(String ownerId) {
        if (ownerId == null || ownerId.isBlank()) {
            return LongTermMemory.empty();
        }
        if (ownerId.startsWith("session:")) {
            return fromTaste(
                    ownerId,
                    preferences.snapshot(ownerId),
                    List.of(),
                    List.of(),
                    List.of(),
                    false);
        }
        return loadPatient(ownerId);
    }

    /** 请求体口味字段入口（兼容旧客户端）；与文本抽取共用同一投影形状。 */
    public LongTermMemory fromRequest(
            List<String> conditions,
            List<String> allergens,
            List<String> avoidFoods,
            List<String> preferTags,
            List<String> preferCuisines) {
        List<PreferenceItem> items = new ArrayList<>();
        addItems(items, avoidFoods, SubjectType.FOOD, PreferencePolarity.AVOID, PreferenceStrength.ABSOLUTE);
        addItems(items, preferTags, SubjectType.TAG, PreferencePolarity.LIKE, PreferenceStrength.MODERATE);
        addItems(items, preferCuisines, SubjectType.CUISINE, PreferencePolarity.LIKE, PreferenceStrength.MODERATE);
        return new LongTermMemory(
                "request",
                mapConditions(conditions),
                allergens == null ? List.of() : List.copyOf(allergens),
                List.of(),
                false,
                items,
                0L);
    }

    private static LongTermMemory fromTaste(
            String version,
            PreferenceSnapshot taste,
            List<String> conditions,
            List<String> allergens,
            List<String> medications,
            boolean stop) {
        return new LongTermMemory(
                version,
                conditions,
                allergens,
                medications,
                stop,
                taste.current(),
                taste.epoch());
    }

    private static void addItems(
            List<PreferenceItem> items,
            List<String> subjects,
            SubjectType type,
            PreferencePolarity polarity,
            PreferenceStrength strength) {
        if (subjects == null) {
            return;
        }
        for (String subject : subjects) {
            if (subject == null || subject.isBlank()) {
                continue;
            }
            items.add(new PreferenceItem(
                    subject.trim(), type, polarity, strength, PreferenceScope.PERMANENT));
        }
    }

    static List<String> mapConditions(List<String> codes) {
        if (codes == null) {
            return List.of();
        }
        Set<String> tags = new LinkedHashSet<>();
        for (String code : codes) {
            if (code == null || code.isBlank()) {
                continue;
            }
            String value = code.trim();
            tags.add(value);
            if (value.contains("糖尿") || value.equalsIgnoreCase("diabetes")) {
                tags.add("控糖");
            }
            if (value.contains("血压") || value.equalsIgnoreCase("hypertension")) {
                tags.add("控盐");
            }
            if (value.contains("痛风") || value.equalsIgnoreCase("gout")) {
                tags.add("低嘌呤");
            }
        }
        return List.copyOf(tags);
    }
}
