package com.insight.thread.example;

import org.apache.log4j.Logger;
import org.apache.logging.log4j.core.util.Cancellable;
import org.testng.annotations.Test;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;

public class Example6 {

    @SuppressWarnings("unchecked")
    private static <T extends Throwable> void throwException(Throwable exception) throws T {
        throw (T) exception;
    }

    @Test
    public void test3() {
        ExecutorService executor = Executors.newFixedThreadPool(10);
        Callable<Object> callable1 = () -> {
            System.out.println(Thread.currentThread().getName());

            Thread.sleep(15000);
            System.out.println(1 / 0);
            return null;
        };
        Callable<Object> callable2 = () -> {
            System.out.println(Thread.currentThread().getName());
            for (int i = 0; i < 5; i++) {
                System.out.println(Thread.currentThread().getName() + " -- " + i);
                Thread.sleep(1000);
            }
            System.out.println(1 / 0);
            return null;
        };
        List<Future<Object>> futureList = new ArrayList<>();
        try {
            futureList = executor.invokeAll(Arrays.asList(callable1, callable2));
        } catch (InterruptedException e) {
            throwException(e);
        }

        executor.shutdown();

        while (!executor.isTerminated()) {
            System.out.println("Running");

            try {
                for (Future<Object> future : futureList) {
                    if (future.isDone()) {
                        future.get();
                    }
                }
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            } catch (ExecutionException e) {
                throwException(e);
            }
        }
        System.out.println("END");
    }


    @Test
    public void test2() {

        File file = new File("huy");
        try {
            FileReader fileReader = new FileReader(file);
        } catch (FileNotFoundException e) {
            throwException(e);
        }
    }

    @Test
    public void test() {
        ExecutorService executor = Executors.newFixedThreadPool(10);

        AtomicBoolean hasException = new AtomicBoolean(false);
        AtomicReference<Exception> exception = new AtomicReference<>();

        executor.execute(() -> {
            try {
                System.out.println(Thread.currentThread().getName());
                Thread.sleep(7000);
                System.out.println("End");
            } catch (Exception e) {
                e.printStackTrace();
                exception.set(e);
                hasException.set(true);
            }
        });
        executor.execute(() -> {
            try {
                System.out.println(Thread.currentThread().getName());
                Thread.sleep(7000);
                System.out.println(1 / 0);
                System.out.println("End");
            } catch (Exception e) {
                e.printStackTrace();
                exception.set(e);
                hasException.set(true);
            }
        });
        executor.shutdown();

        while (!executor.isTerminated()) {
            if (hasException.get()) {
                System.out.println("got exception, fail tc");
                Utils.throwException(exception.get());
            }
        }
        throw new RuntimeException(exception.get());
    }
}

class Utils {
    @SuppressWarnings("unchecked")
    private static <T extends Throwable> void throwException(Throwable exception, Object object) throws T {
        throw (T) exception;
    }

    public static void throwException(Throwable exception) {
        Utils.throwException(exception, null);
    }
}