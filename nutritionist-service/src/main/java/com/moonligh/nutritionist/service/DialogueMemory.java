package com.moonligh.nutritionist.service;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.CopyOnWriteArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.moonligh.nutritionist.domain.common.EntityTable;
import com.moonligh.nutritionist.domain.meal.MealPlan;
import com.moonligh.nutritionist.infrastructure.persistence.NutritionDataStore;

/** 按患者保存已经处理过的家常话和当时的方案。对话原文不作为医疗事实。 */
@Component
public class DialogueMemory {

    private final EntityTable<PatientTurns> patients = new EntityTable<>(PatientTurns::patientId);
    private final NutritionDataStore records;

    public DialogueMemory() {
        this(null);
    }

    @Autowired
    public DialogueMemory(NutritionDataStore records) {
        this.records = records;
    }

    public void append(String patientId, Turn turn) {
        patients.findOrCreate(patientId, () -> new PatientTurns(patientId)).turns().add(turn);
        if (records != null && turn.date() != null) {
            records.insertDialogueTurn(
                    patientId,
                    turn.date(),
                    turn.goalCode(),
                    String.join("、", turn.foodNames()),
                    String.join("、", turn.missingComposition()),
                    turn.explanation());
        }
    }

    public Optional<Turn> latest(String patientId) {
        List<Turn> turns = patients.find(patientId).map(PatientTurns::turns).orElse(List.of());
        if (!turns.isEmpty()) {
            return Optional.of(turns.get(turns.size() - 1));
        }
        if (records == null) {
            return Optional.empty();
        }
        return records.latestDialogueTurn(patientId).map(row -> new Turn(
                row.date(),
                row.goalCode(),
                split(row.foodNames()),
                split(row.missingNames()),
                row.explanation(),
                null));
    }

    private static List<String> split(String value) {
        if (value == null || value.isBlank()) {
            return List.of();
        }
        return List.of(value.split("、"));
    }

    public record Turn(
            LocalDate date,
            String goalCode,
            List<String> foodNames,
            List<String> missingComposition,
            String explanation,
            MealPlan meal) {
    }

    static final class PatientTurns {
        private final String patientId;
        private final List<Turn> turns = new CopyOnWriteArrayList<>();

        PatientTurns(String patientId) {
            this.patientId = patientId;
        }

        String patientId() {
            return patientId;
        }

        List<Turn> turns() {
            return turns;
        }
    }
}
