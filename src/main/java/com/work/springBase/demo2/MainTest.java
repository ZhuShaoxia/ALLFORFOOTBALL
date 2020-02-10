package com.work.springBase.demo2;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2019/2/16
 * @Time: 15:58
 * Description: Java作为配置类，定义对象
 */
public class MainTest {
    public static void main(String[] args) {
        AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(JavaConfig.class);
        UseFunctionService bean = context.getBean(UseFunctionService.class);
        String aaa = bean.sayHello("World");
        System.err.println(aaa);
        context.close();
    }
}
