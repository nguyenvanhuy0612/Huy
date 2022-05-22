package com.insight.thread.goki_soft;

public class Thread1 extends Thread {
    public SharedData sharedData;


    public Thread1(SharedData sharedData) {
        this.sharedData = sharedData;
    }


    @Override
    public void run() {
        for (int i = 0; i < 10; i++) {
            synchronized (sharedData) {
                System.out.println(Thread.currentThread().getName() + " i = " + i);
                Common.sleep(1);

                System.out.println(Thread.currentThread().getName() + " i = " + i);
                Common.sleep(1);

                System.out.println(Thread.currentThread().getName() + " i = " + i);
                Common.sleep(1);

                System.out.println(Thread.currentThread().getName() + " notifyAll");
                sharedData.notifyAll();

                try {
                    System.out.println(Thread.currentThread().getName() + " wait");
                    sharedData.wait();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }

            }
        }
    }
}
