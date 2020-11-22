package tlcb.function;

import java.util.Arrays;
import java.util.Comparator;

/**
 * @author XiaoLei Zhu
 * @Description: lambda 基础
 *  lambda : 可以用来替代 单方法 接口
 *  -> {} ： 表示方法体
 *
 * @date 2020/6/8 11:08 下午
 */
public class LambdaTest {
    public static void main(String[] args) {
        //1. Runnable run
        Thread t = new Thread(() -> {});
        //2. Comparator
        Arrays.sort(new String[]{}, new Comparator<String>() {
            @Override
            public int compare(String o1, String o2) {
                return 0;
            }
        });
        //3. 自定义
        LambdaTest lambdaTest = new LambdaTest();
        lambdaTest.callHim("", (arg, o) -> null);
    }

    public void callHim(String A, Callable callable){

    }
}
