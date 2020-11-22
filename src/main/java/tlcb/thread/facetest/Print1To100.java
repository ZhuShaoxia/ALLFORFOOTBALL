package tlcb.thread.facetest;

/**
 * @author XiaoLei Zhu
 * @Description: 两个线程交替打印0~100的奇偶数
 * synchronized 实现 :效率不高
 * 1， 对象锁
 * 2。 位运算
 *两个线程竞争的时候，会产生很多无效操作，比如某个线程一直竞争到，但是 位运算结果一直为 false ,造成效率很低
 * @date 2020/6/6 11:26 上午
 */
public class Print1To100 {

    private static int count;
    private static Object lock = new Object();


    public static void main(String[] args) {

        new Thread(() -> {
            while (count < 100) {
                synchronized (lock) {
                    if ((count & 1) == 0) {
                        System.out.println(Thread.currentThread().getName() + " : " + count++);
                    }
                }
            }
        }, "奇数").start();

        new Thread(() -> {
            while (count < 100) {
                synchronized (lock) {
                    if ((count & 1) == 1) {
                        System.out.println(Thread.currentThread().getName() + " : " + count++);
                    }
                }
            }
        }, "偶数").start();
    }
}
