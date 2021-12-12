package com.temp;

public class Utilities {

    public static void wait(int secs) {
        try {
            Thread.sleep(secs * 1000L);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
