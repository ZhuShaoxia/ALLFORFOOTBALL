package com.ccsu.common.utils;

import com.ccsu.core.user.domain.User;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/8/23
 * @Time: 15:26
 * Description:
 */
public class StringUtils {
    /**
     * 是否为空
     *
     * @param str 字符串
     * @return true 空 false 非空
     */
    public static Boolean isEmpty(String str) {
        return str == null || str.equals("");
    }

    /**
     * 是否不为空
     *
     * @param str
     * @return
     */
    public static Boolean isNotEmpty(String str) {
        return !StringUtils.isEmpty(str);
    }

    /**
     * 判断字符串是否为null，空串，或是空格组成的
     *
     * @param str
     * @return
     */
    public static Boolean isBlank(String str) {
        return str == null || "".equals(str) || "".equals(str.trim());
    }

    /**
     * 判断字符串 不是 为null，空串，或是空格组成的
     *
     * @param str
     * @return
     */
    public static Boolean isNotBlank(String str) {
        return !StringUtils.isBlank(str);
    }

    public static String isExist(String str, String defaultValue) {
        User user = new User();
        user.setNickname("zhuxiaolei");
        if (user != null) {
            String userName = user.getNickname();
            if (userName != null) {
                return userName.toUpperCase();
            } else {
                return null;
            }
        } else {
            return null;
        }

        //Optional<User> userOpt = Optional.ofNullable(user);
        //return user.map(User::getUserName)
        //        .map(String::toUpperCase)
        //        .orElse(null);
    }

    //public static void main(String[] args) {
    //    String exist = StringUtils.isExist(null, "456");
    //    System.out.println(exist);
    //
    //
    //}

}
