package tlcb.thread.core.startthread;

/**
 * @author XiaoLei Zhu
 * @Description: 对比 start 和 run qidogn 方法
 * @date 2020/5/28 11:25 下午
 */
public class StartAndRunMethod {
    public static void main(String[] args) {
        Runnable runnable = () -> System.out.println(Thread.currentThread().getName());
        runnable.run();//普通的 run 方法

        Thread t = new Thread(runnable);
        t.start();
        t.stop();
    }
}
