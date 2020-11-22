package tlcb.thread.pools;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.*;

/**
 * @author XiaoLei Zhu
 * @Description: 线程池玩儿
 * @date 2020/6/7 11:24 下午
 */
public class PoolTest {
    public static void main(String[] args) throws ExecutionException, InterruptedException {
        ExecutorService[] executors = new ExecutorService[3];
        for (int i = 0; i < 3; i++) {
            executors[i] = Executors.newFixedThreadPool(10);//线程数固定的线程池
            //executors[i] = Executors.newCachedThreadPool();
        }
        List<Future<String>> futures = new ArrayList<>();
        PoolTest poolTest = new PoolTest();
        int threadCount = 0;
        for (int i = 0; i < 30; i++) {
            threadCount++;
            futures.add(executors[i % 3].submit(new Task(poolTest.initData())));
        }
        System.out.println("已创建[" + threadCount + "]线程!");

        //for (Future<String> f : futures) {
        //    String o = f.get();
        //    System.out.println("线程:" + o + " 执行完毕!");
        //}

        for (ExecutorService executor : executors) {
            executor.shutdown();
        }
    }

    public List<String> initData() throws InterruptedException {
        List<String> result = new ArrayList<>(100);
        for (int i = 0; i < 100; i++) {
            result.add(" i =  " + i);
            //Thread.sleep(5);
        }
        return result;
    }

    static class Task implements Callable<String> {
        private List<String> list;

        public Task(List<String> list) {
            this.list = list;
        }

        @Override
        public String call() throws Exception {
            String threadName = Thread.currentThread().getName();
            Thread.sleep(1000);
            System.out.println(threadName + "睡觉了!");
            for (String s : list) {
                Thread.sleep(50);
                System.out.println("线程[" + threadName + "]:" + s);
            }
            System.out.println(threadName + "睡醒了!");
            return threadName;
        }
    }
}
