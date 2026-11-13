package com.moonligh.nutritionist.domain.recognition;

import java.util.Optional;

public interface ModelCompletion {

    Optional<String> complete(String prompt);
}
