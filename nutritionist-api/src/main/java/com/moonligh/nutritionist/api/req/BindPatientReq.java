package com.moonligh.nutritionist.api.req;

/**
 * 绑定就诊人请求。
 */
public record BindPatientReq(String patientId, String patientVersion) {
}
