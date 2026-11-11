package com.moonligh.nutritionist.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.moonligh.consult.framework.Result;
import com.moonligh.nutritionist.api.req.CreateProfessionalTargetReq;
import com.moonligh.nutritionist.api.res.ProfessionalTargetRes;
import com.moonligh.nutritionist.service.ProfessionalTargetService;

@RestController
@RequestMapping("/api/nutrition/professional-targets")
public class ProfessionalTargetController {

    private final ProfessionalTargetService targets;

    public ProfessionalTargetController(ProfessionalTargetService targets) {
        this.targets = targets;
    }

    @PostMapping
    public Result<ProfessionalTargetRes> create(
            @RequestHeader("X-Account-Role") String role,
            @RequestBody CreateProfessionalTargetReq request) {
        return Result.ok(targets.create(role, request));
    }
}
