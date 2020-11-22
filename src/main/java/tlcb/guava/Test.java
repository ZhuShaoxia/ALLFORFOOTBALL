package tlcb.guava;

import com.google.common.base.Joiner;
import com.google.common.base.Strings;

import java.util.ArrayList;
import java.util.List;

/**
 * @author XiaoLei Zhu
 * @Description: guava 练习使用
 * @date 2020/6/6 9:13 上午
 */
public class Test {
    public static void main(String[] args) {

        StringBuilder stringBuilder = new StringBuilder();
        //1 跳过空值
        //Joiner joiner = Joiner.on("|").skipNulls();
        //2. 使用空值
        Joiner joiner = Joiner.on("|").useForNull("NULL");
        List<String> list = new ArrayList();
        for (int i = 0; i < 30; i++) {
            list.add(i + "");
            if (i % 3 == 0) {
                list.add(null);
            }
        }
        list.add("   ");
        list.add(" End");

        joiner.appendTo(stringBuilder, list.iterator());
        System.out.println(stringBuilder.toString());

        String s = Strings.padEnd("zhuxiaolei", 20, ' ') + "|";
        System.out.println(s);
        //Files
        //CacheBuilder
    }
}
