package com.insight.thread.goki_soft.exercise1;

public class BaseData {
    private int rad;
    private int total;

    public BaseData() {
    }

    public BaseData(int rad, int total) {
        this.rad = rad;
        this.total = total;
    }

    public synchronized void add(int value) {
        total += value;
    }

    public synchronized boolean isAvailable() {
        return total < 200;
    }

    public int getRad() {
        return rad;
    }

    public void setRad(int rad) {
        this.rad = rad;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }
}
