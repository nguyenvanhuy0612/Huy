package com.insight.thread.callable_example;

import org.testng.Assert;
import org.testng.annotations.Test;

import java.util.Arrays;
import java.util.List;
import java.util.concurrent.*;

public class Example3 {

    @Test
    public void test1() {
        ExecutorService executor = Executors.newFixedThreadPool(10);
        Runnable r = () -> {
            for (int i = 0; i < 10; i++) {
                System.out.println("Run 1");
                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
            System.out.println("Run 1-2");
            System.out.println(1/0);
        };

        Callable<String> c = () -> {
            for (int i = 0; i < 10; i++) {
                System.out.println("Call 1");
                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
            System.out.println("Call 1-2");
            System.out.println(1/0);
            return "";
        };
//        Future future = executor.submit(r);
//        Future future2 = executor.submit(r);

        System.out.println("START");

        try {
            List<Future<String>> futures = executor.invokeAll(Arrays.asList(c, c, c));
            for (Future<String> future : futures){
                String data = future.get();
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }catch (ExecutionException e){
            e.printStackTrace();
            Assert.fail();
        }

        System.out.println("END");
    }
}
