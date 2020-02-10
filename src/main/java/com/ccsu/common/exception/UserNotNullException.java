package com.ccsu.common.exception;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/7/9
 * @Time: 23:03
 * Description:自定义异常类
 */
public class UserNotNullException extends RuntimeException {
    public UserNotNullException() {
        super();
    }

    public UserNotNullException(String message) {
        super(message);
    }
}
