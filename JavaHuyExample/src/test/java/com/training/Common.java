package com.training;

public class Common {

    public static void waitSec(long sec) {
        try {
            Thread.sleep(sec * 1000);
        } catch (InterruptedException e) {
            System.out.println("Cannot sleep current thread");
        }
    }
}
