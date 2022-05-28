package com.insight.thread.huy_example;

import org.testng.annotations.Test;

public class HuyTest {


    static void sleep(int sec) {
        try {
            System.out.println(Thread.currentThread().getName() + " sleep: " + sec + " seconds");
            Thread.sleep(1000L * sec);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void test1() {
        System.out.println("======== MAIN start ========");
        System.out.println(Runtime.getRuntime().availableProcessors());

        sleep(1);
        new Thread(() -> {
            sleep(2);
            System.out.println("==========" + Thread.currentThread().getName() + "===========");
        }).start();


        System.out.println("======== MAIN end ========");
    }


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
