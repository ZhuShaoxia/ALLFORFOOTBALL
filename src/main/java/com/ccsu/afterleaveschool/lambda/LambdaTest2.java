package com.ccsu.afterleaveschool.lambda;

import java.util.UUID;
import java.util.function.Function;
import java.util.function.Supplier;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2020/2/7
 * @Time: 22:30
 * Description:
 */
public class LambdaTest2 {
    public static void main(String[] args) {


        Function<String, Integer> fun = (String gender) -> gender.equals("male") ? 1 : 0;
        System.out.println(fun.apply("male"));
        System.out.println(fun.apply("female"));


        Supplier<String> sup = () -> UUID.randomUUID().toString();
        System.out.println(sup.get());

        //UnaryOperator uo = (String ) ->


        IUserCredential userCredential = (userName) -> userName.equals("admin") ? "管理员" : "会员";
        String result = userCredential.verifyUser("admin");
        System.out.println(result);


    }
}
