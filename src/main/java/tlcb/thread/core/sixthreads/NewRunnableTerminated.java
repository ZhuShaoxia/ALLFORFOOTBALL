package tlcb.thread.core.sixthreads;

/**
 * @author XiaoLei Zhu
 * @Description: 展示线程的 new / runnable / terminated 三种状态
 * 即使正在运行，也是 runnable 状态 ，而不是 Running 状态
 * @date 2020/5/31 9:42 上午
 */
public class NewRunnableTerminated implements Runnable {
    public static void main(String[] args) {
        Thread t = new Thread(new NewRunnableTerminated());
        System.out.println(" " + t.getState());//NEW
        t.start();
        System.out.println(" " + t.getState());//RUNNABLE
        try {
            Thread.sleep(10);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println(" " + t.getState());//RUNNABLE 执行完则为 TERMINATED
    }

    @Override
    public void run() {
        for (int i = 0; i < 1000; i++) {
            System.out.println("i = " + i);
        }
    }
}
