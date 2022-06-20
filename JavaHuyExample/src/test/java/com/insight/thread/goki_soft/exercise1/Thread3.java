package com.insight.thread.goki_soft.exercise1;

public class Thread3 extends Thread {
    private BaseData baseData;

    public Thread3(BaseData baseData) {
        this.baseData = baseData;
    }

    @Override
    public void run() {
        while (baseData.isAvailable()) {
            int rad = baseData.getRad();
            if (rad % 2 == 0)
                if (rad % 4 == 0)
                    System.out.println(Thread.currentThread().getName() + " So " + rad + " chia het cho 4");
                else
                    System.out.println(Thread.currentThread().getName() + " So " + rad + " khong chia het cho 4");
            //

        }
    }
}