package tlcb.function.stream;

import java.util.stream.Stream;

/**
 * @author XiaoLei Zhu
 * @Description:
 * @date 2020/6/8 11:20 下午
 */
public class StreamTest {
    public static void main(String[] args) {
        Stream<String> stream = Stream.of("A", "B", "C", "D");
        // forEach()方法相当于内部循环调用，
        // 可传入符合Consumer接口的void accept(T t)的方法引用：
        stream.forEach(System.out::println);
    }
}
