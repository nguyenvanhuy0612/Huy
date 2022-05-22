package com.insight.thread.callable_example;

import org.testng.annotations.Test;

import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

public class Example6 {

    @Test
    public void test() {
        ExecutorService executor = Executors.newFixedThreadPool(10);
        Callable<String> c = () -> {
            System.out.println(1 / 0);
            return null;
        };
        Future<String> future = executor.submit(c);
    }
}
