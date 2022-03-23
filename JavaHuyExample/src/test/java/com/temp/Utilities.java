package com.temp;

public class Utilities {

    public static Pages p1;
    public static Pages p2;
    public static Pages p3;

    public static void wait(int secs) {
        try {
            Thread.sleep(secs * 1000L);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
