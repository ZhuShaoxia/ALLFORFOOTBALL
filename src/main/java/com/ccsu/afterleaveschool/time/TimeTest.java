package com.ccsu.afterleaveschool.time;

import java.time.LocalDate;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/7/25
 * @Time: 15:33
 * Description:jdk1.8 时间的计算
 */
public class TimeTest {
    public static void calculateBetweenDay() {
        LocalDate start = LocalDate.of(2018, 7, 25);
        LocalDate end = LocalDate.now();
        long day = end.toEpochDay() - start.toEpochDay();
        System.out.println("相差天数=" + day);
    }

    public static void dayOfYear() {
        LocalDate localDate = LocalDate.ofYearDay(2018, 300);
        System.out.println(localDate.toString());
    }

    public static void main(String[] args) {
//        TimeTest.calculateBetweenDay();
        TimeTest.dayOfYear();
    }
}
