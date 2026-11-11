package com.moonligh.nutritionist.service;

import java.time.Instant;
import java.time.ZoneId;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Executor;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.moonligh.consult.framework.BusinessException;
import com.moonligh.consult.framework.ErrorCode;
import com.moonligh.nutritionist.api.req.CreateRecommendationReq;
import com.moonligh.nutritionist.api.res.RecommendationAcceptedRes;

@Service
public class RecommendationWorkflow {

    private final Executor executor;
    private final PatientBindingService bindings;
    private final VersionSnapshotProvider versions;
    private final RecommendationWork work;
    private final ConcurrentHashMap<String, Task> tasks = new ConcurrentHashMap<>();
    private final ConcurrentHashMap<String, String> activeScopes = new ConcurrentHashMap<>();

    public RecommendationWorkflow(
            @Qualifier("recommendationExecutor") Executor executor,
            PatientBindingService bindings,
            VersionSnapshotProvider versions,
            RecommendationWork work) {
        this.executor = executor;
        this.bindings = bindings;
        this.versions = versions;
        this.work = work;
    }

    public RecommendationAcceptedRes create(String accountId, CreateRecommendationReq request) {
        validate(request);
        bindings.requireBoundPatient(accountId, request.patientId(), request.patientVersion());
        String scopeKey = scopeKey(accountId, request);
        String recommendationId = UUID.randomUUID().toString();
        if (activeScopes.putIfAbsent(scopeKey, recommendationId) != null) {
            throw new BusinessException(ErrorCode.RECOMMENDATION_IN_PROGRESS);
        }
        Task pending = new Task(
                recommendationId, accountId, request, TaskStatus.PENDING, null, Instant.now(), Instant.now());
        tasks.put(recommendationId, pending);
        executor.execute(() -> execute(pending, scopeKey));
        String base = "/api/nutrition/recommendations/" + recommendationId;
        return new RecommendationAcceptedRes(recommendationId, TaskStatus.PENDING.code(), base + "/events", base);
    }

    public Task find(String recommendationId) {
        Task task = tasks.get(recommendationId);
        if (task == null) {
            throw new BusinessException(ErrorCode.PARAM_INVALID);
        }
        return task;
    }

    public Task cancel(String recommendationId) {
        return tasks.compute(
                recommendationId,
                (ignored, current) -> {
                    if (current == null) {
                        throw new BusinessException(ErrorCode.PARAM_INVALID);
                    }
                    if (current.status() == TaskStatus.SUCCEEDED || current.status() == TaskStatus.FAILED) {
                        return current;
                    }
                    return current.withStatus(TaskStatus.CANCELLED, null);
                });
    }

    private void execute(Task initial, String scopeKey) {
        tasks.put(initial.recommendationId(), initial.withStatus(TaskStatus.RUNNING, null));
        try {
            work.perform(initial.request());
            if (find(initial.recommendationId()).status() == TaskStatus.CANCELLED) {
                return;
            }
            bindings.requireBoundPatient(
                    initial.accountId(), initial.request().patientId(), initial.request().patientVersion());
            VersionSnapshot current = versions.current(initial.accountId(), initial.request());
            if (!initial.request().profileVersion().equals(current.profileVersion())
                    || !initial.request().pantryVersion().equals(current.pantryVersion())) {
                tasks.put(
                        initial.recommendationId(),
                        initial.withStatus(TaskStatus.FAILED, ErrorCode.RECOMMENDATION_EXPIRED.getCode()));
                return;
            }
            tasks.put(initial.recommendationId(), initial.withStatus(TaskStatus.SUCCEEDED, null));
        } catch (InterruptedException error) {
            Thread.currentThread().interrupt();
            tasks.put(initial.recommendationId(), initial.withStatus(TaskStatus.CANCELLED, null));
        } catch (BusinessException error) {
            int failureCode = error.getErrorCode() == ErrorCode.PATIENT_VERSION_CONFLICT
                    ? ErrorCode.RECOMMENDATION_EXPIRED.getCode()
                    : error.getErrorCode().getCode();
            tasks.put(initial.recommendationId(), initial.withStatus(TaskStatus.FAILED, failureCode));
        } catch (RuntimeException error) {
            tasks.put(
                    initial.recommendationId(),
                    initial.withStatus(TaskStatus.FAILED, ErrorCode.SOLVER_INFEASIBLE.getCode()));
        } finally {
            activeScopes.remove(scopeKey, initial.recommendationId());
        }
    }

    private static String scopeKey(String accountId, CreateRecommendationReq request) {
        return accountId + '|' + request.patientId() + '|' + request.date() + '|' + request.scopeCode() + '|'
                + request.mealTypeCode();
    }

    private static void validate(CreateRecommendationReq request) {
        if (request == null
                || blank(request.patientId())
                || blank(request.patientVersion())
                || blank(request.profileVersion())
                || blank(request.pantryVersion())
                || request.scopeCode() == null
                || request.date() == null
                || blank(request.timezone())
                || request.pantryModeCode() == null
                || (request.scopeCode() == 1 && request.mealTypeCode() == null)) {
            throw new BusinessException(ErrorCode.PARAM_INVALID);
        }
        try {
            ZoneId.of(request.timezone());
        } catch (RuntimeException error) {
            throw new BusinessException(ErrorCode.PARAM_INVALID);
        }
    }

    private static boolean blank(String value) {
        return value == null || value.isBlank();
    }

    @FunctionalInterface
    public interface VersionSnapshotProvider {
        VersionSnapshot current(String accountId, CreateRecommendationReq request);
    }

    @FunctionalInterface
    public interface RecommendationWork {
        void perform(CreateRecommendationReq request) throws InterruptedException;
    }

    public record VersionSnapshot(String profileVersion, String pantryVersion) {
    }

    public record Task(
            String recommendationId,
            String accountId,
            CreateRecommendationReq request,
            TaskStatus status,
            Integer failureCode,
            Instant createdAt,
            Instant updatedAt) {

        Task withStatus(TaskStatus nextStatus, Integer nextFailureCode) {
            return new Task(
                    recommendationId, accountId, request, nextStatus, nextFailureCode, createdAt, Instant.now());
        }

        public String id() {
            return recommendationId;
        }
    }

    public enum TaskStatus {
        PENDING(1),
        RUNNING(2),
        SUCCEEDED(3),
        FAILED(4),
        CANCELLED(5),
        TIMED_OUT(6);

        private final int code;

        TaskStatus(int code) {
            this.code = code;
        }

        public int code() {
            return code;
        }
    }
}
