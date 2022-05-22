package com.insight.thread.example;

import java.util.HashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class Base {

    ExecutorService executor;
    HashMap<String, String> data;

    {
        executor = executor == null ? Executors.newFixedThreadPool(10) : executor;
        data = data == null ? new HashMap<>() : data;
    }

    public void step1() {
        executor.execute(() ->{
            for (int i = 0; i < 20; i++) {
                System.out.println(Thread.currentThread().getName() + " @@ 1-" +i);
                try {
                    Thread.sleep(500);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
            System.out.println("END STEP 1");
        });
    }

    public void step2() {
        executor.execute(() ->{
            for (int i = 0; i < 20; i++) {
                System.out.println(Thread.currentThread().getName() + " ^^ 2-" +i);
                try {
                    Thread.sleep(400);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
            System.out.println("END STEP 2");
        });
    }



}
