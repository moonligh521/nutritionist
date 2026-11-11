package com.moonligh.nutritionist.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.moonligh.consult.framework.Result;
import com.moonligh.nutritionist.service.PantryRecognitionService;

@RestController
@RequestMapping("/api/nutrition/pantry")
public class PantryRecognitionController {

    private final PantryRecognitionService recognition;

    public PantryRecognitionController(PantryRecognitionService recognition) {
        this.recognition = recognition;
    }

    @PostMapping("/recognize-text")
    public Result<PantryRecognitionService.RecognitionDraft> recognizeText(@RequestBody RecognizeTextReq request) {
        return Result.ok(recognition.recognizeText(request.patientId(), request.text()));
    }

    @PostMapping("/recognize-image")
    public Result<PantryRecognitionService.RecognitionDraft> recognizeImage(@RequestBody RecognizeImageReq request) {
        return Result.ok(recognition.recognizeImage(request.patientId(), request.imageReference()));
    }

    public record RecognizeTextReq(String patientId, String text) {
    }

    public record RecognizeImageReq(String patientId, String imageReference) {
    }
}
