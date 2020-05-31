package tlcb.thread.core.stopthreads;

/**
 * @author XiaoLei Zhu
 * @Description: catch 了 InterruptedException 之后的优先选择：在方法签名抛出了异常
 * 那么在 run 方法中
 *
 * 新注释：中断
 * @date 2020/5/30 11:07 上午
 */
public class RightWayStopThreadInProd {
    public static void main(String[] args) throws InterruptedException {
        Runnable runnable = new Runnable() {
            @Override
            public void run() {
                while (true){
                    /**
                     * 判断当前线程是否中断
                     */
                    if (Thread.currentThread().isInterrupted()){
                        System.out.println("线程已中断...");
                        break;
                    }
                    interrupt();
                }
            }

            private void interrupt() {
                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    /**
                     * 恢复中断
                     */
                    Thread.currentThread().interrupt();
                    e.printStackTrace();
                }
            }
        };

        Thread t = new Thread(runnable);
        t.start();
        Thread.sleep(5000);
        t.interrupt();

    }
}
