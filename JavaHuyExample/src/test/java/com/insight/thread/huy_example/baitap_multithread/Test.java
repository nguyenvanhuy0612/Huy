package com.insight.thread.huy_example.baitap_multithread;

public class Test {
    public static void main(String[] args) {
        System.out.println((int) 'a');
        System.out.println((int) 'z');
        System.out.println("START MAIN");

        Thread1 thread1 = new Thread1();
        Thread2 thread2 = new Thread2();

        thread1.start();
        thread2.start();

        while (true) {
            if (!thread1.isAlive() && !thread2.isAlive()) {
                break;
            }
        }

        System.out.println("\nPRINT THREAD 1");
        thread1.list.forEach(System.out::print);
        System.out.println("\nPRINT THREAD 2");
        thread2.list.forEach(System.out::print);

        System.out.println("\nEND MAIN");
    }
}
