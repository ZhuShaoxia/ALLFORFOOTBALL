package tlcb.thread.core.stopthreads.voliatiledemo;

import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;

/**
 * @author XiaoLei Zhu
 * @Description: 用 Volatile 的局限性
 * 生产者消费者采用 Interrupt 方法使线程停止下来
 *
 * @date 2020/5/30 12:17 下午
 */
public class WrongWayVolatileFixed {
    public static void main(String[] args) throws InterruptedException {
        WrongWayVolatileFixed wrongWayVolatileFixed = new WrongWayVolatileFixed();
        ArrayBlockingQueue storage = new ArrayBlockingQueue(10);
        Producer producer = wrongWayVolatileFixed.new Producer(storage);
        Thread producerThread = new Thread(producer);
        producerThread.start();
        Thread.sleep(1000);

        Consumer consumer = wrongWayVolatileFixed.new Consumer(storage);
        while (consumer.needMoreNums()) {
            consumer.storage.take();//消费
            Thread.sleep(100);
        }
        producerThread.interrupt();
    }

    class Producer implements Runnable {

        BlockingQueue storage;//阻塞队列

        public Producer(BlockingQueue storage) {
            this.storage = storage;
        }

        @Override
        public void run() {
            int num = 0;
            try {
                while (num <= 10000 && !Thread.currentThread().isInterrupted()) {
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
}



