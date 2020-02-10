package com.ccsu.afterleaveschool.thread;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/9/1
 * @Time: 20:57
 * Description:
 */
public class ThreadTest implements Runnable {
    private static Integer count = 0;
    private String name;

    public ThreadTest(String name) {
        this.name = name;
    }

    @Override
    public void run() {
        addCount();
    }

    public void addCount() {
        synchronized (count){
            for (int i = 0; i < 30; i++) {
                count++;
                System.out.println(this.name + ":count = " + count );
            }
        }
    }


    public static void main(String[] args) {
        ThreadTest t1 = new ThreadTest("thread1");
        Thread thread = new Thread(t1);
        thread.start();
        ThreadTest t2 = new ThreadTest("thread2");
        Thread thread1 = new Thread(t2);
        thread1.start();
    }
}
