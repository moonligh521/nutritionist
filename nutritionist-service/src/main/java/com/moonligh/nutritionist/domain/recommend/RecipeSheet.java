package com.moonligh.nutritionist.domain.recommend;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * 产品下载的通用菜谱表。一行是一道菜，不按字数切开。
 * 种类、菜系、标签只写进向量文本，不决定能不能做，也不决定克数。
 */
public final class RecipeSheet {

    public static final List<String> COLUMNS = List.of(
            "菜号", "菜名", "种类", "菜系", "标签", "适合", "不适合", "主料", "辅料", "调味", "做法", "厨具", "示例");

    private RecipeSheet() {
    }

    public static byte[] template() {
        String text = """
                # 一行一道菜。种类可填：汤、主食、菜、小吃、饮品、粥、凉菜，也可以写别的种类。
                # 菜系可填：家常、川菜、粤菜、鲁菜、苏菜、浙菜、闽菜、湘菜、徽菜、西餐，也可以写别的菜系。
                # 标签用分号分开，例如：减肥;减脂;家常;快手 或 控糖;控盐。减肥和慢病标签只用于查找和展示。
                # 这些标签不决定能不能做，也不决定克数。能不能做仍看主料是否齐全。示例填“是”的行不会入库。
                # 主料写法：西红柿:200;鸡蛋:2。菜号可空，同一菜名再次上传会覆盖。
                %s
                ,番茄蛋汤,汤,家常,减肥;家常,控盐,,西红柿:200;鸡蛋:1,粉丝:30,食盐:2,番茄煮开后打入蛋液。,锅,是
                ,白米饭,主食,家常,减肥,控糖,,大米:80,,,米饭蒸熟。,电饭煲,是
                ,番茄炒蛋,菜,家常,减肥;减脂,控糖,,西红柿:200;鸡蛋:2,,菜籽油:8;食盐:1,西红柿切块，鸡蛋打散。,锅,是
                ,鲜肉煎饺,小吃,东北,家常,,,猪肉:100;面粉:80,,食盐:1,饺子煎至底部金黄。,平底锅,是
                ,紫菜蛋花汤,汤,家常,家常,控糖,高嘌呤,紫菜:5;鸡蛋:1,,食盐:1,水开后淋入蛋液。,锅,是
                """.formatted(String.join(",", COLUMNS));
        byte[] body = text.getBytes(StandardCharsets.UTF_8);
        byte[] bom = new byte[] {(byte) 0xEF, (byte) 0xBB, (byte) 0xBF};
        byte[] file = new byte[bom.length + body.length];
        System.arraycopy(bom, 0, file, 0, bom.length);
        System.arraycopy(body, 0, file, bom.length, body.length);
        return file;
    }

    public static List<Row> parse(String csv) {
        if (csv == null || csv.isBlank()) {
            throw new IllegalArgumentException("表是空的");
        }
        if (csv.startsWith("\uFEFF")) {
            csv = csv.substring(1);
        }
        List<String> lines = splitLines(csv);
        Map<String, Integer> header = null;
        List<Row> rows = new ArrayList<>();
        for (String line : lines) {
            String trimmed = line.trim();
            if (trimmed.isEmpty() || trimmed.startsWith("#")) {
                continue;
            }
            List<String> cells = splitCsv(trimmed);
            if (header == null) {
                header = index(cells);
                require(header, "菜名");
                require(header, "种类");
                require(header, "菜系");
                require(header, "标签");
                continue;
            }
            String example = cell(cells, header, "示例");
            if ("是".equals(example)) {
                continue;
            }
            String name = cell(cells, header, "菜名");
            if (name.isBlank()) {
                continue;
            }
            String id = cell(cells, header, "菜号");
            if (id.isBlank()) {
                id = "sheet-" + Integer.toUnsignedString(name.hashCode());
            }
            rows.add(new Row(
                    id,
                    name,
                    cell(cells, header, "种类"),
                    cell(cells, header, "菜系"),
                    cell(cells, header, "标签"),
                    cell(cells, header, "适合"),
                    cell(cells, header, "不适合"),
                    cell(cells, header, "主料"),
                    cell(cells, header, "辅料"),
                    cell(cells, header, "调味"),
                    cell(cells, header, "做法"),
                    cell(cells, header, "厨具")));
        }
        if (header == null) {
            throw new IllegalArgumentException("缺少表头");
        }
        return rows;
    }

    private static void require(Map<String, Integer> header, String name) {
        if (!header.containsKey(name)) {
            throw new IllegalArgumentException("表头缺少" + name);
        }
    }

    private static Map<String, Integer> index(List<String> cells) {
        Map<String, Integer> header = new LinkedHashMap<>();
        for (int index = 0; index < cells.size(); index++) {
            header.put(cells.get(index).trim(), index);
        }
        return header;
    }

    private static String cell(List<String> cells, Map<String, Integer> header, String name) {
        Integer index = header.get(name);
        if (index == null || index >= cells.size()) {
            return "";
        }
        return cells.get(index).trim();
    }

    private static List<String> splitLines(String csv) {
        return List.of(csv.split("\\R", -1));
    }

    static List<String> splitCsv(String line) {
        List<String> cells = new ArrayList<>();
        StringBuilder current = new StringBuilder();
        boolean quoted = false;
        for (int index = 0; index < line.length(); index++) {
            char ch = line.charAt(index);
            if (ch == '"') {
                if (quoted && index + 1 < line.length() && line.charAt(index + 1) == '"') {
                    current.append('"');
                    index++;
                } else {
                    quoted = !quoted;
                }
            } else if (ch == ',' && !quoted) {
                cells.add(current.toString());
                current.setLength(0);
            } else {
                current.append(ch);
            }
        }
        cells.add(current.toString());
        return cells;
    }

    public record Row(
            String id,
            String name,
            String kind,
            String cuisine,
            String tags,
            String suitable,
            String unsuitable,
            String mains,
            String sides,
            String seasoning,
            String step,
            String cookware) {

        /** 一条向量对应整行。种类、菜系、标签和做法都在这一条里。 */
        public String document() {
            return RecipeDocument.text(name, List.of(mains, sides, seasoning), step)
                    + "\n种类：" + kind
                    + "\n菜系：" + cuisine
                    + "\n标签：" + tags.replace(';', ' ').replace('；', ' ');
        }

        public String tagsNormalized() {
            return tags == null ? "" : tags.replace('；', ';');
        }
    }
}
