package com.insight.thread.goki_soft;

public class Test {

    public static void main(String[] args) {
        System.out.println(Thread.currentThread().getName() + " START");
        SharedData sharedData = new SharedData();
        Thread thread1 = new Thread1(sharedData);
        Thread thread2 = new Thread1(sharedData);

        thread1.start();
        thread2.start();
        System.out.println(Thread.currentThread().getName() + " END");
    }
}
