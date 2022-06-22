package com.insight.thread.huy_example.baitap1;

public class Main {

    public static void main(String[] args) throws InterruptedException{
        Account account = new Account();
        new Thread(() -> account.withdraw(15000)).start();
        Thread.sleep(10000);
        new Thread(() -> account.deposit(10000)).start();
    }
}
