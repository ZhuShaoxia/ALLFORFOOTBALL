package com.ccsu.afterleaveschool.webservice.myWebservice;

import javax.xml.ws.Endpoint;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/7/18
 * @Time: 16:16
 * Description:
 */
public class TestMyWebService {
    public static void main(String[] args) {
        Endpoint.publish("http://127.0.0.1:8080/WS_Server/WebService", new MyWebServiceImpl());
        System.out.println("发布service方法成功");
    }
}
