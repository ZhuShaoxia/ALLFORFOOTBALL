package com.ccsu.afterleaveschool.annotaions;

import java.lang.annotation.Annotation;
import java.lang.reflect.Method;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2020/2/10
 * @Time: 17:23
 * Description: 注解及反射的使用
 */
public class AnnotationTest {

    @Check(desc = "加法")
    public double add(double a, double b) {
        return a + b;
    }

    @Check(desc = "减法")
    public double substract(double a, double b) {
        return a - b;
    }

    @Check(desc = "除法")
    public double divide(double a, double b) {
        return a / b;
    }

    @Check(desc = "乘法")
    public double multiply(double a, double b) {
        return a * b;
    }

    public static void main(String[] args) {

        Method[] methods = AnnotationTest.class.getMethods();
        Annotation[] annotations;
        for (Method method : methods) {
            annotations = method.getAnnotations();
            for (Annotation annotation : annotations) {
                Class<? extends Annotation> aClass = annotation.annotationType();
                if (aClass == Check.class) {
                    System.out.println(method.getName() + " Check desc = " + ((Check) annotation).desc());
                }
            }
        }


    }
}
