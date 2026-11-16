package com.moonligh.nutritionist.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.moonligh.consult.framework.Result;
import com.moonligh.nutritionist.statute.StatuteLibrary;

/** 法条检索。和食材推荐分开。回答只能引用库里的原文。 */
@RestController
@RequestMapping("/api/nutrition/statutes")
public class StatuteController {

    private final StatuteLibrary statutes;

    public StatuteController(StatuteLibrary statutes) {
        this.statutes = statutes;
    }

    @PostMapping
    public Result<StatuteLibrary.ImportResult> importText(@RequestBody ImportRequest request) {
        if (request == null || request.lawName() == null || request.lawName().isBlank()
                || request.text() == null || request.text().isBlank()) {
            return Result.fail("先给出法律名和正文");
        }
        try {
            return Result.ok(statutes.importText(request.lawName(), request.status(), request.text()));
        } catch (IllegalArgumentException error) {
            return Result.fail(error.getMessage());
        }
    }

    @GetMapping("/article")
    public Result<?> article(@RequestParam String law, @RequestParam String no) {
        var found = statutes.article(law, no);
        if (found == null) {
            return Result.fail("库里没有这条");
        }
        return Result.ok(found);
    }

    @GetMapping("/search")
    public Result<?> search(@RequestParam String q) {
        return Result.ok(statutes.search(q));
    }

    public record ImportRequest(String lawName, String status, String text) {
    }
}
