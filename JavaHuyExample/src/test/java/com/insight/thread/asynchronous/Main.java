package com.insight.thread.asynchronous;

import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.*;

public class Main {
    public static void main(String[] args) throws ExecutionException, InterruptedException {
        ExecutorService executorService = Executors.newFixedThreadPool(10);
        Callable<String> task = () -> "select user from User";
        Future<String> future = executorService.submit(task);


//        List<String> users = Collections.singletonList(future.get()); // blocking
//        users.forEach(System.out::println) ;

        String user = future.get(); //blocking
        System.out.println(user);

        //example 1:
        List<String> users = Arrays.asList("user1", "user2", "user3", "user4", "user5", "user6");
        ExecutorService executor = Executors.newFixedThreadPool(10);
        CompletableFuture<Void> completableFuture = CompletableFuture.runAsync(() -> {
            System.out.println(users.get(1));
        }, executor);

        completableFuture.thenRun(() -> {
            System.out.println(users);
        });

    }
}
