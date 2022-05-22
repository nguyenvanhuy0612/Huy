package com.insight.thread.example;

import com.huy.practice.dht.kethua.overriding.A;
import org.iq80.snappy.HadoopSnappyCodec;
import org.testng.annotations.Test;

import java.util.HashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class Example3 {

    HashMap<String, String> data;


    @Test
    public void test1() {
        data = data == null ? new HashMap<>() : data;
        Runnable r1 = () -> {
            for (int i = 0; i < 10; i++) {
                System.out.println(Thread.currentThread().getName() + " " + i);
                data.put(Thread.currentThread().getName() + "@@" + i, Thread.currentThread().getName() + "r1_put");
            }
        };
        Runnable r2 = () -> {
            for (int i = 0; i < 10; i++) {
                System.out.println(Thread.currentThread().getName() + " " + i);
                data.put(Thread.currentThread().getName() + "##" + i, Thread.currentThread().getName() + "r1_put");
            }
        };
        ExecutorService executor = Executors.newFixedThreadPool(10);
        executor.execute(r1);
        executor.execute(r2);
        executor.shutdown();
        while (!executor.isTerminated()) {
        }
        System.out.println(data);
        System.out.println("END");

    }

}
