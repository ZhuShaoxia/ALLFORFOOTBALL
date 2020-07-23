package tlcb.thread.core.stopthreads.voliatiledemo;

import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;

/**
 * @author XiaoLei Zhu
 * @Description: 用 Volatile 的局限性
 * 陷入阻塞时，volatile 是无法停止线程的
 * 生产者的生产速度很快，消费者消费速度满，阻塞队列满了以后，生产者会阻塞，等待消费则进一步消费
 * @date 2020/5/30 12:17 下午
 */
public class WrongWayVolatileCantStop {
    public static void main(String[] args) throws InterruptedException {
        ArrayBlockingQueue storage = new ArrayBlockingQueue(10);
        Producer producer = new Producer(storage);
        Thread producerThread = new Thread(producer);
        producerThread.start();
        Thread.sleep(1000);

        Consumer consumer = new Consumer(storage);
        while (consumer.needMoreNums()) {
            consumer.storage.take();//消费
            Thread.sleep(100);
        }
        producer.canceled = true;//下面 producer put 时候容易被阻塞
    }
}

class Producer implements Runnable {

    public volatile boolean canceled = false;
    BlockingQueue storage;//阻塞队列

    public Producer(BlockingQueue storage) {
        this.storage = storage;
    }

    public boolean isCanceled() {
        return canceled;
    }

    public void setCanceled(boolean canceled) {
        this.canceled = canceled;
    }

    @Override
    public void run() {
        int num = 0;
        try {
            while (num <= 10000 && !canceled) {
                if (num % 100 == 0) {
                    storage.put(num);//容易被阻塞
                }
                num++;
                Thread.sleep(1);
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        } finally {
            System.out.println("生产者停止运行");
        }
    }

    public BlockingQueue getStorage() {
        return storage;
    }

    public void setStorage(BlockingQueue storage) {
        this.storage = storage;
    }
}

class Consumer {
    BlockingQueue storage;

    public Consumer(BlockingQueue storage) {
        this.storage = storage;
    }

    public boolean needMoreNums() {
        return !(Math.random() > 0.95);
    }
}

