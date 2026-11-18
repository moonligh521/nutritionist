package com.moonligh.nutritionist.statute;

/** 法规简称 → 正式名称。 */
public record LawAlias(String shortName, String officialName) {

    public LawAlias {
        shortName = shortName == null ? "" : shortName.trim();
        officialName = officialName == null ? "" : officialName.trim();
    }
}
