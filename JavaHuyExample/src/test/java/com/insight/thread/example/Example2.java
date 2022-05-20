package com.insight.thread.example;


import org.testng.annotations.Test;

import java.util.HashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicReference;

public class Example2 {

    public void myTask(String name) {
        CountDown countDown = new CountDown();
        countDown.down(10, name);
    }

    @Test
    public void test1() {

        CountDown countDown = new CountDown();

        HashMap<String, String> map = new HashMap<>();
        map.put("k1", "v1");
        map.put("k2", "v2");
        map.put("k3", "v3");
        map.put("task1", "task1 Thread1");
        map.put("task2", "task2 Thread2");

        ExecutorService executorService = Executors.newFixedThreadPool(2);

//        executorService.execute(() -> {
//            synchronized (countDown) {
//                countDown.down(10, "thread1");
//            }
//        });
//        executorService.execute(() -> {
//            synchronized (countDown) {
//                countDown.down(10, "thread2");
//            }
//        });

//        executorService.execute(() -> {
//            synchronized (this) {
//                this.myTask("Task2 Thread");
//            }
//        });
//
//        executorService.execute(() -> {
//            synchronized (this) {
//                this.myTask("Task2 Thread");
//            }
//        });


        AtomicReference<String> name = new AtomicReference<>("");

        executorService.execute(()-> {
            this.myTask("~~Task1");
            name.set("1");
        });

        executorService.execute(()-> {
            this.myTask("!!Task 2");
            name.set("2222");
        });

        executorService.execute(()-> {
            this.myTask("@@Task 3");
            name.set("3333");
        });

        String data = name.get();
        System.out.println("Data1: " + data);

        executorService.shutdown();

        data = name.get();
        System.out.println("Data2: " + data);

        while (!executorService.isTerminated()) {
            Common.sleep(200);
        }

        data = name.get();
        System.out.println("Data3: " + data);
    }


}
