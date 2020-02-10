package com.ccsu.afterleaveschool.webservice.mobileService;

import java.time.Duration;
import java.time.Instant;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/7/18
 * @Time: 15:55
 * Description: 调用第三方service
 */
public class TestWebService {
    public static void main(String[] args) {
        Instant startTime = Instant.now();
        //创建一个MobileCodeWS工厂
        MobileCodeWS factory = new MobileCodeWS();
        //根据工厂创建一个MobileCodeWSSoap对象
        MobileCodeWSSoap mobileCodeWSSoap = factory.getMobileCodeWSSoap();
        ////调用WebService提供的getMobileCodeInfo方法查询手机号码的归属地
        String searchResult = mobileCodeWSSoap.getMobileCodeInfo("13903583936", null);
        Instant entTime = Instant.now();
        System.out.println(searchResult);
        System.out.println(Duration.between(startTime,entTime));
    }
}
