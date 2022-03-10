package com.huy.practice.pomDemo.lib;

public class UtilityFunc {
    public void wait(int timeInSec) {
        try {
            Thread.sleep(timeInSec * 1000L);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
