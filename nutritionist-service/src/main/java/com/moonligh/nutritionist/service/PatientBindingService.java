package com.moonligh.nutritionist.service;

import java.time.Instant;

import org.springframework.stereotype.Service;

import com.moonligh.consult.framework.BusinessException;
import com.moonligh.consult.framework.ErrorCode;
import com.moonligh.nutritionist.domain.profile.PatientBindingStore;
import com.moonligh.nutritionist.domain.profile.PatientGateway;
import com.moonligh.nutritionist.domain.profile.PatientRef;
import com.moonligh.nutritionist.domain.profile.PatientSnapshot;

/**
 * 患者绑定与写业务前校验。
 */
@Service
public class PatientBindingService {

    private final PatientBindingStore bindingStore;
    private final PatientGateway patientGateway;

    public PatientBindingService(PatientBindingStore bindingStore, PatientGateway patientGateway) {
        this.bindingStore = bindingStore;
        this.patientGateway = patientGateway;
    }

    public PatientRef bind(String accountId, String patientId, String patientVersion) {
        PatientSnapshot snapshot = patientGateway
                .findOwnedPatient(accountId, patientId)
                .orElseThrow(() -> new BusinessException(ErrorCode.PATIENT_NOT_BOUND));
        if (!snapshot.ownedByAccount()) {
            throw new BusinessException(ErrorCode.PATIENT_NOT_BOUND);
        }
        if (!snapshot.patientVersion().equals(patientVersion)) {
            throw new BusinessException(ErrorCode.PATIENT_VERSION_CONFLICT);
        }
        PatientRef ref = new PatientRef(accountId, patientId, patientVersion, Instant.now());
        bindingStore.save(ref);
        return ref;
    }

    /**
     * 写业务前必须已绑定，且请求版本与挂号当前版本一致。
     */
    public PatientRef requireBoundPatient(String accountId, String patientId, String patientVersion) {
        PatientRef local = bindingStore
                .find(accountId, patientId)
                .orElseThrow(() -> new BusinessException(ErrorCode.PATIENT_NOT_BOUND));

        PatientSnapshot snapshot = patientGateway
                .findOwnedPatient(accountId, patientId)
                .orElseThrow(() -> new BusinessException(ErrorCode.PATIENT_NOT_BOUND));
        if (!snapshot.ownedByAccount()) {
            throw new BusinessException(ErrorCode.PATIENT_NOT_BOUND);
        }
        if (!snapshot.patientVersion().equals(patientVersion)
                || !snapshot.patientVersion().equals(local.patientVersion())) {
            throw new BusinessException(ErrorCode.PATIENT_VERSION_CONFLICT);
        }
        return local;
    }
}
