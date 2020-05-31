package tlcb.thread.core.stopthreads;

/**
 * @author XiaoLei Zhu
 * @Description: run方法内没有sleep或wait方法时，停止线程
 * @date 2020/5/30 10:41 上午
 */
public class RightWayStopThreadWithoutSleep implements Runnable {

    @Override
    public void run() {
        int num = 0;
        while (num <= Integer.MAX_VALUE / 2) {
            if (!Thread.currentThread().isInterrupted() && num % 10000 == 0) {
                System.out.println(num + "是 10000的倍数");
            }
            num++;
        }
    }

    public static void main(String[] args) throws InterruptedException {
        /**
         * 普通运行情况
         */
        Thread t = new Thread(new RightWayStopThreadWithoutSleep());
        t.start();
        System.out.println("======睡眠=====");
        Thread.sleep(500);
        System.out.println("======睡眠=====");
        System.out.println("======开始中断=====");
        t.interrupt();
        System.out.println("======结束中断=====");
    }
}
