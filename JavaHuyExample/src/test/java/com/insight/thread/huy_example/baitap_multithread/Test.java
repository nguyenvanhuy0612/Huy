package com.insight.thread.huy_example.baitap_multithread;

import java.util.Date;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class Test {
    public static void main(String[] args) {
        System.out.println((int) 'a');
        System.out.println((int) 'z');
        System.out.println("START MAIN");

        long start1 = new Date().getTime();
        Thread1 thread1 = new Thread1();
        Thread2 thread2 = new Thread2();

        thread1.start();
        thread2.start();

//        while (true) {
//            if (!thread1.isAlive() && !thread2.isAlive()) {
//                break;
//            }
//        }
        boolean isThread1Running = true, isThread2Running = true;
        do {
            if (!thread1.isAlive() && isThread1Running) {
                System.out.println("\nPRINT THREAD 1");
                thread1.list.forEach(System.out::print);
                System.out.println();
                isThread1Running = false;
            }
            if (!thread2.isAlive() && isThread2Running) {
                System.out.println("\nPRINT THREAD 2");
                thread2.list.forEach(System.out::print);
                System.out.println();
                isThread2Running = false;
            }
        } while (thread1.isAlive() || thread2.isAlive());

        long start2 = new Date().getTime();
        System.out.println("Total time: " + (start2 - start1) / 1000);

        System.out.println("\nPRINT THREAD 1");
        thread1.list.forEach(System.out::print);
        System.out.println();
        System.out.println("\nPRINT THREAD 2");
        thread2.list.forEach(System.out::print);
        System.out.println();

        System.out.println("\nEND MAIN");

        System.out.println("NEW SESSION");

        ExecutorService executorService = Executors.newCachedThreadPool();
        long start3 = new Date().getTime();
        executorService.execute(thread1);
        executorService.execute(thread2);
        executorService.shutdown();
        while (!executorService.isTerminated()){}
        long start4 = new Date().getTime();
        System.out.println("Total time: " + (start4 - start3) / 1000);

        System.out.println("\nPRINT THREAD 1");
        thread1.list.forEach(System.out::print);
        System.out.println("\nPRINT THREAD 2");
        thread2.list.forEach(System.out::print);

        System.out.println("\nEND MAIN");
    }
}
