package com.practice.testng_parallel;

public class UtilityFun {

    public static void wait(int secs) {
        try {
            System.out.println(Thread.currentThread().getName() + " - Go to sleep: " + secs);
            Thread.sleep(secs * 1000L);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

}
