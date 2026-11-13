package com.moonligh.nutritionist.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.moonligh.consult.framework.Result;
import com.moonligh.nutritionist.api.req.FoodQuestionReq;
import com.moonligh.nutritionist.api.res.FoodQuestionRes;
import com.moonligh.nutritionist.service.FoodQuestionService;

@RestController
@RequestMapping("/api/nutrition/questions")
public class FoodQuestionController {

    private final FoodQuestionService questions;

    public FoodQuestionController(FoodQuestionService questions) {
        this.questions = questions;
    }

    @PostMapping("/food")
    public Result<FoodQuestionRes> food(@RequestBody FoodQuestionReq request) {
        return Result.ok(questions.answer(request));
    }
}