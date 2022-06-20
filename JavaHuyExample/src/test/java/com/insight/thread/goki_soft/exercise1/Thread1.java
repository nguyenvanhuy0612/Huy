package com.insight.thread.goki_soft.exercise1;

import java.util.Random;

public class Thread1 extends Thread {
    private BaseData baseData;

    public Thread1(BaseData baseData) {
        this.baseData = baseData;
    }

    @Override
    public void run() {
        Random random = new Random();
        while (baseData.isAvailable()) {
            int rad = random.nextInt(100) + 1;
            baseData.setRad(rad);
            baseData.add(rad);
            System.out.println(Thread.currentThread().getName() + " >> " + rad);
            // sync

        }

    }
}
