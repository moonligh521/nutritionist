package com.moonligh.nutritionist.api.res;

import java.time.Instant;

public record IntakeRes(String intakeId, String eventId, Instant recordedAt) {
}
