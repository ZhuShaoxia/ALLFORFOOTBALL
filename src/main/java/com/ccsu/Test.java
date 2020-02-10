package com.ccsu;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/12/20
 * @Time: 23:35
 * Description:
 */
public class Test {
    public static void main(String[] args) {
        //String date = "2018/12/12";
        //System.out.println(date.substring(4));
        //String str = "1";
        //Integer num = 1;
        //System.out.println(Objects.equals(null, str));
        //System.out.println(Objects.toString(null));
        //System.out.println(str.compareTo(null));

        //new Thread(() -> System.out.println(123));
        //List<String> list = new ArrayList<>();
        //list.add("zhuxiaolei");
        //list.add("zhuxiaobin");
        //list.add("zhuxiaodong");
        //list.add("zhuxiaoling");
        //list.add("zhuxiaohong");
        //list.add("zhuxiaogang");
        //list.forEach(s -> {
        //    String a = s;
        //    System.out.println(a);
        //});

        List<Integer> list = new ArrayList<>();
        list.add(3);
        list.add(1);
        list.add(5);
        list.add(3);
        list.add(2);
        list.add(9);
        list.add(7);
        list.add(8);
        list.add(4);
        Collections.sort(list, Comparator.comparingInt(o -> o));
        list.forEach(System.out::println);
    }
}
