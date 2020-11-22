package tlcb.thread;

import java.util.concurrent.Semaphore;

/**
 * @author XiaoLei Zhu
 * @Description: 模拟海关安检场景
 * @date 2020/5/31 10:41 下午
 */
public class CustomerCheckWindow {
    public static void main(String[] args) {
        Semaphore semaphore = new Semaphore(3);
        for (int i = 0; i < 5; i++) {
            new SecurityCheckThread(i, semaphore).start();
        }
        
    }


    private static class SecurityCheckThread extends Thread {
        private int seq;
        private Semaphore semaphore;

        public SecurityCheckThread(int seq, Semaphore semaphore) {
            this.seq = seq;
            this.semaphore = semaphore;
        }

        @Override
        public void run() {
            try {
                semaphore.acquire();
                System.out.println("NO." + seq + " 乘客 正在安检");
                if (seq % 2 == 0) {
                    Thread.sleep(5000);
                    System.out.println("NO." + seq + " 乘客身份可疑!请核实");
                }
            } catch (InterruptedException e) {
                e.printStackTrace();
            } finally {
                semaphore.release();
                System.out.println("NO." + seq + " 乘客已完成服务！");
            }
        }
    }
}
