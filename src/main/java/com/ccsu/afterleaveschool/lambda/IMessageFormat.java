package com.ccsu.afterleaveschool.lambda;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2020/2/7
 * @Time: 21:54
 * Description: 消息格式化转换接口
 */
@FunctionalInterface
public interface IMessageFormat {
    /**
     * 消息转换方法
     *
     * @param message 要转换的消息
     * @param format  转换的格式[xml/json..]
     * @return 返回转换后的数据
     */
    String format(String message, String format);

    static boolean verifyMsg(String msg) {
        if (msg != null) {
            return true;
        }
        return false;
    }
}
