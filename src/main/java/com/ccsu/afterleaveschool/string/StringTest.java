package com.ccsu.afterleaveschool.string;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2020/2/14
 * @Time: 16:14
 * Description:
 */
public class StringTest {

    public static void main(String[] args) {
        int num = 100000;
        //testString(num);
        //System.out.println("-----");
        //testBuilder(num);

        //String str = "zhuxiaolei";
        //System.out.println(str.intern());
        //
        //System.out.println();

    }

    /**
     * end - start = 1248
     * @param num 10000 --> 1248
     * @return
     */
    private static String testString(int num) {
        String str = "";
        long start = System.currentTimeMillis();
        for (int i = 0; i < num; i++) {
            str += "zhuxiaolei";
        }
        long end = System.currentTimeMillis();
        System.out.println("end - start = " + (end - start));
        return str;
    }

    /**
     * end - start = 1
     * @param num 10000 -> 1
     *            100000 -> 15~24
     * @return
     */
    private static String testBuilder(int num) {
        StringBuilder str = new StringBuilder();
        long start = System.currentTimeMillis();
        for (int i = 0; i < num; i++) {
            str.append("zhuxiaolei");
        }
        long end = System.currentTimeMillis();
        System.out.println("end - start = " + (end - start));
        return str.toString();
    }

}
