package com.insight.thread.example;

public class CountDownRunnable implements Runnable{
    private final String threadName;

    public CountDownRunnable(String threadName) {
        this.threadName = threadName;
    }

    @Override
    public void run() {
        System.out.println("Thread: " + threadName);
        int count = 10;
        for (int i = count; i > 0; i--) {
            System.out.println(i);
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        System.out.println(threadName + ": End Count Time");
    }
}
