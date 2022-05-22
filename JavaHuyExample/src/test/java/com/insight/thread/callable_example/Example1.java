package com.insight.thread.callable_example;

import org.testng.annotations.Test;

import java.util.concurrent.*;

public class Example1 {

    @Test
    public void test1() {
        ExecutorService executor = Executors.newFixedThreadPool(10);

        Callable<Void> task1 = () -> {
            for (int i = 0; i < 5; i++) {
                System.out.println(Thread.currentThread().getName() + " ** task1 Started: *" + i);
                Thread.sleep(2000);
            }
            return null;
        };

        Callable<Void> task2 = () -> {
            for (int i = 0; i < 10; i++) {
                System.out.println(Thread.currentThread().getName() + " @@ task2 Started: __" + i);
                Thread.sleep(1200);
                if (i == 4)
                    System.out.println(1/0);
            }
            return null;
        };


        Future<Void> future1 = executor.submit(task1);
        Future<Void> future2 = executor.submit(task2);

        executor.shutdown();
        while (!executor.isTerminated()){}




    }

}
