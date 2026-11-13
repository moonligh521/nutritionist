package com.moonligh.nutritionist.service;

import java.time.Instant;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.CopyOnWriteArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moonligh.nutritionist.domain.common.EntityTable;
import com.moonligh.nutritionist.infrastructure.persistence.NutritionDataStore;

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
    private final NutritionDataStore records;

    private final ClinicalRecordDirectory clinicalRecord;

    public ClinicalRecordService(PatientBindingService bindings) {
        this.bindings = bindings;
        this.records = null;
        this.clinicalRecord = null;
    }

    public ClinicalRecordService(PatientBindingService bindings, NutritionDataStore records) {
        this.bindings = bindings;
        this.records = records;
        this.clinicalRecord = null;
    }

    @Autowired
    public ClinicalRecordService(
            PatientBindingService bindings,
            org.springframework.beans.factory.ObjectProvider<NutritionDataStore> records,
            org.springframework.beans.factory.ObjectProvider<ClinicalRecordDirectory> clinicalRecord) {
        this.bindings = bindings;
        this.records = records.getIfAvailable();
        this.clinicalRecord = clinicalRecord.getIfAvailable();
    }
    /** 按患者编号收病情。一位患者可以有多条，新的只追加，不覆盖旧的。 */
    private final EntityTable<PatientConditions> conditions = new EntityTable<>(PatientConditions::patientId);
    private final EntityTable<PatientMedications> medications = new EntityTable<>(PatientMedications::patientId);
    private final EntityTable<PatientAllergies> allergies = new EntityTable<>(PatientAllergies::patientId);
    private final EntityTable<ConfirmedAllergens> confirmedAllergens = new EntityTable<>(ConfirmedAllergens::patientId);
    private final EntityTable<StoredMeasurement> measurements = new EntityTable<>(StoredMeasurement::eventId);
    private final EntityTable<PatientMeasurements> measurementsByPatient =
            new EntityTable<>(PatientMeasurements::patientId);


    public ConditionRes addCondition(String accountId, CreateConditionReq request) {
        requirePatient(accountId, request == null ? null : request.patientId(), request == null ? null : request.patientVersion());
        if (request.conditionCode() == null || request.conditionCode().isBlank() || request.sourceCode() == null) {
            throw new BusinessException(ErrorCode.PARAM_INVALID);
        }
        ConditionRes created = new ConditionRes(UUID.randomUUID().toString(), "1", 1);
        if (clinicalRecord != null && clinicalRecord.enabled()) {
            clinicalRecord.declarePresentDiagnosis(request.patientId(), request.conditionCode());
            return created;
        }
        PatientConditions row = conditions.findOrCreate(request.patientId(), () -> new PatientConditions(request.patientId()));
        row.items().add(created);
        row.codes().add(request.conditionCode());
        if (records != null) {
            records.insertCondition(request.patientId(), created, request);
        }
        return created;
    }

    public MedicationRes addMedication(String accountId, CreateMedicationReq request) {
        requirePatient(accountId, request == null ? null : request.patientId(), request == null ? null : request.patientVersion());
        if (request.medicationName() == null || request.medicationName().isBlank()) {
            throw new BusinessException(ErrorCode.PARAM_INVALID);
        }
        MedicationRes created = new MedicationRes(UUID.randomUUID().toString(), "1", request.completeConfirmed());
        PatientMedications row = medications.findOrCreate(request.patientId(), () -> new PatientMedications(request.patientId()));
        row.items().add(created);
        row.names().add(request.medicationName());
        if (request.categoryCode() != null) {
            row.categories().add(request.categoryCode());
        }
        if (records != null) {
            records.insertMedication(request.patientId(), created, request);
        }
        return created;
    }

    public AllergyRes addAllergy(String accountId, CreateAllergyReq request) {
        requirePatient(accountId, request == null ? null : request.patientId(), request == null ? null : request.patientVersion());
        if (request.allergenCode() == null || request.allergenCode().isBlank() || request.severityCode() == null) {
            throw new BusinessException(ErrorCode.PARAM_INVALID);
        }
        AllergyRes created = new AllergyRes(UUID.randomUUID().toString(), "1", request.confirmed());
        allergies.findOrCreate(request.patientId(), () -> new PatientAllergies(request.patientId())).items().add(created);
        if (request.confirmed()) {
            confirmedAllergens.findOrCreate(request.patientId(), () -> new ConfirmedAllergens(request.patientId()))
                    .codes().add(request.allergenCode());
        }
        if (records != null) {
            records.insertAllergy(request.patientId(), created, request);
        }
        return created;
    }

    public boolean confirmedAllergen(String patientId, String allergenCode) {
        if (patientId == null || patientId.isBlank() || allergenCode == null || allergenCode.isBlank()) {
            return false;
        }
        ConfirmedAllergens row = confirmedAllergens.findOrCreate(patientId, () -> new ConfirmedAllergens(patientId));
        if (records != null) {
            for (String code : records.confirmedAllergens(patientId)) {
                if (!row.codes().contains(code)) {
                    row.codes().add(code);
                }
            }
        }
        return row.codes().contains(allergenCode);
    }

    public MeasurementRes addMeasurement(String accountId, CreateMeasurementReq request) {
        requirePatient(accountId, request == null ? null : request.patientId(), request == null ? null : request.patientVersion());
        if (request.eventId() == null || request.eventId().isBlank() || request.typeCode() == null
                || request.value() == null || request.unitCode() == null || request.observedAt() == null
                || request.sourceCode() == null || (request.typeCode() == 1 && request.contextCode() == null)) {
            throw new BusinessException(ErrorCode.PARAM_INVALID);
        }
        MeasurementRes existing = measurements.find(request.eventId()).map(StoredMeasurement::result).orElse(null);
        if (existing == null && records != null) {
            existing = records.findMeasurement(request.eventId()).orElse(null);
            if (existing != null) {
                measurements.save(new StoredMeasurement(request.eventId(), existing));
            }
        }
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
        measurements.save(new StoredMeasurement(request.eventId(), created));
        measurementsByPatient.findOrCreate(request.patientId(), () -> new PatientMeasurements(request.patientId()))
                .items().add(new TimedPermission(request.observedAt(), created.safetyPermissionCode()));
        if (records != null) {
            records.insertMeasurement(request.patientId(), request.eventId(), request.value(), request.typeCode(),
                    request.unitCode(), request.observedAt(), created);
        }
        return created;
    }

    public List<String> medicationNames(String patientId) {
        PatientMedications row = medications.findOrCreate(patientId, () -> new PatientMedications(patientId));
        if (records != null) {
            for (String name : records.medicationNames(patientId)) {
                if (!row.names().contains(name)) {
                    row.names().add(name);
                }
            }
        }
        return List.copyOf(row.names());
    }

    public List<Integer> medicationCategories(String patientId) {
        PatientMedications row = medications.findOrCreate(patientId, () -> new PatientMedications(patientId));
        if (records != null) {
            for (Integer code : records.medicationCategories(patientId)) {
                if (code != null && !row.categories().contains(code)) {
                    row.categories().add(code);
                }
            }
        }
        return List.copyOf(row.categories());
    }

    public boolean latestMeasurementStopsPlanning(String patientId) {
        if (patientId == null) {
            return false;
        }
        Instant latestAt = null;
        Integer latestPermission = null;
        for (TimedPermission item : measurementsByPatient.find(patientId)
                .map(PatientMeasurements::items)
                .orElse(List.of())) {
            if (item.observedAt() == null) {
                continue;
            }
            if (latestAt == null || item.observedAt().isAfter(latestAt)) {
                latestAt = item.observedAt();
                latestPermission = item.safetyPermissionCode();
            }
        }
        if (records != null) {
            NutritionDataStore.LatestMeasurement stored = records.latestMeasurement(patientId).orElse(null);
            if (stored != null && stored.observedAt() != null
                    && (latestAt == null || stored.observedAt().isAfter(latestAt))) {
                latestPermission = stored.safetyPermissionCode();
            }
        }
        return latestPermission != null && latestPermission == SafetyPermission.STOP.code();
    }

    public boolean hasCondition(String patientId, String conditionCode) {
        if (patientId == null || conditionCode == null) {
            return false;
        }
        if (clinicalRecord != null && clinicalRecord.enabled()) {
            return clinicalRecord.hasPresentDiagnosis(patientId, conditionCode);
        }
        if (localCodes(patientId).contains(conditionCode)) {
            return true;
        }
        if (records == null) {
            return false;
        }
        List<String> stored = records.conditionCodes(patientId);
        PatientConditions row = conditions.findOrCreate(patientId, () -> new PatientConditions(patientId));
        for (String code : stored) {
            if (!row.codes().contains(code)) {
                row.codes().add(code);
            }
        }
        return row.codes().contains(conditionCode);
    }

    public List<String> conditionCodes(String patientId) {
        if (patientId == null) {
            return List.of();
        }
        if (clinicalRecord != null && clinicalRecord.enabled()) {
            return clinicalRecord.presentDiagnosisCodes(patientId);
        }
        if (records != null) {
            hasCondition(patientId, "");
        }
        return List.copyOf(localCodes(patientId));
    }

    private List<String> localCodes(String patientId) {
        return conditions.find(patientId).map(PatientConditions::codes).orElse(List.of());
    }

    public int conditionCount(String patientId) {
        if (records != null) {
            return records.conditionCount(patientId);
        }
        return conditions.find(patientId).map(row -> row.items().size()).orElse(0);
    }

    private void requirePatient(String accountId, String patientId, String patientVersion) {
        if (patientId == null || patientId.isBlank() || patientVersion == null || patientVersion.isBlank()) {
            throw new BusinessException(ErrorCode.PARAM_INVALID);
        }
        bindings.requireBoundPatient(accountId, patientId, patientVersion);
    }

    /** 一位患者追加的病情，新记录接在后面。 */
    static final class PatientConditions {
        private final String patientId;
        private final List<ConditionRes> items = new CopyOnWriteArrayList<>();
        private final List<String> codes = new CopyOnWriteArrayList<>();

        PatientConditions(String patientId) {
            this.patientId = patientId;
        }

        String patientId() {
            return patientId;
        }

        List<ConditionRes> items() {
            return items;
        }

        List<String> codes() {
            return codes;
        }
    }

    static final class PatientMedications {
        private final String patientId;
        private final List<MedicationRes> items = new CopyOnWriteArrayList<>();
        private final List<String> names = new CopyOnWriteArrayList<>();
        private final List<Integer> categories = new CopyOnWriteArrayList<>();

        PatientMedications(String patientId) {
            this.patientId = patientId;
        }

        String patientId() {
            return patientId;
        }

        List<MedicationRes> items() {
            return items;
        }

        List<String> names() {
            return names;
        }

        List<Integer> categories() {
            return categories;
        }
    }

    static final class ConfirmedAllergens {
        private final String patientId;
        private final List<String> codes = new CopyOnWriteArrayList<>();

        ConfirmedAllergens(String patientId) {
            this.patientId = patientId;
        }

        String patientId() {
            return patientId;
        }

        List<String> codes() {
            return codes;
        }
    }

    static final class PatientAllergies {
        private final String patientId;
        private final List<AllergyRes> items = new CopyOnWriteArrayList<>();

        PatientAllergies(String patientId) {
            this.patientId = patientId;
        }

        String patientId() {
            return patientId;
        }

        List<AllergyRes> items() {
            return items;
        }
    }

    /** 一次测量。eventId 相同表示同一次上报，不重复记。 */
    record StoredMeasurement(String eventId, MeasurementRes result) {
    }

    static final class PatientMeasurements {
        private final String patientId;
        private final List<TimedPermission> items = new CopyOnWriteArrayList<>();

        PatientMeasurements(String patientId) {
            this.patientId = patientId;
        }

        String patientId() {
            return patientId;
        }

        List<TimedPermission> items() {
            return items;
        }
    }

    record TimedPermission(Instant observedAt, int safetyPermissionCode) {
    }
}