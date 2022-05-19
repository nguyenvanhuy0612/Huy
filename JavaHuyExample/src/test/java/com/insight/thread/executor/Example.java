package com.insight.thread.executor;

import org.junit.experimental.theories.Theories;

import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class Example {

    static void wait(int sec) {
        try {
            Thread.sleep(sec * 1000L);
        } catch (InterruptedException e) {
        }
    }


    public static void main(String[] args) {

        Runnable r = () -> {
            for (int i = 0; i < 10; i++) {
                System.out.println(Thread.currentThread().getName() + " " + i);
                wait(1);
            }
        };



        Thread t1 = new Thread(r);
        Thread t2 = new Thread(r);

        System.out.println("Thread 0: " + t1.getState());
        System.out.println("Thread 1: " + t2.getState());


        t1.start();
        wait(1);
        System.out.println("Thread 0: " + t1.getState());

        wait(5);

        t2.start();
        wait(1);
        System.out.println("Thread 1: " + t2.getState());

        while (t1.isAlive() || t2.isAlive())
        {
            wait(3);
        }

        System.out.println("End");






    }

}
