package tlcb.thread.core.sixthreads;

/**
 * @author XiaoLei Zhu
 * @Description: 展示 Blokced/waiting/time waingting 状态
 * @date 2020/5/31 9:50 上午
 */
public class BlockedWaitingTimedWaiting implements Runnable {

    public static void main(String[] args) throws InterruptedException {
        BlockedWaitingTimedWaiting runnable = new BlockedWaitingTimedWaiting();
        Thread t1 = new Thread(runnable);
        t1.start();
        Thread t2 = new Thread(runnable);
        t2.start();
        try {
            Thread.sleep(5);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println(t1.getState());//TIMED_WAITING 因为正在执行 Thread.sleep(1000)
        System.out.println(t2.getState());//BLOCKED 线程想拿得到锁拿不出

        Thread.sleep(1300);
        System.out.println(t1.getState());//WAITING ,执行了 Object.wait() 方法
    }

    @Override
    public void run() {
        sync();
    }

    private synchronized void sync(){
        try {
            Thread.sleep(1000);
            wait();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
