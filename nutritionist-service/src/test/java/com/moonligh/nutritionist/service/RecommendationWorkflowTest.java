package com.moonligh.nutritionist.service;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

import java.time.LocalDate;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.moonligh.consult.framework.BusinessException;
import com.moonligh.consult.framework.ErrorCode;
import com.moonligh.nutritionist.api.req.CreateRecommendationReq;
import com.moonligh.nutritionist.infrastructure.identity.FakePatientGateway;
import com.moonligh.nutritionist.infrastructure.persistence.InMemoryPatientBindingStore;

class RecommendationWorkflowTest {

    private final java.util.concurrent.ExecutorService executor = Executors.newVirtualThreadPerTaskExecutor();
    private CountDownLatch solving;
    private CountDownLatch release;
    private AtomicReference<RecommendationWorkflow.VersionSnapshot> versions;
    private RecommendationWorkflow workflow;

    @BeforeEach
    void setUp() {
        FakePatientGateway gateway = new FakePatientGateway();
        gateway.put("acc-1", "pat-1", "pv1");
        InMemoryPatientBindingStore store = new InMemoryPatientBindingStore();
        PatientBindingService bindings = new PatientBindingService(store, gateway);
        bindings.bind("acc-1", "pat-1", "pv1");
        solving = new CountDownLatch(1);
        release = new CountDownLatch(1);
        versions = new AtomicReference<>(new RecommendationWorkflow.VersionSnapshot("profile-1", "pantry-1"));
        workflow = new RecommendationWorkflow(
                executor,
                bindings,
                (accountId, request) -> versions.get(),
                request -> {
                    solving.countDown();
                    release.await();
                });
    }

    @AfterEach
    void tearDown() {
        release.countDown();
        executor.close();
    }

    @Test
    void returnsPendingImmediatelyAndExpiresIfVersionsChangeBeforeCompletion() throws Exception {
        var accepted = workflow.create("acc-1", request());
        assertEquals(RecommendationWorkflow.TaskStatus.PENDING.code(), accepted.taskStatusCode());
        solving.await(2, TimeUnit.SECONDS);

        versions.set(new RecommendationWorkflow.VersionSnapshot("profile-2", "pantry-1"));
        release.countDown();

        RecommendationWorkflow.Task task = awaitTerminal(accepted.recommendationId());
        assertEquals(RecommendationWorkflow.TaskStatus.FAILED, task.status());
        assertEquals(ErrorCode.RECOMMENDATION_EXPIRED.getCode(), task.failureCode());
    }

    @Test
    void enforcesSingleFlightForSameScope() throws Exception {
        workflow.create("acc-1", request());
        solving.await(2, TimeUnit.SECONDS);

        BusinessException error = assertThrows(BusinessException.class, () -> workflow.create("acc-1", request()));

        assertEquals(ErrorCode.RECOMMENDATION_IN_PROGRESS, error.getErrorCode());
    }

    private RecommendationWorkflow.Task awaitTerminal(String id) throws InterruptedException {
        for (int attempt = 0; attempt < 100; attempt++) {
            RecommendationWorkflow.Task task = workflow.find(id);
            if (task.status() == RecommendationWorkflow.TaskStatus.FAILED
                    || task.status() == RecommendationWorkflow.TaskStatus.SUCCEEDED) {
                return task;
            }
            Thread.sleep(10);
        }
        throw new AssertionError("task did not finish");
    }

    private static CreateRecommendationReq request() {
        return new CreateRecommendationReq(
                "pat-1", "pv1", "profile-1", "pantry-1", 1, 2, LocalDate.now(), "Asia/Shanghai", 2);
    }
}
