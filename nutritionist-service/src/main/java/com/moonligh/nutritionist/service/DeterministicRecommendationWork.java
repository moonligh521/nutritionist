package com.moonligh.nutritionist.service;

import org.springframework.stereotype.Component;

import com.moonligh.nutritionist.api.req.CreateRecommendationReq;

@Component
public class DeterministicRecommendationWork implements RecommendationWorkflow.RecommendationWork {

    @Override
    public void perform(CreateRecommendationReq request) {
        // P2 主链路保持确定性；候选、求解和复算由领域端口组合，不调用模型。
    }
}
