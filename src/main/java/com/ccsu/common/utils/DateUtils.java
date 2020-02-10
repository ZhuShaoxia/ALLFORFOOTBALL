package com.ccsu.common.utils;

import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Objects;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/8/23
 * @Time: 17:26
 * Description:
 */
public class DateUtils {

    private static final DateTimeFormatter DEFAULT_DATETIME_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    private static final DateTimeFormatter DEFAULT_DATE_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    private static final DateTimeFormatter DEFAULT_TIME_FORMATTER = DateTimeFormatter.ofPattern("HH:mm:ss");

    /**
     * 获取当前系统日期时间
     *
     * @return
     */
    public static String getCurrentDateTime() {
        return LocalDateTime.now().format(DEFAULT_DATETIME_FORMATTER);
    }

    /**
     * 获取当前系统日期
     *
     * @return
     */
    public static String getCurrentDate() {
        return LocalDateTime.now().format(DEFAULT_DATE_FORMATTER);
    }

    /**
     * 获取当前系统时间
     *
     * @return
     */
    public static String getCurrentTime() {
        return LocalDateTime.now().format(DEFAULT_TIME_FORMATTER);
    }

    /**
     * 计算两个日期相差天数
     *
     * @param start
     * @param end
     * @return
     */
    public static Long calculateBetweenDays(LocalDate start, LocalDate end) {
        start = Objects.requireNonNull(start, "LocalDate start is null");
        end = Objects.requireNonNull(end, "LocalDate end is null");
        return end.toEpochDay() - start.toEpochDay();
    }

    /**
     * 将java.util.Date 转化为 java.time.LocalDate
     *
     * @param date
     * @return
     */
    public static LocalDate covertDateToLocalDate(Date date) {
        date = Objects.requireNonNull(date,"The input date is null");
        Instant instant = date.toInstant();
        ZoneId zone = ZoneId.systemDefault();
        LocalDateTime localDateTime = LocalDateTime.ofInstant(instant, zone);
        LocalDate localDate = localDateTime.toLocalDate();
        return localDate;
    }

    public static void main(String[] args) {
        Instant instant = Instant.now();
        System.out.println(instant);
        System.out.println(getCurrentDateTime());
    }
}
