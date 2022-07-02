package com.insight.handle_randompopup;

public class Common {

    public static void sleep(long sec) {
        System.out.println("Entering method sleep with " + sec + " second");
        try {
            Thread.sleep(sec * 1000);
        } catch (InterruptedException e) {
            System.out.println("Sleep exception");
        }
    }

}
