package com.ccsu.common.utils;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/8/23
 * @Time: 16:52
 * Description:
 */
public class ListUtils {
    /**
     * 判断集合是否为null，或者是空集合
     *
     * @param list
     * @return
     */
    public static boolean isEmpty(List list) {
        return list == null || list.isEmpty();
    }

    public static boolean isNotEmpty(List list) {
        return !ListUtils.isEmpty(list);
    }

    /**
     * 可变参转为list
     *
     * @param items
     * @param <T>
     * @return
     */
    public static <T> List<T> toList(T... items) {

        if (items == null) {
            return null;
        }

        List<T> list = new ArrayList<T>();

        for (T item : items) {
            list.add(item);
        }

        return list;
    }


    public static void main(String[] args) {
        String str = "" ;
        str.toLowerCase();
    }
}
