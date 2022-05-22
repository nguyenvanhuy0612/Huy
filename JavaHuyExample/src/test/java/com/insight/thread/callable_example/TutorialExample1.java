package com.insight.thread.callable_example;

import org.testng.annotations.Test;

import java.util.concurrent.*;

public class TutorialExample1 {


    @Test
    public void test1() {
        ExecutorService executor = Executors.newSingleThreadExecutor();
        Future<Void> future = executor.submit(new Callable<Void>() {
            @Override
            public Void call() throws Exception {
                System.out.println("** Started");
                Thread.sleep(2000);
                throw new IllegalStateException("exception from thread");
            }
        });
        try {
            future.get(); // raises ExecutionException for any uncaught exception in child
        } catch (InterruptedException | ExecutionException e) {
            System.out.println("** RuntimeException from thread ");
            e.getCause().printStackTrace(System.out);
        }
        executor.shutdown();
        System.out.println("** Main stopped");

    }
}
