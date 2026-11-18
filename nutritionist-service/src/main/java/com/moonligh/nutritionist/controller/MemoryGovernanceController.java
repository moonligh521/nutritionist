package com.moonligh.nutritionist.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.moonligh.consult.framework.Result;
import com.moonligh.nutritionist.domain.dialogue.AppliedMemoryWrite;
import com.moonligh.nutritionist.domain.dialogue.PreferenceFact;
import com.moonligh.nutritionist.domain.dialogue.PreferenceSnapshot;
import com.moonligh.nutritionist.domain.dialogue.PreferenceStrength;
import com.moonligh.nutritionist.service.dialogue.AllergySuspectStore;
import com.moonligh.nutritionist.service.dialogue.AllergySuspectStore.Suspect;
import com.moonligh.nutritionist.service.dialogue.MemoryGovernanceService;
import com.moonligh.nutritionist.service.dialogue.MemoryMetrics;
import com.moonligh.nutritionist.service.dialogue.PreferenceStore;

/** 记忆治理：合并、撤销、纠错、隐私删除、过敏确认、历史、指标。 */
@RestController
@RequestMapping("/api/nutrition/memory")
public class MemoryGovernanceController {

    private final MemoryGovernanceService governance;
    private final MemoryMetrics metrics;
    private final PreferenceStore preferences;
    private final AllergySuspectStore allergySuspects;

    public MemoryGovernanceController(
            MemoryGovernanceService governance,
            MemoryMetrics metrics,
            PreferenceStore preferences,
            AllergySuspectStore allergySuspects) {
        this.governance = governance;
        this.metrics = metrics;
        this.preferences = preferences;
        this.allergySuspects = allergySuspects;
    }

    @PostMapping("/merge")
    public Result<AppliedMemoryWrite> merge(@RequestBody MergeRequest request) {
        if (request == null || blank(request.sessionId()) || blank(request.patientId())) {
            return Result.fail("sessionId 与 patientId 必填");
        }
        try {
            return Result.ok(governance.mergeSessionToPatient(
                    request.sessionId(), request.patientId(), request.actor()));
        } catch (IllegalStateException error) {
            return Result.fail(error.getMessage());
        }
    }

    @PostMapping("/retract")
    public Result<AppliedMemoryWrite> retract(@RequestBody RetractRequest request) {
        if (request == null || blank(request.ownerId()) || blank(request.subject())) {
            return Result.fail("ownerId 与 subject 必填");
        }
        return Result.ok(governance.retract(
                request.ownerId(), request.subject(), request.note(), request.sessionId()));
    }

    @PostMapping("/correct-avoid")
    public Result<AppliedMemoryWrite> correctAvoid(@RequestBody CorrectAvoidRequest request) {
        if (request == null || blank(request.ownerId()) || blank(request.subject())) {
            return Result.fail("ownerId 与 subject 必填");
        }
        PreferenceStrength strength = PreferenceStrength.MODERATE;
        if (request.strength() != null && !request.strength().isBlank()) {
            strength = PreferenceStrength.valueOf(request.strength().trim().toUpperCase());
        }
        return Result.ok(governance.correctAvoid(
                request.ownerId(), request.subject(), strength, request.note(), request.sessionId()));
    }

    @PostMapping("/delete")
    public Result<AppliedMemoryWrite> delete(@RequestBody DeleteRequest request) {
        if (request == null || blank(request.ownerId())) {
            return Result.fail("ownerId 必填");
        }
        return Result.ok(governance.deletePreferences(request.ownerId(), request.note()));
    }

    @GetMapping("/snapshot")
    public Result<PreferenceSnapshot> snapshot(@RequestParam String ownerId) {
        if (blank(ownerId)) {
            return Result.fail("ownerId 必填");
        }
        return Result.ok(governance.history(ownerId));
    }

    @GetMapping("/facts")
    public Result<List<PreferenceFact>> facts(@RequestParam String ownerId) {
        if (blank(ownerId)) {
            return Result.fail("ownerId 必填");
        }
        return Result.ok(governance.facts(ownerId));
    }

    @GetMapping("/metrics")
    public Result<MemoryMetrics.Snapshot> metrics() {
        return Result.ok(metrics.snapshot());
    }

    @PostMapping("/expire-due")
    public Result<Integer> expireDue() {
        int closed = preferences.expireDue(null);
        metrics.markExpiry(closed);
        return Result.ok(closed);
    }

    @GetMapping("/allergy-suspects")
    public Result<List<Suspect>> allergySuspects(@RequestParam String ownerId) {
        if (blank(ownerId)) {
            return Result.fail("ownerId 必填");
        }
        return Result.ok(allergySuspects.pending(ownerId));
    }

    @PostMapping("/allergy-suspects/dismiss")
    public Result<String> dismissAllergy(@RequestBody AllergyActionRequest request) {
        if (request == null || blank(request.ownerId()) || blank(request.subject())) {
            return Result.fail("ownerId 与 subject 必填");
        }
        governance.dismissAllergySuspect(request.ownerId(), request.subject());
        return Result.ok("ok");
    }

    @PostMapping("/allergy-suspects/confirm")
    public Result<String> confirmAllergy(@RequestBody AllergyActionRequest request) {
        if (request == null || blank(request.ownerId()) || blank(request.subject())) {
            return Result.fail("ownerId 与 subject 必填");
        }
        try {
            governance.confirmAllergySuspect(request.ownerId(), request.subject(), request.accountId());
            return Result.ok("ok");
        } catch (RuntimeException error) {
            return Result.fail(error.getMessage() == null ? "确认失败" : error.getMessage());
        }
    }

    private static boolean blank(String value) {
        return value == null || value.isBlank();
    }

    public record MergeRequest(String sessionId, String patientId, String actor) {
    }

    public record RetractRequest(String ownerId, String subject, String note, String sessionId) {
    }

    public record CorrectAvoidRequest(String ownerId, String subject, String strength, String note, String sessionId) {
    }

    public record DeleteRequest(String ownerId, String note) {
    }

    public record AllergyActionRequest(String ownerId, String subject, String accountId) {
    }
}
