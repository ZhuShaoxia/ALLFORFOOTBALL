package com.ccsu.afterleaveschool.webservice.myWebservice;

import com.ccsu.afterleaveschool.validation.studyValidator1.Student;

import javax.jws.WebMethod;
import javax.jws.WebService;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/7/18
 * @Time: 16:12
 * Description:模拟实现一个webservice
 */
@WebService
public interface MyWebService {
    @WebMethod
    String sayHello();
    @WebMethod
    Student getInfo();
}
