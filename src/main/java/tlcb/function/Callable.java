package tlcb.function;

/**
 * @author XiaoLei Zhu
 * @Description:
 * @date 2020/6/8 11:13 下午
 */
public interface Callable<T> {
    T call(String arg, T t);
}
