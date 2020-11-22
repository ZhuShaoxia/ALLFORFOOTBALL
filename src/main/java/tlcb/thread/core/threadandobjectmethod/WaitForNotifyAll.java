package tlcb.thread.core.threadandobjectmethod;

/**
 * @author XiaoLei Zhu
 * @Description:
 * 执行 wait 是对象
 * @date 2020/5/31 8:43 下午
 */
public class WaitForNotifyAll implements Runnable {
    private static Object object = new Object();

    public static void main(String[] args) throws InterruptedException {
        WaitForNotifyAll runnable = new WaitForNotifyAll();
        Thread t1 = new Thread(runnable);
        Thread t2 = new Thread(runnable);
        Thread t3 = new Thread(() -> {
            synchronized (object){
                object.notifyAll();//唤醒所有锁
                System.out.println(Thread.currentThread().getName() + " to Notify");
            }
        });
        t1.start();
        t2.start();
        Thread.sleep(100);
        t3.start();

    }

    @Override
    public void run() {
        synchronized (object){
            System.out.println(Thread.currentThread().getName() + "get  lock ");
            try {
                System.out.println(Thread.currentThread().getName() + " wait to start");
                object.wait();//释放锁 ,等待 notify
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            System.out.println(Thread.currentThread().getName() + " waiting to end");
        }
    }
}
