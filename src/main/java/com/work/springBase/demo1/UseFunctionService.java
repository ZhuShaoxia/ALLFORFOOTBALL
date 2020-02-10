package com.work.springBase.demo1;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2019/2/16
 * @Time: 15:57
 * Description:
 */
@Service
public class UseFunctionService {
    @Autowired
    private FunctionService functionService;

    public String sayHello(String word) {
        return functionService.sayHello(word);
    }
}
