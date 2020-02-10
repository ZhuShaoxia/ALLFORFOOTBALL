package com.work.springBase.demo1;

import org.springframework.stereotype.Service;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2019/2/16
 * @Time: 15:56
 * Description:
 */
@Service
public class FunctionService {
    public String sayHello(String word) {
        return "hello" + word;
    }
}
