package com.insight.thread.goki_soft.exercise1;

public class Thread2 extends Thread {
    private BaseData baseData;

    public Thread2(BaseData baseData) {
        this.baseData = baseData;
    }

    @Override
    public void run() {
        while (baseData.isAvailable()) {
            int rad = baseData.getRad();
            if (rad % 3 == 0) {
                rad *= rad;
                System.out.println(Thread.currentThread().getName() + " >> " + rad);
            }
            //
        }
    }
}
