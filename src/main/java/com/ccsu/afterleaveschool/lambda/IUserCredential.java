package com.ccsu.afterleaveschool.lambda;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2020/2/7
 * @Time: 21:58
 * Description:
 */
@FunctionalInterface
public interface IUserCredential {

    String verifyUser(String userName);

    /**
     * 默认方法
     *
     * @param userName
     * @return
     */
    default String getCredential(String userName) {
        if ("admin".equals(userName)) {
            return "";
        } else if ("manager".equals(userName)) {
            return "";
        } else {
            return "";
        }
    }
}
