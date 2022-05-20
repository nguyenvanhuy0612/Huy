package com.insight.thread.example;

public class Common {

    public static void sleep(long miliSec) {
        try {
            Thread.sleep(miliSec);
        } catch (InterruptedException e) {
        }
    }

}
