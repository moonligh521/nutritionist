package com.moonligh.nutritionist.infrastructure.vector;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assumptions.assumeTrue;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.junit.jupiter.api.Test;

import com.moonligh.consult.framework.vector.MilvusVectorStore;
import com.moonligh.consult.framework.vector.VectorProperties;
import com.moonligh.nutritionist.domain.recommend.RecipeSheet;
import com.moonligh.nutritionist.domain.recommend.RecipeVectorFilter;
import com.moonligh.nutritionist.domain.recommend.RecipeVectorizer;

/**
 * 把 testdata/nutrition_recipe_5k.csv 向量化写入 nutrition_recipe。
 * 默认跳过；全量约 5000 次百炼调用，用 limit 可先小批量验证。
 * <pre>
 * mvn -pl nutritionist-service -Dtest=RecipeVector5kSeedIT -Drecipe.vector.seed=true -Drecipe.vector.seed.limit=50 test
 * </pre>
 */
class RecipeVector5kSeedIT {

    @Test
    void seedFiveThousandRecipesIntoMilvus() throws Exception {
        assumeTrue("true".equalsIgnoreCase(System.getProperty("recipe.vector.seed", "")),
                "跳过 5k 写入；需要 -Drecipe.vector.seed=true");

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
        if (apiKey == null || apiKey.isBlank() || apiKey.contains("replace")) {
            apiKey = capture(yaml, "(?m)^\\s*api-key:\\s*\"?([^\"\\r\\n]+)\"?");
        }
        assumeTrue(apiKey != null && !apiKey.isBlank() && !apiKey.contains("replace"), "未配置向量密钥");

        String host = capture(vectorBlock, "(?m)^\\s*host:\\s*([^\\r\\n]+)");
        String portText = capture(vectorBlock, "(?m)^\\s*port:\\s*(\\d+)");
        VectorProperties props = new VectorProperties();
        props.setEnabled(true);
        props.setHost(host == null || host.isBlank() ? "154.8.236.238" : host.trim());
        props.setPort(portText == null ? 19530 : Integer.parseInt(portText.trim()));
        props.setApiKey(apiKey.trim());

        Path csvPath = Path.of("src/test/resources/testdata/nutrition_recipe_5k.csv");
        if (!Files.isRegularFile(csvPath)) {
            csvPath = Path.of("../nutritionist-service/src/test/resources/testdata/nutrition_recipe_5k.csv");
        }
        assumeTrue(Files.isRegularFile(csvPath), "缺少 nutrition_recipe_5k.csv");
        String csv = Files.readString(csvPath, StandardCharsets.UTF_8);
        List<RecipeSheet.Row> rows = RecipeSheet.parse(csv);
        assumeTrue(rows.size() >= 100, "CSV 行数过少: " + rows.size());

        int limit = Integer.parseInt(System.getProperty("recipe.vector.seed.limit", "0"));
        if (limit > 0 && limit < rows.size()) {
            rows = rows.subList(0, limit);
        }

        MilvusVectorStore store = new MilvusVectorStore(props);
        // 旧集合是 VARCHAR+like，需重建为 ARRAY 才能按病情过滤
        if (!"false".equalsIgnoreCase(System.getProperty("recipe.vector.seed.recreate", "true"))) {
            store.dropCollection(MilvusRecipeIndex.COLLECTION);
            System.out.println("dropped collection " + MilvusRecipeIndex.COLLECTION + " for ARRAY schema");
        }
        MilvusRecipeIndex index = new MilvusRecipeIndex(store);
        int ok = 0;
        int fail = 0;
        Set<String> multiDiseaseIds = new HashSet<>();
        long started = System.currentTimeMillis();
        for (int i = 0; i < rows.size(); i++) {
            RecipeSheet.Row row = rows.get(i);
            float[] vector = null;
            for (int attempt = 0; attempt < 3 && vector == null; attempt++) {
                vector = store.embed(row.document());
                if (vector == null) {
                    Thread.sleep(400L * (attempt + 1));
                }
            }
            if (vector == null || vector.length != 1024) {
                fail++;
                System.out.println("embed-fail " + (i + 1) + "/" + rows.size() + " id=" + row.id());
                continue;
            }
            index.upsert(new RecipeVectorizer.Stored(
                    row.id(),
                    row.name(),
                    "1",
                    row.document(),
                    RecipeVectorizer.toJson(vector),
                    true,
                    row.kind(),
                    row.cuisine(),
                    row.tagsNormalized(),
                    row.suitable(),
                    row.unsuitable()));
            ok++;
            if (row.suitable() != null && row.suitable().contains(";")) {
                multiDiseaseIds.add(row.id());
            }
            if ((i + 1) % 25 == 0 || i + 1 == rows.size()) {
                long elapsed = System.currentTimeMillis() - started;
                System.out.println("seeded " + (i + 1) + "/" + rows.size()
                        + " ok=" + ok + " fail=" + fail
                        + " elapsedMs=" + elapsed);
            }
        }

        assertTrue(ok > 0, "至少应成功写入若干条");
        assertTrue(fail * 10 < Math.max(ok, 1), "失败率过高 fail=" + fail + " ok=" + ok);

        // 一食材多病：控糖+控盐 与 家常/川菜 过滤应有命中
        List<String> ketangKeyan = store.query(
                MilvusRecipeIndex.COLLECTION,
                RecipeVectorFilter.expr("家常", "", List.of(), List.of("控糖", "控盐")),
                20);
        List<String> chuanKetang = store.query(
                MilvusRecipeIndex.COLLECTION,
                RecipeVectorFilter.expr("川菜", "", List.of("减肥"), List.of("控糖")),
                20);
        assertFalse(ketangKeyan.isEmpty(), "家常+控糖+控盐 应有命中（一菜多病）");
        assertFalse(chuanKetang.isEmpty(), "川菜+减肥+控糖 应有命中");
        System.out.println("verify home+控糖+控盐 hits=" + ketangKeyan.size()
                + " sichuan+减肥+控糖 hits=" + chuanKetang.size()
                + " multiDiseaseUpserted=" + multiDiseaseIds.size());
    }

    private static String capture(String text, String pattern) {
        Matcher matcher = Pattern.compile(pattern).matcher(text);
        return matcher.find() ? matcher.group(1).trim() : null;
    }
}
