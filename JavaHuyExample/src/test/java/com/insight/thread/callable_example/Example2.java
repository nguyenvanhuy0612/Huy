package com.insight.thread.callable_example;

import org.testng.annotations.Test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

public class Example2 {

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
        List<Callable<Void>> callables = Arrays.asList(task1, task2);
        try {
            List<Future<Void>> futures = executor.invokeAll(callables);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
