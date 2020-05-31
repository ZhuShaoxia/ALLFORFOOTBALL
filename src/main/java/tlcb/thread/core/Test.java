package tlcb.thread.core;

/**
 * @author XiaoLei Zhu
 * @Description: 停止线程相关重要函数解析
 * @date 2020/5/30 5:52 下午
 */
public class Test {
    public static void main(String[] args) {
        Thread.interrupted();
        Thread t = new Thread(() -> {

        });
        t.isInterrupted();
        t.interrupt();

    }
}
