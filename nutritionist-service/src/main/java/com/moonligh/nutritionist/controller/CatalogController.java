package com.moonligh.nutritionist.controller;

import java.nio.charset.StandardCharsets;
import java.util.List;

import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.moonligh.consult.framework.Result;
import com.moonligh.nutritionist.domain.recommend.RecipeSheet;
import com.moonligh.nutritionist.domain.recommend.RecipeVectorizer;
import com.moonligh.nutritionist.domain.solver.SolverInfeasibleException;
import com.moonligh.nutritionist.service.CatalogBrowse;
import com.moonligh.nutritionist.service.DayMenuService;
import com.moonligh.nutritionist.service.DishRecommendService;
import com.moonligh.nutritionist.service.RecipeVectorUpload;

import jakarta.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/api/nutrition/catalog")
public class CatalogController {

    private final CatalogBrowse catalogBrowse;
    private final DayMenuService dayMenu;
    private final DishRecommendService dishRecommend;
    private final RecipeVectorUpload vectors;

    public CatalogController(
            CatalogBrowse catalogBrowse,
            DayMenuService dayMenu,
            DishRecommendService dishRecommend,
            RecipeVectorUpload vectors) {
        this.catalogBrowse = catalogBrowse;
        this.dayMenu = dayMenu;
        this.dishRecommend = dishRecommend;
        this.vectors = vectors;
    }

    @GetMapping
    public Result<CatalogBrowse.CatalogSnapshot> catalog(HttpServletRequest request) {
        String origin = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
        return Result.ok(catalogBrowse.snapshot(origin));
    }

    /** 下载空表。产品按行填写汤、主食、菜、小吃、菜系和标签。 */
    @GetMapping("/template")
    public ResponseEntity<byte[]> template() {
        ContentDisposition disposition = ContentDisposition.attachment()
                .filename("recipe-template.csv", StandardCharsets.UTF_8)
                .build();
        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, disposition.toString())
                .contentType(MediaType.parseMediaType("text/csv;charset=UTF-8"))
                .body(RecipeSheet.template());
    }

    /** 上传填好的表，并写成向量。不改变已发布菜的主料、克数和规则分。 */
    @PostMapping(value = "/vectors", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public Result<RecipeVectorizer.Report> vectors(@RequestParam("file") MultipartFile file) {
        if (file == null || file.isEmpty()) {
            return Result.fail("先上传填好的菜谱表");
        }
        try {
            String csv = new String(file.getBytes(), StandardCharsets.UTF_8);
            return Result.ok(vectors.importCsv(csv));
        } catch (IllegalArgumentException error) {
            return Result.fail(error.getMessage());
        } catch (Exception error) {
            return Result.fail("这张表没有读成功");
        }
    }

    @GetMapping("/matches")
    public Result<DishRecommendService.MatchReport> matches(
            @RequestParam(required = false) List<String> foods,
            @RequestParam(required = false) String text,
            HttpServletRequest request) {
        String origin = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
        return Result.ok(dishRecommend.match(foods, origin, text));
    }

    @GetMapping("/day")
    public Result<DayMenuService.DayMenu> day(
            @RequestParam int sex,
            @RequestParam int age,
            @RequestParam int activity,
            @RequestParam(defaultValue = "cut") String mode,
            @RequestParam(required = false) List<String> foods) {
        try {
            return Result.ok(dayMenu.plan(sex, age, activity, mode, foods));
        } catch (SolverInfeasibleException error) {
            return Result.fail("按这个额度和食材配不出完整的一天");
        } catch (IllegalArgumentException error) {
            return Result.fail(error.getMessage());
        }
    }

    @GetMapping("/foods/{id}/image")
    public ResponseEntity<Resource> image(@PathVariable String id) {
        if (!id.matches("[0-9]{1,6}")) {
            return ResponseEntity.notFound().build();
        }
        Resource resource = new ClassPathResource("static/food/" + id + ".jpg");
        if (!resource.exists()) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(resource);
    }
}
