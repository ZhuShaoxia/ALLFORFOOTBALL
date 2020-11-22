package com.ccsu;

import java.util.Arrays;
import java.util.List;
import java.util.StringJoiner;
import java.util.stream.Collectors;

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

        //List<Integer> list = new ArrayList<>();
        //list.add(3);
        //list.add(1);
        //list.add(5);
        //list.add(3);
        //list.add(2);
        //list.add(9);
        //list.add(7);
        //list.add(8);
        //list.add(4);
        //Collections.sort(list, Comparator.comparingInt(o -> o));
        //list.forEach(System.out::println);

        //String[] strs = {"3", "4", "5", "1", "6", "9", "10"};
        Integer[] strs = {3, 4, 5, 1, 6, 9, 10};
        //String join = String.join("','", strs);
        StringJoiner joiner = new StringJoiner("','", "'", "'");
        //for (String s : strs) {
        //    joiner.add(s);
        //}
        System.out.println(joiner);

        List<Integer> collect = Arrays.stream(strs)
                //.filter((c) -> Integer.parseInt(c) > 4)
                //.limit(2).collect(Collectors.toList())
                //.sorted((s1, s2) -> s2 - s1)  //从大到小
                .sorted() // 从小到大
                .collect(Collectors.toList());
        Arrays.sort(strs);

        System.out.println(collect);
    }
}
