package com.insight.thread.goki_soft;

public class Common {

    public static void sleep(int sec){
        try {
            System.out.println("wait = " + sec + " sec(s)");
            Thread.sleep(sec * 1000L);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
