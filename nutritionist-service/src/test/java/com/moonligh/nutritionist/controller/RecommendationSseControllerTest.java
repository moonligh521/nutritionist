package com.moonligh.nutritionist.controller;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.time.LocalDate;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.Executors;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Test;

import com.moonligh.nutritionist.api.req.CreateRecommendationReq;
import com.moonligh.nutritionist.infrastructure.identity.FakePatientGateway;
import com.moonligh.nutritionist.infrastructure.persistence.InMemoryPatientBindingStore;
import com.moonligh.nutritionist.service.PatientBindingService;
import com.moonligh.nutritionist.service.RecommendationWorkflow;

import reactor.core.Disposable;

class RecommendationSseControllerTest {

    private final java.util.concurrent.ExecutorService executor = Executors.newVirtualThreadPerTaskExecutor();
    private final CountDownLatch release = new CountDownLatch(1);

    @AfterEach
    void tearDown() {
        release.countDown();
        executor.close();
    }

    @Test
    void disconnectCancelsTheRunningTask() throws Exception {
        FakePatientGateway gateway = new FakePatientGateway();
        gateway.put("acc-1", "pat-1", "pv1");
        PatientBindingService bindings = new PatientBindingService(new InMemoryPatientBindingStore(), gateway);
        bindings.bind("acc-1", "pat-1", "pv1");
        RecommendationWorkflow workflow = new RecommendationWorkflow(
                executor,
                bindings,
                (accountId, request) -> new RecommendationWorkflow.VersionSnapshot("profile-1", "pantry-1"),
                request -> release.await());
        var accepted = workflow.create("acc-1", new CreateRecommendationReq(
                "pat-1", "pv1", "profile-1", "pantry-1", 1, 2, LocalDate.now(), "Asia/Shanghai", 2));
        RecommendationSseController controller = new RecommendationSseController(workflow);

        Disposable subscription = controller.events(accepted.recommendationId()).subscribe();
        subscription.dispose();

        assertEquals(
                RecommendationWorkflow.TaskStatus.CANCELLED,
                workflow.find(accepted.recommendationId()).status());
    }
}
