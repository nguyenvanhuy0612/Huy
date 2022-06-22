package com.insight.thread.huy_example.baitap1;

import java.util.Date;

public class Account {

    public int amount = 10000;


    public void print(String message) {
        System.out.println(new Date() + " - " + Thread.currentThread().getName() + ": " + message);
    }

    public synchronized void withdraw(int amount) {
        print("going to withdraw...");
        print("current amount = " + this.amount);
        if (this.amount < amount) {
            print("Less balance, wait for deposit ...");
            try {
                wait();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        this.amount = this.amount - amount;
        print("withdraw completed.");
        print("current amount = " + this.amount);
    }

    public synchronized void withdraw2(int amount) {
        print("going to withdraw...");
        print("current amount = " + this.amount);
        while (this.amount < amount) {
            print("Less balance, wait for deposit ...");
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            try {
                wait();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        this.amount = this.amount - amount;
        print("withdraw completed.");
        print("current amount = " + this.amount);
    }

    public synchronized void deposit(int amount) {
        print("Going to deposit...");
        this.amount += amount;
        print("deposit completed.");
        notify();
    }

    public void deposit2(int amount) {
        //print("Going to deposit...");
        this.amount += amount;
        //print("deposit completed.");
        //notify();
    }

}
