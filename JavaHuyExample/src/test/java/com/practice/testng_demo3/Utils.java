package com.practice.testng_demo3;

public class Utils {

    public static void wait(int sec) {
        try {
            Thread.sleep(sec * 1000L);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
