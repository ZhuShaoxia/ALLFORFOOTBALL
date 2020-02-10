package com.ccsu.afterleaveschool.enums;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2020/2/9
 * @Time: 15:21
 * Description:
 */
public enum DayEnum {
    MONDAY("星期一"),
    TUESDAY("星期二"),
    WEDNESDAY("星期三"),
    THURSDAY("星期四"),
    FRIDAY("星期五"),
    SATURDAY("星期六"),
    SUNDAY("星期日");

    private String desc;

    private final static Map<String, DayEnum> cache = new HashMap<>();

    static {
        for (DayEnum dayEnum : DayEnum.values()) {
            cache.put(dayEnum.getDesc(), dayEnum);
        }
    }

    public static DayEnum getEnum(String desc) {
        return cache.get(desc);
    }

    DayEnum(String desc) {
        this.desc = desc;
    }

    public String getDesc() {
        return desc;
    }


}

