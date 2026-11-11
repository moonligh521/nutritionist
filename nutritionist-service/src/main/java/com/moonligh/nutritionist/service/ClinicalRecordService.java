package com.moonligh.nutritionist.service;

import java.util.List;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;

import org.springframework.stereotype.Service;

import com.moonligh.consult.framework.BusinessException;
import com.moonligh.consult.framework.ErrorCode;
import com.moonligh.nutritionist.api.req.CreateAllergyReq;
import com.moonligh.nutritionist.api.req.CreateConditionReq;
import com.moonligh.nutritionist.api.req.CreateMeasurementReq;
import com.moonligh.nutritionist.api.req.CreateMedicationReq;
import com.moonligh.nutritionist.api.res.AllergyRes;
import com.moonligh.nutritionist.api.res.ConditionRes;
import com.moonligh.nutritionist.api.res.MeasurementRes;
import com.moonligh.nutritionist.api.res.MedicationRes;
import com.moonligh.nutritionist.domain.outcome.MeasurementDecision;
import com.moonligh.nutritionist.domain.safety.ActionDisposition;
import com.moonligh.nutritionist.domain.safety.SafetyPermission;
import com.moonligh.nutritionist.domain.safety.SafetyReasonCategory;

@Service
public class ClinicalRecordService {

    private final PatientBindingService bindings;
    private final ConcurrentHashMap<String, CopyOnWriteArrayList<ConditionRes>> conditions = new ConcurrentHashMap<>();
    private final ConcurrentHashMap<String, CopyOnWriteArrayList<MedicationRes>> medications = new ConcurrentHashMap<>();
    private final ConcurrentHashMap<String, CopyOnWriteArrayList<AllergyRes>> allergies = new ConcurrentHashMap<>();
    private final ConcurrentHashMap<String, MeasurementRes> measurements = new ConcurrentHashMap<>();

    public ClinicalRecordService(PatientBindingService bindings) {
        this.bindings = bindings;
    }

    public ConditionRes addCondition(String accountId, CreateConditionReq request) {
        requirePatient(accountId, request == null ? null : request.patientId(), request == null ? null : request.patientVersion());
        if (request.conditionCode() == null || request.conditionCode().isBlank() || request.sourceCode() == null) {
            throw new BusinessException(ErrorCode.PARAM_INVALID);
        }
        ConditionRes created = new ConditionRes(UUID.randomUUID().toString(), "1", 1);
        conditions.computeIfAbsent(request.patientId(), ignored -> new CopyOnWriteArrayList<>()).add(created);
        return created;
    }

    public MedicationRes addMedication(String accountId, CreateMedicationReq request) {
        requirePatient(accountId, request == null ? null : request.patientId(), request == null ? null : request.patientVersion());
        if (request.medicationName() == null || request.medicationName().isBlank()) {
            throw new BusinessException(ErrorCode.PARAM_INVALID);
        }
        MedicationRes created = new MedicationRes(UUID.randomUUID().toString(), "1", request.completeConfirmed());
        medications.computeIfAbsent(request.patientId(), ignored -> new CopyOnWriteArrayList<>()).add(created);
        return created;
    }

    public AllergyRes addAllergy(String accountId, CreateAllergyReq request) {
        requirePatient(accountId, request == null ? null : request.patientId(), request == null ? null : request.patientVersion());
        if (request.allergenCode() == null || request.allergenCode().isBlank() || request.severityCode() == null) {
            throw new BusinessException(ErrorCode.PARAM_INVALID);
        }
        AllergyRes created = new AllergyRes(UUID.randomUUID().toString(), "1", request.confirmed());
        allergies.computeIfAbsent(request.patientId(), ignored -> new CopyOnWriteArrayList<>()).add(created);
        return created;
    }

    public MeasurementRes addMeasurement(String accountId, CreateMeasurementReq request) {
        requirePatient(accountId, request == null ? null : request.patientId(), request == null ? null : request.patientVersion());
        if (request.eventId() == null || request.eventId().isBlank() || request.typeCode() == null
                || request.value() == null || request.unitCode() == null || request.observedAt() == null
                || request.sourceCode() == null || (request.typeCode() == 1 && request.contextCode() == null)) {
            throw new BusinessException(ErrorCode.PARAM_INVALID);
        }
        MeasurementRes existing = measurements.get(request.eventId());
        if (existing != null) {
            return existing;
        }
        MeasurementDecision decision = request.urgent() ? MeasurementDecision.STOP : MeasurementDecision.RECORD_ONLY;
        SafetyPermission permission = request.urgent() ? SafetyPermission.STOP : SafetyPermission.ALLOWED;
        MeasurementRes created = new MeasurementRes(
                UUID.randomUUID().toString(),
                decision.code(),
                permission.code(),
                request.urgent() ? List.of(SafetyReasonCategory.ACUTE_RISK.code()) : List.of(),
                request.urgent() ? List.of(ActionDisposition.REFER_URGENT.code()) : List.of(ActionDisposition.CONTINUE.code()));
        measurements.put(request.eventId(), created);
        return created;
    }

    public int conditionCount(String patientId) {
        return conditions.getOrDefault(patientId, new CopyOnWriteArrayList<>()).size();
    }

    private void requirePatient(String accountId, String patientId, String patientVersion) {
        if (patientId == null || patientId.isBlank() || patientVersion == null || patientVersion.isBlank()) {
            throw new BusinessException(ErrorCode.PARAM_INVALID);
        }
        bindings.requireBoundPatient(accountId, patientId, patientVersion);
    }
}