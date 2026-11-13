package com.moonligh.nutritionist.service;

import java.time.LocalDate;
import java.util.Optional;

import org.springframework.stereotype.Component;

import com.moonligh.nutritionist.domain.common.EntityTable;

/** 本轮模型说明。克数不存在这里。 */
@Component
public class PresentationStore {

    private final EntityTable<Presentation> rows = new EntityTable<>(Presentation::key);

    public void save(String patientId, LocalDate date, String explanation, boolean fromModel) {
        rows.save(new Presentation(patientId + "|" + date, explanation == null ? "" : explanation, fromModel));
    }

    public Optional<Presentation> find(String patientId, LocalDate date) {
        return rows.find(patientId + "|" + date);
    }

    public record Presentation(String key, String explanation, boolean fromModel) {
    }
}
