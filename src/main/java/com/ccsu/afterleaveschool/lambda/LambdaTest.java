package com.ccsu.afterleaveschool.lambda;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2020/2/7
 * @Time: 21:46
 * Description:
 */
public class LambdaTest {
    public static void main(String[] args) {
        //## 1

        //new Thread(new Runnable() {
        //    @Override
        //    public void run() {
        //        System.out.println("current thread num is " + Thread.currentThread().getId());
        //    }
        //}).start();
        //
        //new Thread(() -> System.out.println("current thread num is " + Thread.currentThread().getId())).start();

        IUserCredential iUserCredential = new IUserCredential() {
            @Override
            public String verifyUser(String userName) {
                return "admin".equals(userName) ? "管理员" : "会员";
            }
        };
        //lambda 表达式 针对函数式接口的简单实现
        iUserCredential = (String userName) -> {
            return "admin".equals(userName) ? "管理员" : "会员";
        };

        iUserCredential = userName -> "admin".equals(userName) ? "管理员" : "会员";
    }

    //public void lambda() {
    //
    //
    //}
}
