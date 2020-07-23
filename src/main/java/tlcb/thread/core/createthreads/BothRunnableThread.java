package tlcb.thread.core.createthreads;

/**
 * @author XiaoLei Zhu
 * @Description: 同时使用两种实现线程
 * @date 2020/5/28 12:16 上午
 */
public class BothRunnableThread {
    public static void main(String[] args) {
        /**
         * 1. 首先创建匿名内部类
         * 2. 其次，覆盖了父类的方法
         * 固 执行 thread
         */
        Thread t = new Thread(new Runnable() {
            @Override
            public void run() {
                System.out.println("我来自 Runnable");
            }
        }) {
            @Override
            public void run() {
                // 覆盖父类方法
                System.out.println("我来自 Thread");
            }
        };
        t.start();
    }
}
