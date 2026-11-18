package com.moonligh.nutritionist.domain.dialogue;

import java.util.List;

/** 理解不确定时的可执行澄清，不硬猜槽位。 */
public record IntentAmbiguity(String code, List<String> options, String ask) {

    public IntentAmbiguity {
        code = code == null ? "" : code.trim();
        options = options == null ? List.of() : List.copyOf(options);
        ask = ask == null ? "" : ask.trim();
    }
}
