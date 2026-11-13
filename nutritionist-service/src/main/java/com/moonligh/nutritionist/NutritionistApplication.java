package com.moonligh.nutritionist;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * 营养服务启动入口。
 */
@MapperScan(basePackages = "com.moonligh.nutritionist", annotationClass = org.apache.ibatis.annotations.Mapper.class)
@SpringBootApplication
public class NutritionistApplication {

    public static void main(String[] args) {
        SpringApplication.run(NutritionistApplication.class, args);
    }
}
