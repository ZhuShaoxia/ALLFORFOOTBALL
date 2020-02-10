package com.ccsu.afterleaveschool.enums;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2020/2/9
 * @Time: 15:23
 * Description:
 */
public class EnumTest {
    public static void main(String[] args) {

        //1. 获取值
        DayEnum day = DayEnum.WEDNESDAY;
        System.out.println(day);
        System.out.println(day.getDesc());

        //2. Enum 方法
        //ordinal 返回此枚举常数的序数
        System.out.println(day.ordinal());

        //values
        DayEnum[] values = DayEnum.values();
        for (DayEnum value : values) {
            System.out.println("ordinal = " + value.ordinal() + " | value = " + value + "  | valueName = " + value.getDesc());
        }
        //compareTo
        System.out.println(day.compareTo(DayEnum.MONDAY));

        //3. 抽象方法
        int result = OperationEnum.ADD.eval(3, 4);
        System.out.println(result);
        

    }

    public int operation(OperationEnum op, int a, int b) {
        int result = 0;
        switch (op) {
            case ADD:
                result = a + b;
                break;
            case SUBTRACT:
                result = a - b;
                break;
            case DIVIDE:
                result = a / b;
                break;
            case MULTIPLY:
                result = a * b;
                break;
            default:
                result = 0;
                break;

        }
        return result;
    }
}
