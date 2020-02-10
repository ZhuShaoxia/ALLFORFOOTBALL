package com.work.springBase.demo2;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2019/2/16
 * @Time: 15:57
 * Description:
 */

public class UseFunctionService {
    private FunctionService functionService;

    public String sayHello(String word) {
        return functionService.sayHello(word);
    }

    public void setFunctionService(FunctionService functionService) {
        this.functionService = functionService;
    }
}
