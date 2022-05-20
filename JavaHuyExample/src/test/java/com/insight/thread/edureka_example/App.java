package com.insight.thread.edureka_example;

class Print {

    public void notSyncMethod() {
        for (int i = 0; i < 10; i++) {
            System.out.println(Thread.currentThread().getStackTrace()[1].getMethodName() + " " + i);
            sleep(200);
        }
    }

    public synchronized void printer(int numOfCopies, String name) {
        for (int i = 0; i < numOfCopies; i++) {
            System.out.println(name + " running on " + Thread.currentThread().getName() + ", num - " + i);
            sleep(200);
        }
    }

    private void sleep(double miliSec) {
        try {
            Thread.sleep((long) miliSec);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}


public class App {


    public static void main(String[] args) {

        System.out.println("=== Application started ===");
        Print printObj = new Print();

        Thread t1 = new Thread(() -> {
            synchronized (printObj) {
                printObj.printer(10, "@@ Printer 1");
            }
        });

        Thread t2 = new Thread(() -> {
            printObj.printer(10, "## Printer 2");
        });


        t1.start();
        t2.start();


        System.out.println("=== Application finished ===");


    }


}
