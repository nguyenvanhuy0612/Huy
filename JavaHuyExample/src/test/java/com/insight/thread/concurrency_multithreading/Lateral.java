package com.insight.thread.concurrency_multithreading;

public class Lateral implements Runnable{

    public void run() {
        System.out.println(Thread.currentThread().getName());
    }
}
