package com.insight.thread.concurrency_multithreading;

public class Env {

    public static int number = 0;

    public static String name = "";

    public static boolean isRun = true;

    public static void wait(int sec){
        try {
            Thread.sleep(sec * 1000L);
        }catch (InterruptedException e){
            e.printStackTrace();
        }
    }


}
