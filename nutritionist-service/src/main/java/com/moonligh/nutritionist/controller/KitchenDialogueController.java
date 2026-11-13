package com.moonligh.nutritionist.controller;

import java.time.LocalDate;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.moonligh.consult.framework.Result;
import com.moonligh.nutritionist.service.KitchenDialogueService;

@RestController
@RequestMapping("/api/nutrition/dialogue")
public class KitchenDialogueController {

    private final KitchenDialogueService dialogue;

    public KitchenDialogueController(KitchenDialogueService dialogue) {
        this.dialogue = dialogue;
    }

    @PostMapping
    public Result<KitchenDialogueService.Reply> handle(@RequestBody DialogueReq request) {
        return Result.ok(dialogue.handle(request.patientId(), request.text(), request.date()));
    }

    public record DialogueReq(String patientId, String text, LocalDate date) {
    }
}
