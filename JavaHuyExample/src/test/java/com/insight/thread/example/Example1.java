package com.insight.thread.example;

public class Example1 {

    public static void main(String[] args) {
        CountDownThread countDownThread = new CountDownThread("Thread 1");
        countDownThread.start();


        CountDownRunnable countDownRunnable = new CountDownRunnable("Thread 2");
        Thread thread = new Thread(countDownRunnable);
        thread.start();
    }
}
