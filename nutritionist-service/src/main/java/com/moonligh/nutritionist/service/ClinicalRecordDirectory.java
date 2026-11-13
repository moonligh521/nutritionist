package com.moonligh.nutritionist.service;

/**
 * 临床数据仓库。配了地址之后，病情只问它，不再读营养库里的病情表。
 */
public interface ClinicalRecordDirectory {

    boolean enabled();

    boolean hasPresentDiagnosis(String patientId, String code);

    java.util.List<String> presentDiagnosisCodes(String patientId);

    void declarePresentDiagnosis(String patientId, String code);
}
