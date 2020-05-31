package tlcb.thread.core.stopthreads;

/**
 * @author XiaoLei Zhu
 * @Description: 循环阻塞
 *  如果在执行过程中，每次循环都会调用 sleep 或 wait方法，那么不需要每次迭代都检查是否已中断
 * @date 2020/5/30 10:56 上午
 */
public class RightWayStopThreadWithSleepEveryLoop {
    public static void main(String[] args) throws InterruptedException {
        Runnable runnable = new Runnable() {
            @Override
            public void run() {
                int num = 0;
                try {
                    while (num <= 300 && !Thread.currentThread().isInterrupted()) {
                        if (num % 100 == 0) {
                            System.out.println(num + "是100的倍数");
                        }
                        num++;
                        Thread.sleep(100);
                    }

                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        };

        Thread t = new Thread(runnable);
        t.start();
        Thread.sleep(4000);
        t.interrupt();
        System.out.println("子线程结束");
    }

}
