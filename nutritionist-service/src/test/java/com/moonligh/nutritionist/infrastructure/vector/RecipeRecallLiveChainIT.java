package com.moonligh.nutritionist.infrastructure.vector;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assumptions.assumeTrue;

import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.junit.jupiter.api.Test;

import com.moonligh.consult.framework.vector.MilvusVectorStore;
import com.moonligh.consult.framework.vector.VectorProperties;
import com.moonligh.nutritionist.domain.recommend.RecipeVectorFilter;
import com.moonligh.nutritionist.domain.recommend.RecallContext;

/**
 * 真库只读验收：不 drop、不重写。假设 nutrition_recipe 已有写入数据。
 * <pre>
 * mvn -Dtest=RecipeRecallLiveChainIT -Drecipe.vector.smoke=true test
 * </pre>
 */
class RecipeRecallLiveChainIT {

    @Test
    void realChainFilterAndAnnAgainstExistingCollection() throws Exception {
        assumeTrue("true".equalsIgnoreCase(System.getProperty("recipe.vector.smoke", "")),
                "跳过；需要 -Drecipe.vector.smoke=true");

        VectorProperties props = loadProps();
        MilvusVectorStore store = new MilvusVectorStore(props);

        // 1) 菜系标量
        List<String> sichuan = store.query(
                MilvusRecipeIndex.COLLECTION, "cuisine == \"川菜\"", 20);
        System.out.println("live cuisine=川菜 hits=" + sichuan.size() + " sample=" + preview(sichuan));
        assertFalse(sichuan.isEmpty(), "已有数据下「川菜」标量过滤应有命中");

        // 2) 病情 suitable（家常+控糖）
        String clinical = RecipeVectorFilter.expr("家常", "", List.of(), List.of("控糖"));
        List<String> clinicalHits = store.query(MilvusRecipeIndex.COLLECTION, clinical, 20);
        System.out.println("live filter=" + clinical + " hits=" + clinicalHits.size());
        // 有数据时通常有命中；若库里没有家常+控糖组合则至少表达式可执行不抛错
        assertTrue(clinicalHits != null);

        // 3) 结构化 RecallContext → filter（模拟记忆注入菜系）
        RecallContext memoryCuisine = new RecallContext("川菜", "", List.of("减肥"), List.of("控糖"), "");
        assertTrue(memoryCuisine.hasFilter());
        List<String> ctxHits = store.query(
                MilvusRecipeIndex.COLLECTION, memoryCuisine.filterExpr(), 20);
        System.out.println("live RecallContext filter hits=" + ctxHits.size()
                + " expr=" + memoryCuisine.filterExpr());

        // 4) 模糊词 ANN + 过滤（清淡）
        float[] soft = store.embed("清淡一点");
        assumeTrue(soft != null && soft.length == 1024, "百炼 embed 失败");
        List<String> ann = store.search(
                MilvusRecipeIndex.COLLECTION, soft, "cuisine == \"川菜\"", 10);
        System.out.println("live ANN+川菜 hits=" + ann.size() + " sample=" + preview(ann));
        assertFalse(ann.isEmpty(), "带川菜过滤的清淡向量检索应有结果");

        // 5) 有过滤且无命中 → 空列表（fail-closed，不退全库）
        List<String> nonsense = store.query(
                MilvusRecipeIndex.COLLECTION,
                "cuisine == \"不存在的菜系XYZ\"",
                10);
        assertTrue(nonsense.isEmpty(), "无命中点名过滤必须空结果");
    }

    private static VectorProperties loadProps() throws Exception {
        Path local = Path.of("config/application-local.yml");
        if (!Files.isRegularFile(local)) {
            local = Path.of("../config/application-local.yml");
        }
        assumeTrue(Files.isRegularFile(local), "缺少本地 application-local.yml");
        String yaml = Files.readString(local);
        int vectorAt = yaml.indexOf("vector:");
        assumeTrue(vectorAt >= 0, "local yml 无 consult.vector");
        String vectorBlock = yaml.substring(vectorAt);
        String apiKey = capture(vectorBlock, "(?m)^\\s*api-key:\\s*\"?([^\"\\r\\n]+)\"?");
        assumeTrue(apiKey != null && !apiKey.isBlank() && !apiKey.contains("replace"), "未配置向量密钥");
        String host = capture(vectorBlock, "(?m)^\\s*host:\\s*([^\\r\\n]+)");
        String portText = capture(vectorBlock, "(?m)^\\s*port:\\s*(\\d+)");
        VectorProperties props = new VectorProperties();
        props.setEnabled(true);
        props.setHost(host == null || host.isBlank() ? "154.8.236.238" : host.trim());
        props.setPort(portText == null ? 19530 : Integer.parseInt(portText.trim()));
        props.setApiKey(apiKey.trim());
        return props;
    }

    private static String preview(List<String> ids) {
        if (ids == null || ids.isEmpty()) {
            return "[]";
        }
        int n = Math.min(5, ids.size());
        return ids.subList(0, n).toString();
    }

    private static String capture(String text, String pattern) {
        Matcher matcher = Pattern.compile(pattern).matcher(text);
        return matcher.find() ? matcher.group(1).trim() : null;
    }
}
