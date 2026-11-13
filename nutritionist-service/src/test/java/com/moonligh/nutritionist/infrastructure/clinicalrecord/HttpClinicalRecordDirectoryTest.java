package com.moonligh.nutritionist.infrastructure.clinicalrecord;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.net.InetSocketAddress;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Test;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.moonligh.consult.framework.BusinessException;
import com.moonligh.consult.framework.ErrorCode;
import com.sun.net.httpserver.HttpServer;

class HttpClinicalRecordDirectoryTest {

    private HttpServer server;

    @AfterEach
    void stop() {
        if (server != null) {
            server.stop(0);
        }
    }

    @Test
    void readsPresentDiagnosisAndDoesNotTreatFailureAsHealthy() throws Exception {
        server = HttpServer.create(new InetSocketAddress("127.0.0.1", 0), 0);
        server.createContext("/internal/patients/pat-1/snapshot", exchange -> {
            byte[] body = """
                    {"code":200,"data":{"patientId":"pat-1","snapshotVersion":1,"available":true,"diagnoses":[{"statement":"PRESENT","code":"HYPERTENSION"}],"allergies":[],"medications":[],"observations":[]}}
                    """.getBytes();
            exchange.sendResponseHeaders(200, body.length);
            exchange.getResponseBody().write(body);
            exchange.close();
        });
        server.start();
        HttpClinicalRecordDirectory directory = directory("http://127.0.0.1:" + server.getAddress().getPort());

        assertTrue(directory.hasPresentDiagnosis("pat-1", "HYPERTENSION"));
        assertFalse(directory.hasPresentDiagnosis("pat-1", "DIABETES"));

        server.stop(0);
        server = null;
        BusinessException error = assertThrows(BusinessException.class,
                () -> directory.hasPresentDiagnosis("pat-1", "HYPERTENSION"));
        assertEquals(ErrorCode.CHART_UNAVAILABLE, error.getErrorCode());
    }

    @Test
    void blankAddressStaysDisabled() {
        assertFalse(directory("").enabled());
    }

    private static HttpClinicalRecordDirectory directory(String baseUrl) {
        return new HttpClinicalRecordDirectory(baseUrl, "", new ObjectMapper());
    }
}
