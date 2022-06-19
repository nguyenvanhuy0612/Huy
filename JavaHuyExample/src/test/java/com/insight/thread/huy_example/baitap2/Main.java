package com.insight.thread.huy_example.baitap2;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.*;

public class Main {

    public static void main(String[] args) {
        System.out.println("START");
        ExecutorService executorService = Executors.newFixedThreadPool(5);
        List<Callable<String>> callableList = new ArrayList<>();

        for (int i = 0; i < 10; i++) {
            final int _i = i;
            //callableList.add(() -> "Callable " + _i);
            callableList.add(() -> {
                Thread.sleep(5000);
                String name = "Callable " + _i + " " + Thread.currentThread().getName();
                System.out.println(name);
                return name;
            });
        }
        System.out.println();

        List<Future<String>> result = new ArrayList<>();
        try {
            System.out.println("invokeAll start");
            result = executorService.invokeAll(callableList);
            System.out.println("invokeAll finish");
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println();

        result.forEach(r -> {
            try {
                System.out.println(r.get());
            } catch (InterruptedException | ExecutionException e) {
                e.printStackTrace();
            }
        });

        executorService.shutdown();
        System.out.println("END");
    }

    public static void main4(String[] args) {
        System.out.println("START");
        ExecutorService executorService = Executors.newFixedThreadPool(5);
        List<Callable<String>> callableList = new ArrayList<>();

        for (int i = 0; i < 10; i++) {
            final int _i = i;
            callableList.add(() -> "Callable " + _i);
        }

        String result = "";
        try {
            result = executorService.invokeAny(callableList);
        } catch (InterruptedException | ExecutionException e) {
            e.printStackTrace();
        }

        System.out.println("result: " + result);

        executorService.shutdown();
        System.out.println("END");
    }

    public static void main3(String[] args) {
        System.out.println("START");
        ExecutorService executorService = Executors.newFixedThreadPool(5);
        List<Future<String>> futures = new ArrayList<>();

        for (int i = 1; i <= 10; i++) {
            MyCallable myCallable = new MyCallable("Callable " + i);
            Future<String> future = executorService.submit(myCallable);
            synchronized (futures){
                futures.add(future);
            }
        }

        for (Future<String> future : futures) {
            try {
                System.out.println("Get data: " + future.get());
            } catch (ExecutionException | InterruptedException e) {
                e.printStackTrace();
            }
        }

        executorService.shutdown();
        System.out.println("END");
    }

    public static void main2(String[] args) {
        System.out.println("START");
        ExecutorService executorService = Executors.newFixedThreadPool(5);
        List<Future> futures = new ArrayList<>();

        for (int i = 1; i <= 10; i++) {
            MyRunnable myRunnable = new MyRunnable("Runnable " + i);
            Future future = executorService.submit(myRunnable);
            futures.add(future);
        }

        for (Future future : futures) {
            try {
                System.out.println(future.get());
            } catch (ExecutionException | InterruptedException e) {
                e.printStackTrace();
            }
        }
        executorService.shutdown();
        System.out.println("END");
    }

    public static void main1(String[] args) {
        System.out.println("START");

        ExecutorService executorService = Executors.newFixedThreadPool(5);

        for (int i = 1; i <= 10; i++) {
            MyRunnable myRunnable = new MyRunnable("Runnable " + i);
            executorService.execute(myRunnable);
        }

        executorService.shutdown();
        System.out.println("END");
    }
}
