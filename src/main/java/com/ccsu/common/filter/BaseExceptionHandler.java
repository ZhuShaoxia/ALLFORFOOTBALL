package com.ccsu.common.filter;

import com.ccsu.common.exception.UserNotNullException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/7/9
 * @Time: 23:01
 * Description:全局异常处理器类
 */

/**
 * @ControllerAdvice 定义异常处理器类
 */
@ControllerAdvice
public class BaseExceptionHandler {

    /**
     * @ExceptionHandler定义异常处理方法
     * @return
     */
    @ExceptionHandler(UserNotNullException.class)
    public String exceptionHandler1() {

        return "";
    }

}
