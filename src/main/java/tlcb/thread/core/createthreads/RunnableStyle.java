package tlcb.thread.core.createthreads;

/**
 * @author XiaoLei Zhu
 * @Description: 用 Runnable 方式创建线程
 * @date 2020/5/28 12:06 上午
 */
public class RunnableStyle implements Runnable{

    public static void main(String[] args) {

        Thread t1 = new Thread(new RunnableStyle());
        Thread t2 = new Thread(new RunnableStyle());
        Thread t3 = new Thread(new RunnableStyle());
        Thread t4 = new Thread(new RunnableStyle());
        t1.start();
        t2.start();
        t3.start();
        t4.start();
    }

    @Override
    public void run() {
        System.out.println("用 Runnable 方法实现接口～");
    }
}
