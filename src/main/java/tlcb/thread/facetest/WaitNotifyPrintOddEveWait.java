package tlcb.thread.facetest;

/**
 * @author XiaoLei Zhu
 * @Description: 采用 wait/notify 两个线程交替打印0～100的奇偶数
 * 1。 拿到锁，打印
 * 2。 打印完，唤醒其它线程，自己就休眠
 * @date 2020/6/6 11:42 上午
 */
public class WaitNotifyPrintOddEveWait {

    private static int count = 0;
    private static Object lock = new Object();

    public static void main(String[] args) {
        new Thread(new TurningRunner(),"偶数").start();
        new Thread(new TurningRunner(),"奇数").start();
    }

    static class TurningRunner implements Runnable {

        @Override
        public void run() {
            while (count <= 100) {
                synchronized (lock) {
                    System.out.println(Thread.currentThread().getName() + " : " + count++);
                    lock.notify();//唤醒等待的线程
                    if (count <= 100) {
                        try {
                            //如果任务还没结束，就让出当前的锁，并休眠
                            lock.wait();
                        } catch (InterruptedException e) {
                            e.printStackTrace();
                        }
                    }
                }
            }
        }
    }
}
