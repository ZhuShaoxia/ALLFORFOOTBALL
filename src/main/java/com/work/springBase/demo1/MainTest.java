package com.work.springBase.demo1;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2019/2/16
 * @Time: 15:58
 * Description: 通过使用注解定义 Java配置类来扫描注解 进行对象注入
 */
public class MainTest {
    public static void main(String[] args) {
        AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(DiConfig.class);
        UseFunctionService bean = context.getBean(UseFunctionService.class);
        String aaa = bean.sayHello("World");
        System.err.println(aaa);
        context.close();
    }
}
