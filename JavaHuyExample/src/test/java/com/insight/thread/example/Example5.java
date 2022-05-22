package com.insight.thread.example;

import org.testng.annotations.Test;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class Example5 {

    static void sleep(int sec){
        try{
            Thread.sleep(1000L * sec);
        }catch (Exception ignored){}
    }

    @Test
    public void test1() {
        ExecutorService executor = Executors.newFixedThreadPool(10);

        executor.execute(() -> {
            System.out.println("1");
            sleep(2);
            System.out.println(1/0);
            System.out.println("1");
        });

        executor.execute(() -> {
            System.out.println("2");
            sleep(2);
            System.out.println(1/0);
            System.out.println("2");
        });

        executor.execute(() -> {
            System.out.println("3");
            sleep(2);
            System.out.println(1/0);
            System.out.println("3");
        });


        executor.shutdown();

        while (!executor.isTerminated()){}

        System.out.println("END");

    }
}
