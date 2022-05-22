package com.insight.thread.callable_example;

import org.testng.annotations.Test;

import java.util.concurrent.CompletionService;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class Example5 {

    @Test
    public void test() {
        Thread t1 = new Thread(() -> System.out.println(Thread.currentThread().getName()));
        Thread t2 = new Thread(() -> {
            System.out.println(Thread.currentThread().getName());
            System.out.println(1 / 0);
        });
        Thread t3 = new Thread(() -> {
            System.out.println(Thread.currentThread().getName());
            System.out.println("OK");
        });

    }
}
