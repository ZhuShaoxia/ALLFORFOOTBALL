package com.ccsu.common.utils;

import org.apache.commons.validator.routines.DateValidator;

import java.util.Date;
import java.util.Objects;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/8/23
 * @Time: 20:56
 * Description:
 */
public class test {
    public static void main(String[] args) {
        //StringUtils 验证字符串是否为空
        StringUtils.isEmpty("");

        //commons-validator
        DateValidator instance = DateValidator.getInstance();
        Date validate = instance.validate("2018-07-22", "yyyy-MM-dd");
        if (!Objects.isNull(validate)){
            //若时间有效 则date不为空
            System.out.println(validate.getTime());
        }
    }
}
