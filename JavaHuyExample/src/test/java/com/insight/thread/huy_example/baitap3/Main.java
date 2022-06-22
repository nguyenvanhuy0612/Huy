package com.insight.thread.huy_example.baitap3;

import java.util.Date;

public class Main {

    public static void main(String[] args) {
        MyThread1 t1 = new MyThread1("Thread 1");
        MyThread2 t2 = new MyThread2("Thread 2");
        MyThread1 t3 = new MyThread1("Thread 1(2)");
        t1.start();
        t2.start();
        t3.start();

        new Thread(() -> Table.printTableNonSync("Non Sync Thread 3", 10)).start();
        new Thread(() -> Table.printTableNonSync("Non Sync Thread 4", 10)).start();
        new Thread(() -> Table.printTableNonSync("Non Sync Thread 5", 10)).start();
    }
}

class Table {

    static void printTableNonSync(String name, int n) {
        System.out.println(name + ": " + new Date().toString());
        for (int i = 1; i <= 5; i++) {
            System.out.println(name + ": " + (n * i));
            try {
                Thread.sleep(100);
            } catch (Exception e) {
            }
        }
    }

    synchronized static void printTable(String name, int n) {
        System.out.println(name + ": " + java.time.LocalDateTime.now());
        for (int i = 1; i <= 5; i++) {
            System.out.println(name + ": " + (n * i));
            try {
                Thread.sleep(100);
            } catch (Exception e) {
            }
        }
    }
}

class MyThread1 extends Thread {
    private String name;
    public MyThread1(String name) {
        this.name = name;
    }
    public void run() {
        Table.printTable(name, 1);
    }
}

class MyThread2 extends Thread {
    private String name;
    public MyThread2(String name) {
        this.name = name;
    }

    public void run() {
        Table.printTable(name, 10);
    }
}