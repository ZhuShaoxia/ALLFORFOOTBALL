package tlcb.string;

import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;

/**
 * @author XiaoLei Zhu
 * @Description: 字符串相关知识学习
 * @date 2020/5/27 8:47 下午
 */
public class StringTest {

    public static void main(String[] args) throws UnsupportedEncodingException {
        String str = "zhuxiaolei";
//        byte[] bytes = str.getBytes(StandardCharsets.UTF_8);
//        System.out.println(Arrays.toString(bytes));
//        str.contains("");
//        str.isEmpty();
//        StringUtils.isBlank("");
        String name = "朱晓磊";
        System.out.println(Arrays.toString(name.getBytes(StandardCharsets.UTF_8)));
        System.out.println(Arrays.toString(name.getBytes("GBK")));
    }

}
