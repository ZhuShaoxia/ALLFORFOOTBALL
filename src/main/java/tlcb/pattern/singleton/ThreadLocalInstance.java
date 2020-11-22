package tlcb.pattern.singleton;

/**
 * @author XiaoLei Zhu
 * @Description: 基于 ThreadLocal
 *  线程隔离
 * @date 2020/5/27 9:24 下午
 */
public class ThreadLocalInstance {

    private ThreadLocalInstance() {

    }

    private static final ThreadLocal<ThreadLocalInstance> t = ThreadLocal.withInitial(ThreadLocalInstance::new);

    public ThreadLocalInstance getInstance() {
        return t.get();
    }
}
