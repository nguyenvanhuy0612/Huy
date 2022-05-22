package com.insight.thread.huy_example;

public class Test {

    public static void main(String[] args) {

        DataShared dataShared = new DataShared(10, 5) {
            public int x = 100;

            @Override
            public int sum() {
                x = Math.max(x, 0);
                y = Math.max(y, 0);
                return x + y;
            }
        };

        Thread thread1 = new Thread() {
            @Override
            public void run() {
                System.out.println(Thread.currentThread().getName());
            }
        };
    }
}
