package com.insight.thread.goki_soft.exercise1;

public class Main {
    public static void main(String[] args) {
        // thread1: sinh ra so ngau nhien tu 1 - 100
        // thread2:

        BaseData baseData = new BaseData();

        Thread1 thread1 = new Thread1(baseData);
        Thread2 thread2 = new Thread2(baseData);
        Thread3 thread3 = new Thread3(baseData);

        thread1.setName("T1");
        thread2.setName("T2");
        thread3.setName("T3");

        thread1.start();
        thread2.start();
        thread3.start();



    }
}
