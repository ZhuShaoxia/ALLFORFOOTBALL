package com.ccsu.common.utils;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/13
 * @Time: 10:06
 * Description:
 */
public class testThread implements Runnable {

    private Thread thread;
    private String threadName;

    public testThread(String threadName) {
        this.threadName = threadName;
        System.out.println("thread:" + threadName + " is creating");
    }

    @Override
    public void run() {
        System.out.println("Running " + threadName);
        try {
            for (int i = 4; i > 0; i--) {
                System.out.println("Thread: " + threadName + ", " + i);
                // 让线程睡眠一会
                Thread.sleep(5);
            }
        } catch (InterruptedException e) {
            System.out.println("Thread " + threadName + " interrupted.");
        }
        System.out.println("Thread " + threadName + " exiting.");
    }

    public void start() {
        System.out.println("thread:" + threadName + " is start");
        if (thread == null) {
            thread = new Thread(this, threadName);
            thread.start();
        }
    }

    public static void main(String[] args) {
        testThread t1 = new testThread("111111111");
        t1.start();
        testThread t2 = new testThread("222222222");
        t2.start();
    }

}
