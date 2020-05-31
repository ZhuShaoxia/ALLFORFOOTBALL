package tlcb.thread.core.stopthreads;

/**
 * @author XiaoLei Zhu
 * @Description: 如果 while 里面放 try/catch 会导致中断
 *     sleep
 * @date 2020/5/30 11:01 上午
 */
public class CantInterrupt {
    public static void main(String[] args) throws InterruptedException {
        Runnable runnable = new Runnable() {
            @Override
            public void run() {
                int num = 0;
                while (num <= 300 && !Thread.currentThread().isInterrupted()) {
                    if (num % 100 == 0) {
                        System.out.println(num + "是 100 的倍数");
                    }
                    num++;
                    try {
                        Thread.sleep(10);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
            }
        };

        Thread t = new Thread(runnable);
        t.start();
        Thread.sleep(4000);
        t.start();
    }
}
