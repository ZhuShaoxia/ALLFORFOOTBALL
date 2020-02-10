package com.ccsu.afterleaveschool.bigDecimal;

import java.util.Arrays;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2020/2/9
 * @Time: 11:22
 * Description:
 */
public class BigDecimalTest {

    public static void main(String[] args) {
        //BigDecimal bigDecimal = new BigDecimal("1.12323");
        //BigDecimal add = bigDecimal.add(new BigDecimal("2.3333333"));
        //System.out.println(add.doubleValue());

        //BigDecimal bigDecimal = BigDecimal.valueOf(3.444);
        //BigDecimal remainder = bigDecimal.remainder(new BigDecimal("3.1"));
        ////1. 余数
        //System.out.println("remainder = " + remainder);
        //
        ////2. 相反数
        //BigDecimal negate = bigDecimal.negate();
        //System.out.println("negate = " + negate);
        //
        ////3. 比较
        //BigDecimal big1 = new BigDecimal("2.00");
        //BigDecimal big2 = BigDecimal.valueOf(2.01);
        //int i = big1.compareTo(big2);
        //String str;
        //if (i > 0) {
        //    str = "大于";
        //} else if (i == 0) {
        //    str = "等于";
        //} else {
        //    str = "小于";
        //}
        //
        //System.out.println("big1 比 big2 " + str);
        //
        ////4.
        //BigDecimal divide = new BigDecimal("1.431");
        //System.out.println("divide = 1.431");
        //System.out.println(divide.divide(BigDecimal.valueOf(1), BigDecimal.ROUND_DOWN).doubleValue());
        //System.out.println(divide.divide(BigDecimal.valueOf(1), BigDecimal.ROUND_CEILING).doubleValue());
        //System.out.println(divide.divide(BigDecimal.valueOf(1), BigDecimal.ROUND_FLOOR).doubleValue());
        //System.out.println(divide.divide(BigDecimal.valueOf(1), BigDecimal.ROUND_HALF_UP).doubleValue());
        //System.out.println(divide.divide(BigDecimal.valueOf(1), BigDecimal.ROUND_HALF_DOWN).doubleValue());
        //System.out.println(divide.divide(BigDecimal.valueOf(1), BigDecimal.ROUND_HALF_EVEN).doubleValue());
        //System.out.println(divide.divide(BigDecimal.valueOf(1), BigDecimal.ROUND_UNNECESSARY).doubleValue());
        //
        //BigDecimal divide1 = new BigDecimal("1.673");
        //System.out.println("divide1 = 1.673");
        //System.out.println(divide1.divide(BigDecimal.valueOf(1), BigDecimal.ROUND_DOWN).doubleValue());
        //System.out.println(divide1.divide(BigDecimal.valueOf(1), BigDecimal.ROUND_CEILING).doubleValue());
        //System.out.println(divide1.divide(BigDecimal.valueOf(1), BigDecimal.ROUND_FLOOR).doubleValue());
        //System.out.println(divide1.divide(BigDecimal.valueOf(1), BigDecimal.ROUND_HALF_UP).doubleValue());
        //System.out.println(divide1.divide(BigDecimal.valueOf(1), BigDecimal.ROUND_HALF_DOWN).doubleValue());
        //System.out.println(divide1.divide(BigDecimal.valueOf(1), BigDecimal.ROUND_HALF_EVEN).doubleValue());
        //System.out.println(divide1.divide(BigDecimal.valueOf(1), BigDecimal.ROUND_UNNECESSARY).doubleValue());
        //
        //
        //String str = String.format("今天是星期 %s  %d %b", "a", 10,1);
        //System.out.println(str);

    //    arrays.asList
        List<String> stringList = Arrays.asList("1", "2", "3");
        stringList.add("123");

    }


}
