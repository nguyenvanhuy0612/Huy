package com.insight.thread.example;

public class CountDown {

    public void down(int count, String name) {
        for (int i = count; i > 0; i--) {
            System.out.println(name + " === " + i);
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }

}
