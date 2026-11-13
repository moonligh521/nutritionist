package com.moonligh.nutritionist.service;

import java.time.Instant;
import java.time.ZoneId;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.Executor;

import org.springframework.beans.factory.ObjectProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.moonligh.consult.framework.BusinessException;
import com.moonligh.consult.framework.ErrorCode;
import com.moonligh.consult.framework.redis.ExclusiveGuard;
import com.moonligh.nutritionist.api.req.CreateRecommendationReq;
import com.moonligh.nutritionist.api.res.RecommendationAcceptedRes;
import com.moonligh.nutritionist.domain.recommendation.InMemoryRecommendationTaskStore;
import com.moonligh.nutritionist.domain.recommendation.RecommendationTaskStore;
import com.moonligh.nutritionist.domain.solver.SolverConflict;
import com.moonligh.nutritionist.domain.solver.SolverInfeasibleException;

@Service
public class RecommendationWorkflow {

    private final Executor executor;
    private final PatientBindingService bindings;
    private final VersionSnapshotProvider versions;
    private final RecommendationWork work;
    private final RecommendationTaskStore tasks;
    private final ExclusiveGuard guard;

    public RecommendationWorkflow(
            @Qualifier("recommendationExecutor") Executor executor,
            PatientBindingService bindings,
            VersionSnapshotProvider versions,
            RecommendationWork work) {
        this(executor, bindings, versions, work, new InMemoryRecommendationTaskStore(), ExclusiveGuard.NONE);
    }

    @Autowired
    public RecommendationWorkflow(
            @Qualifier("recommendationExecutor") Executor executor,
            PatientBindingService bindings,
            VersionSnapshotProvider versions,
            RecommendationWork work,
            RecommendationTaskStore tasks,
            ObjectProvider<ExclusiveGuard> guards) {
        this(executor, bindings, versions, work, tasks, guards.getIfAvailable(() -> ExclusiveGuard.NONE));
    }

    private RecommendationWorkflow(
            Executor executor,
            PatientBindingService bindings,
            VersionSnapshotProvider versions,
            RecommendationWork work,
            RecommendationTaskStore tasks,
            ExclusiveGuard guard) {
        this.executor = executor;
        this.bindings = bindings;
        this.versions = versions;
        this.work = work;
        this.tasks = tasks;
        this.guard = guard;
    }

    public RecommendationAcceptedRes create(String accountId, CreateRecommendationReq request) {
        validate(request);
        bindings.requireBoundPatient(accountId, request.patientId(), request.patientVersion());
        String scopeKey = scopeKey(accountId, request);
        return guard.exclusive(scopeKey, () -> insertPending(accountId, request, scopeKey));
    }

    private RecommendationAcceptedRes insertPending(String accountId, CreateRecommendationReq request, String scopeKey) {
        String recommendationId = UUID.randomUUID().toString();
        Task pending = new Task(
                recommendationId, accountId, request, TaskStatus.PENDING, null, Instant.now(), Instant.now());
        tasks.insertPending(pending, scopeKey);
        executor.execute(() -> execute(pending));
        String base = "/api/nutrition/recommendations/" + recommendationId;
        return new RecommendationAcceptedRes(recommendationId, TaskStatus.PENDING.code(), base + "/events", base);
    }

    public Task find(String recommendationId) {
        return tasks.find(recommendationId).orElseThrow(() -> new BusinessException(ErrorCode.PARAM_INVALID));
    }

    public Task cancel(String recommendationId) {
        Task current = find(recommendationId);
        if (current.status() == TaskStatus.SUCCEEDED || current.status() == TaskStatus.FAILED) {
            return current;
        }
        Task cancelled = current.withStatus(TaskStatus.CANCELLED, null);
        tasks.save(cancelled);
        return cancelled;
    }

    private void execute(Task initial) {
        tasks.save(initial.withStatus(TaskStatus.RUNNING, null));
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
                tasks.save(initial.withStatus(TaskStatus.FAILED, ErrorCode.RECOMMENDATION_EXPIRED.getCode()));
                return;
            }
            tasks.save(initial.withStatus(TaskStatus.SUCCEEDED, null));
        } catch (InterruptedException error) {
            Thread.currentThread().interrupt();
            tasks.save(initial.withStatus(TaskStatus.CANCELLED, null));
        } catch (SolverInfeasibleException error) {
            tasks.save(initial.withFailure(ErrorCode.SOLVER_INFEASIBLE.getCode(), error.conflicts()));
        } catch (BusinessException error) {
            int failureCode = error.getErrorCode() == ErrorCode.PATIENT_VERSION_CONFLICT
                    ? ErrorCode.RECOMMENDATION_EXPIRED.getCode()
                    : error.getErrorCode().getCode();
            tasks.save(initial.withStatus(TaskStatus.FAILED, failureCode));
        } catch (RuntimeException error) {
            tasks.save(initial.withStatus(TaskStatus.FAILED, ErrorCode.SOLVER_INFEASIBLE.getCode()));
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

    /** 算完前用来核对的画像版本和库存版本。 */
    public record VersionSnapshot(
            /** 画像版本。 */
            String profileVersion,
            /** 库存版本。 */
            String pantryVersion) {
    }

    /** 一次推荐任务。创建后先是等待，计算在后台进行。 */
    public record Task(
            /** 推荐任务标识。 */
            String recommendationId,
            /** 账号标识。 */
            String accountId,
            /** 原始请求。 */
            CreateRecommendationReq request,
            /** 任务状态。 */
            TaskStatus status,
            /** 失败码。未失败时为空。 */
            Integer failureCode,
            /** 创建时间。 */
            Instant createdAt,
            /** 状态更新时间。 */
            Instant updatedAt,
            /** 无解时的冲突约束。 */
            List<SolverConflict> conflicts) {

        public Task(
                String recommendationId,
                String accountId,
                CreateRecommendationReq request,
                TaskStatus status,
                Integer failureCode,
                Instant createdAt,
                Instant updatedAt) {
            this(recommendationId, accountId, request, status, failureCode, createdAt, updatedAt, List.of());
        }

        public Task {
            conflicts = conflicts == null ? List.of() : List.copyOf(conflicts);
        }

        Task withStatus(TaskStatus nextStatus, Integer nextFailureCode) {
            return new Task(
                    recommendationId, accountId, request, nextStatus, nextFailureCode, createdAt, Instant.now(), conflicts);
        }

        Task withFailure(Integer nextFailureCode, List<SolverConflict> nextConflicts) {
            return new Task(
                    recommendationId,
                    accountId,
                    request,
                    TaskStatus.FAILED,
                    nextFailureCode,
                    createdAt,
                    Instant.now(),
                    nextConflicts);
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
