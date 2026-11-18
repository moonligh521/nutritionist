package com.moonligh.nutritionist.service.dialogue;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.moonligh.nutritionist.domain.dialogue.MemoryEvent;
import com.moonligh.nutritionist.domain.dialogue.MemoryExtraction;
import com.moonligh.nutritionist.domain.dialogue.PreferenceScope;

/** 抽取结果写入前的薄校验：丢掉非法/空主体事件，不脏写。 */
@Component
public class MemoryWriteValidator {

    public MemoryExtraction validate(MemoryExtraction extraction) {
        if (extraction == null) {
            return MemoryExtraction.empty();
        }
        List<MemoryEvent> kept = new ArrayList<>();
        for (MemoryEvent event : extraction.events()) {
            if (event == null || !event.usable()) {
                continue;
            }
            if (event.scope() == PreferenceScope.CONDITIONAL && event.condition().isBlank()) {
                // 首版：无条件结构的 CONDITIONAL 降为 PERMANENT 不写入条件消费
                kept.add(new MemoryEvent(
                        event.op(),
                        event.subject(),
                        event.subjectType(),
                        event.polarity(),
                        event.strength(),
                        PreferenceScope.PERMANENT,
                        event.validFrom(),
                        event.validTo(),
                        "",
                        event.targetOwner(),
                        event.confidence(),
                        event.evidence()));
                continue;
            }
            if (!event.targetOwner().isBlank()) {
                // 多主体未解析到档案：本版不写入，留给澄清
                continue;
            }
            if (event.confidence() > 0 && event.confidence() < 0.5) {
                continue;
            }
            kept.add(event);
        }
        return new MemoryExtraction(
                kept,
                extraction.queries(),
                extraction.turnOnlyHints(),
                extraction.allergySuspects(),
                extraction.needsDisambiguation(),
                extraction.eventId());
    }
}
