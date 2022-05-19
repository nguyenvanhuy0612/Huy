package com.insight.thread.concurrency_multithreading;

import java.util.concurrent.Future;

public class Test {
    public static void main(String[] args) {


        Lateral la = new Lateral();

        new Thread(la).start();
        new Thread(la).start();
        new Thread(la).start();
        new Thread(la).start();

        System.out.println(Thread.currentThread().getName());

        Runnable r1 = () -> {
            for (int i = 0; i < 5; i++) {
                Env.wait(1);
                System.out.println(i);
            }
        };

        Thread t1 = new Thread(r1);

        t1.start();

        System.out.println(t1.getState());

        while (true)
        {
            boolean isAlive = t1.isAlive();
            System.out.println("isAlive: " + isAlive);
            if (!isAlive){
                break;
            }
            Env.wait(1);
        }

        Env.wait(5);

        t1.interrupt();


        System.out.println("End");


    }
}
