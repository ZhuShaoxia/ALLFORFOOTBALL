package com.ccsu.afterleaveschool.webservice.myWebservice;

import com.ccsu.afterleaveschool.validation.studyValidator1.Student;

import javax.jws.WebService;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/7/18
 * @Time: 16:14
 * Description:
 */
@WebService
public class MyWebServiceImpl implements MyWebService {
    @Override
    public String sayHello() {
        return "Say Hello";
    }

    @Override
    public Student getInfo() {
        Student student = new Student();
        student.setName("iamzhuxiaolei");
        student.setNumber(201807);
        student.setAddress("浙江省杭州市");
        return student;
    }
}
