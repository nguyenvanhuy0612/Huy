package com.insight.thread.callable_example;

import org.testng.annotations.Test;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicBoolean;

public class Example4 {
    @Test
    public void test1() {
        AtomicBoolean isComplete = new AtomicBoolean(false);
        ExecutorService executor = Executors.newFixedThreadPool(10);
        Runnable r1 = () -> {
            System.out.println("R1");
            try {
                Thread.sleep(7000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            System.out.println("R1 done");
            isComplete.set(true);
        };
        Runnable r2 = () -> {
            System.out.println("R2");
            try {
                Thread.sleep(4000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            System.out.println("R2 done");
            System.out.println(1 / 0);
            isComplete.set(true);
        };
        executor.execute(r1);
        executor.execute(r2);
        executor.shutdown();
        while (!executor.isTerminated()) {
            if (!isComplete.get()) {

            }
        }

    }
}
