package com.ccsu.common.study;

import java.util.Optional;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/8/24
 * @Time: 10:49
 * Description:
 */
public class OptionTest {
    public static void main(String[] args) {
        String userId = null;
        String userName = getUserName(null);
        System.out.println(userName);
        //String userAge = getUserAge(userId);
        //System.out.println(userAge);
    }


    public static String getUserName(String userId){
        return Optional.ofNullable(userId).orElse("zhuxiaolei");
    }
    public static String getUserAge(String userId){
        return Optional.of(userId).get();
    }

}
