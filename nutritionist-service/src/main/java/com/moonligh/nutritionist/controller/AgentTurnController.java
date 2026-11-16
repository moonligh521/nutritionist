package com.moonligh.nutritionist.controller;

import java.util.List;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.moonligh.consult.framework.Result;
import com.moonligh.nutritionist.service.AgentTurnService;
import com.moonligh.nutritionist.service.IngredientAgent;

/** 小程序一次提交食材，服务按工具循环返回三道菜和可选的一天克数。 */
@RestController
@RequestMapping("/api/nutrition/agent")
public class AgentTurnController {

    private final AgentTurnService turns;

    public AgentTurnController(AgentTurnService turns) {
        this.turns = turns;
    }

    @PostMapping("/turns")
    public Result<IngredientAgent.Turn> turn(@RequestBody TurnRequest request) {
        if (request == null || request.foods() == null || request.foods().isEmpty()) {
            return Result.fail("先给出至少一种食材");
        }
        return Result.ok(turns.turn(request.foods(), request.profile(), request.text()));
    }

    public record TurnRequest(List<String> foods, IngredientAgent.Profile profile, String text) {
    }
}
