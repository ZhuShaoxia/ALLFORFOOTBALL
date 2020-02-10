package com.ccsu.afterleaveschool.enums;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2020/2/9
 * @Time: 15:56
 * Description:
 */
public enum OperationEnum {
    ADD {
        @Override
        public int eval(int a, int b) {
            return a + b;
        }
    }, SUBTRACT {
        @Override
        public int eval(int a, int b) {
            return a - b;
        }
    }, MULTIPLY {
        @Override
        public int eval(int a, int b) {
            return a * b;
        }
    }, DIVIDE {
        @Override
        public int eval(int a, int b) {
            return a / b;
        }
    };

    public abstract int eval(int a, int b);
}
