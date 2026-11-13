package com.moonligh.nutritionist.service;

import java.time.Instant;

import org.springframework.stereotype.Service;

import com.moonligh.consult.framework.BusinessException;
import com.moonligh.consult.framework.ErrorCode;
import com.moonligh.nutritionist.api.req.ConfirmPantryReq;
import com.moonligh.nutritionist.api.req.ConfirmedPantryItemReq;
import com.moonligh.nutritionist.api.req.CreatePantryItemReq;
import com.moonligh.nutritionist.api.res.PantrySnapshotRes;

@Service
public class PantryConfirmationService {

    private final PantryRecognitionService recognition;
    private final PantryService pantry;

    public PantryConfirmationService(PantryRecognitionService recognition, PantryService pantry) {
        this.recognition = recognition;
        this.pantry = pantry;
    }

    public PantrySnapshotRes confirm(String accountId, ConfirmPantryReq request) {
        if (request == null || request.items().isEmpty() || request.draftId() == null) {
            throw new BusinessException(ErrorCode.PARAM_INVALID);
        }
        try {
            recognition.requireDraft(request.draftId(), request.patientId());
        } catch (IllegalArgumentException error) {
            throw new BusinessException(ErrorCode.PARAM_INVALID);
        }
        for (ConfirmedPantryItemReq item : request.items()) {
            if (item.foodItemId() == null || item.quantity() == null || item.unitCode() == null || item.stateCode() == null) {
                throw new BusinessException(ErrorCode.PARAM_INVALID);
            }
            pantry.create(accountId, new CreatePantryItemReq(
                    request.patientId(),
                    request.patientVersion(),
                    item.foodItemId(),
                    item.quantity(),
                    item.unitCode(),
                    item.stateCode(),
                    Instant.now().plusSeconds(86_400),
                    item.displayName()));
        }
        recognition.consume(request.draftId());
        return pantry.snapshot(accountId, request.patientId());
    }
}