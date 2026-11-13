package com.moonligh.nutritionist.service;

import org.springframework.stereotype.Component;

import com.moonligh.nutritionist.api.req.CreateRecommendationReq;
import com.moonligh.nutritionist.domain.profile.ProfileRepository;

@Component
public class CurrentVersionSnapshotProvider implements RecommendationWorkflow.VersionSnapshotProvider {

    private final ProfileRepository profiles;
    private final PantryService pantry;

    public CurrentVersionSnapshotProvider(ProfileRepository profiles, PantryService pantry) {
        this.profiles = profiles;
        this.pantry = pantry;
    }

    @Override
    public RecommendationWorkflow.VersionSnapshot current(String accountId, CreateRecommendationReq request) {
        String profileVersion = profiles.findByPatientId(request.patientId())
                .map(profile -> Long.toString(profile.version()))
                .orElse("");
        String pantryVersion = pantry.snapshot(accountId, request.patientId()).pantryVersion();
        return new RecommendationWorkflow.VersionSnapshot(profileVersion, pantryVersion);
    }
}
