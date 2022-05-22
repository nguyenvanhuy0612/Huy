package com.insight.thread.callable_example;

import org.testng.Assert;
import org.testng.annotations.Test;

import java.util.concurrent.*;

public class Example6 {

    @Test
    public void test() {
        ExecutorService executor = Executors.newFixedThreadPool(10);
        Callable<String> c = () -> {
            System.out.println("Start c");
            Thread.sleep(6000);
            System.out.println(1 / 0);
            return null;
        };
        Future<String> future = executor.submit(c);
        try {
            System.out.println("future get start");
            future.get();
            System.out.println("future get finish");
        } catch (Exception e) {
        }
        System.out.println(1 / 0);
        try {
            System.out.println(1 / 0);
        } catch (Exception e) {
            throw e;
        }
    }
}
