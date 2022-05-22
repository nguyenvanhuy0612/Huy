package com.insight.thread.example;

import org.testng.annotations.Test;

public class Example4 extends Base {

    @Test
    public void test1() {
        System.out.println("==========START TEST==========");
        this.step1();
        this.step2();
        executor.shutdown();

        for (int i = 0; i < 5; i++) {
            System.out.println(Thread.currentThread().getName() + " MAIN 2-" +i);
            try {
                Thread.sleep(100);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }

        while (!executor.isTerminated()){}

        System.out.println("==========END TEST==========");
    }
}
