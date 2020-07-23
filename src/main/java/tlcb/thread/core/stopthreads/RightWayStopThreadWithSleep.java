package tlcb.thread.core.stopthreads;

/**
 * @author XiaoLei Zhu
 * @Description: 带有sleep 中断线程的写法
 * @date 2020/5/30 10:49 上午
 */
public class RightWayStopThreadWithSleep {
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
                    }
                    System.out.println("子线程开始休眠");
                    Thread.sleep(1000);
                    System.out.println("子线程结束休眠");
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        };

        Thread t = new Thread(runnable);
        t.start();
        Thread.sleep(400);
        t.interrupt();
        System.out.println("子线程结束");
    }

}
