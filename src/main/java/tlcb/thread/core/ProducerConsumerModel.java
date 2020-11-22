package tlcb.thread.core;

import java.util.LinkedList;

/**
 * @author XiaoLei Zhu
 * @Description: 生产者和消费者模式
 * 用 wait 和 notify 实现
 * @date 2020/6/6 10:53 上午
 */
public class ProducerConsumerModel {
    public static void main(String[] args) {
        EventStorage storage = new EventStorage();
        Thread producer = new Thread(new Producer(storage));
        Thread consumer = new Thread(new Consumer(storage));
        producer.start();
        consumer.start();
    }
}

class EventStorage {
    private int maxStorage;
    private LinkedList<Integer> list;

    public EventStorage() {
        this.maxStorage = 10;
        this.list = new LinkedList<>();
    }

    public synchronized void put(Integer i) {
        while (list.size() == maxStorage) {
            try {
                wait();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        list.add(i);
        System.out.println("仓库例有了 " + list.size());
        notify();
    }

    public synchronized void take() {
        while (list.size() == 0) {
            try {
                wait();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        notify();
        System.out.println("拿到了 " + list.poll() + ", 现在仓库还剩下 " + list.size() + " :" + System.currentTimeMillis());
    }
}

class Producer implements Runnable {
    private EventStorage storage;


    public Producer(EventStorage storage) {
        this.storage = storage;
    }

    public void setStorage(EventStorage storage) {
        this.storage = storage;
    }


    @Override
    public void run() {
        for (int i = 0; i < 100; i++) {
            storage.put(i);
        }
    }
}

class Consumer implements Runnable {
    private EventStorage storage;

    public Consumer(EventStorage storage) {
        this.storage = storage;
    }

    public void setStorage(EventStorage storage) {
        this.storage = storage;
    }

    @Override
    public void run() {
        for (int i = 0; i < 100; i++) {
            storage.take();
        }
    }
}