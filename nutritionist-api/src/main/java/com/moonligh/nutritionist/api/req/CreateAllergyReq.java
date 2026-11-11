package com.moonligh.nutritionist.api.req;

public record CreateAllergyReq(
        String patientId,
        String patientVersion,
        String allergenCode,
        Integer severityCode,
        boolean confirmed) {
}
