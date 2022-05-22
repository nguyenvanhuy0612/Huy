package com.insight.thread.goki_soft;

public class SharedData {
    public int rad = 0;
    public int x = 0;

    public synchronized void add(int plus) {
        x += plus;
        System.out.println("x= " + x);
        for (int i = 0; i < x; i++) {
            System.out.println("i = " + i);
        }
    }
}
