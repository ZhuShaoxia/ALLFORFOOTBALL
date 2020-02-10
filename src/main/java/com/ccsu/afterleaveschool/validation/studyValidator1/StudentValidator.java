package com.ccsu.afterleaveschool.validation.studyValidator1;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/7/8
 * @Time: 16:58
 * Description:
 * SpringMVC中实现验证的方式一：Spring自带的验证框架
 * 验证器实现类
 */
public class StudentValidator implements Validator {
    @Override
    public boolean supports(Class<?> clazz) {
        return Student.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        Student student = (Student) target;
        ValidationUtils.rejectIfEmpty(errors, "name", "student.name");
        Integer number = student.getNumber();
        if (number != null && number < 0) {
            errors.rejectValue("number","number.negative");
        }
    }
}
