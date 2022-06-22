package com.insight.thread.huy_example.baitap1;

public class Main {

    public static void main1(String[] args) throws InterruptedException {
        Account account = new Account();
        new Thread(() -> account.withdraw(15000)).start();
        Thread.sleep(5000);
        new Thread(() -> account.deposit(10000)).start();
    }

    public static void main(String[] args) throws InterruptedException{


        Account account2 = new Account();
        new Thread(() -> account2.withdraw2(15000)).start();
        Thread.sleep(5000);
        new Thread(() -> account2.deposit(10000)).start();
        new Thread(() -> account2.deposit(10000)).start();
        new Thread(() -> account2.deposit2(10000)).start();
    }
}
