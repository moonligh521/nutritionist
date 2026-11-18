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
import com.moonligh.consult.framework.vector.VectorDocument;
import com.moonligh.consult.framework.vector.VectorProperties;
import com.moonligh.nutritionist.domain.recommend.RecipeVectorFilter;

/** 真库冒烟。密钥只从本地 application-local.yml 读取，不打印。 */
class RecipeVectorLiveSmokeIT {

    @Test
    void upsertAndFilterQueryOnRealMilvus() throws Exception {
        assumeTrue("true".equalsIgnoreCase(System.getProperty("recipe.vector.smoke", "")),
                "跳过真库冒烟；需要 -Drecipe.vector.smoke=true");
        Path local = Path.of("config/application-local.yml");
        if (!Files.isRegularFile(local)) {
            local = Path.of("../config/application-local.yml");
        }
        assumeTrue(Files.isRegularFile(local), "缺少本地 application-local.yml");
        String yaml = Files.readString(local);
        String apiKey = capture(yaml, "(?m)^\\s*api-key:\\s*\"?([^\"\\r\\n]+)\"?");
        // prefer consult.vector block: take last api-key after "vector:"
        int vectorAt = yaml.indexOf("vector:");
        assumeTrue(vectorAt >= 0, "local yml 无 consult.vector");
        String vectorBlock = yaml.substring(vectorAt);
        String vectorKey = capture(vectorBlock, "(?m)^\\s*api-key:\\s*\"?([^\"\\r\\n]+)\"?");
        if (vectorKey != null && !vectorKey.isBlank() && !vectorKey.contains("replace")) {
            apiKey = vectorKey;
        }
        assumeTrue(apiKey != null && !apiKey.isBlank() && !apiKey.contains("replace"), "未配置向量密钥");

        String host = capture(vectorBlock, "(?m)^\\s*host:\\s*([^\\r\\n]+)");
        String portText = capture(vectorBlock, "(?m)^\\s*port:\\s*(\\d+)");
        VectorProperties props = new VectorProperties();
        props.setEnabled(true);
        props.setHost(host == null || host.isBlank() ? "154.8.236.238" : host.trim());
        props.setPort(portText == null ? 19530 : Integer.parseInt(portText.trim()));
        props.setApiKey(apiKey.trim());

        MilvusVectorStore store = new MilvusVectorStore(props);
        store.dropCollection(MilvusRecipeIndex.COLLECTION);
        float[] vector = store.embed("番茄炒蛋 清淡 家常");
        assumeTrue(vector != null && vector.length == 1024, "百炼 embed 失败");

        String id = "900001";
        var fields = NamedField.of(
                new NamedField("name", "番茄炒蛋"),
                new NamedField("version", "1"),
                new NamedField("kind", "菜"),
                new NamedField("cuisine", "川菜"));
        var listFields = List.of(
                new NamedField.NamedStringList("prefer_tags", RecipeVectorFilter.tags("减肥")),
                new NamedField.NamedStringList("suitable", RecipeVectorFilter.tags("控糖;控盐")),
                new NamedField.NamedStringList("unsuitable", List.of()));
        var descriptions = List.of(
                new NamedField.FieldDescription("id", "菜谱主键，对应 MySQL recipe.id 的数字字符串"),
                new NamedField.FieldDescription("name", "菜名，对应 recipe.display_name"));
        store.save(new VectorDocument(
                MilvusRecipeIndex.COLLECTION,
                id,
                NamedField.toMap(fields),
                "番茄炒蛋清淡",
                vector,
                MilvusRecipeIndex.COLLECTION_DESCRIPTION,
                NamedField.descriptionsToMap(descriptions),
                NamedField.NamedStringList.toMap(listFields)));

        List<String> byFilter = store.query(
                MilvusRecipeIndex.COLLECTION, "cuisine == \"川菜\"", 10);
        assertTrue(byFilter.contains(id), "标量过滤应命中冒烟川菜");

        List<String> byName = store.query(
                MilvusRecipeIndex.COLLECTION, "name == \"番茄炒蛋\"", 10);
        assertTrue(byName.contains(id), "菜名标量应可过滤");

        List<String> multiDisease = store.query(
                MilvusRecipeIndex.COLLECTION,
                RecipeVectorFilter.expr("川菜", "", List.of("减肥"), List.of("控糖", "控盐")),
                10);
        assertTrue(multiDisease.contains(id), "array_contains 应命中一菜多病");

        List<String> byVector = store.search(
                MilvusRecipeIndex.COLLECTION, vector, "cuisine == \"川菜\"", 10);
        assertFalse(byVector.isEmpty(), "带过滤的向量检索应有结果");
        assertTrue(byVector.contains(id) || byVector.size() > 0);
    }

    private static String capture(String text, String pattern) {
        Matcher matcher = Pattern.compile(pattern).matcher(text);
        return matcher.find() ? matcher.group(1).trim() : null;
    }
}
