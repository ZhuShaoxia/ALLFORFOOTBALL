package tlcb.thread.core;

/**
 * @author XiaoLei Zhu
 * @Description:
 * @date 2020/5/30 5:57 下午
 */
public class RightWayInterrupted {
    public static void main(String[] args) throws InterruptedException {
        Thread t = new Thread(new Runnable() {
            @Override
            public void run() {
                for (; ; ) {

                }
            }
        });
        //启动线程
        t.start();
        //设置中断标志
        t.interrupt();
        //获取中断标志并重置
        System.out.println("t " + t.isInterrupted());
        //获取中断标志并重置
        System.out.println("t " + t.interrupted());
        System.out.println("Main " + Thread.interrupted());
        //获取中断标志
        System.out.println("t " + t.isInterrupted());

        t.join();
    }
}
