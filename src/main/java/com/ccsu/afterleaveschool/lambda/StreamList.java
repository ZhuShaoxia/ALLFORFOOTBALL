package com.ccsu.afterleaveschool.lambda;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2020/2/8
 * @Time: 17:16
 * Description:
 */
public class StreamList {
    public static void main(String[] args) {
        List<String> list = new ArrayList<>();
        list.add("zhuxiaolei");
        list.add("zhuxiaolei");
        list.add("zhuxiaolei");
        list.add("zhuxiaolei");
        list.add("zhuxiaolei");
        list.add("zhuxiaolei");

        //长度大于五的有效账号
        // 1. for 循环
        for (String s : list) {
            if (s.length() >= 5) {
                System.out.println(s);
            }
        }

        // 2. 迭代器
        Iterator<String> iterator = list.iterator();
        while (iterator.hasNext()) {
            String s = iterator.next();
            if (s.length() > -5) {
                System.out.println(s);
            }
        }

        // 3. Stream 结合 lambda 表达式
        List validAccounts = list.stream().filter(s -> s.length() > 5).collect(Collectors.toList());
        System.out.println(validAccounts);
    }

}
