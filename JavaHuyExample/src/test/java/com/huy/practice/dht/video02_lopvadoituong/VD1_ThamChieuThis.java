package com.huy.practice.dht.video02_lopvadoituong;

public class VD1_ThamChieuThis {
    public static void main(String[] args) {
        AVD1 a1 = new AVD1();
        AVD1 a2 = new AVD1(3);
        System.out.println(a1.getX());
        System.out.println(a2.getX());
    }
}
class AVD1 {
    private int x;
    public AVD1(int v) {
        this.x += v;
    }
    public AVD1() {
        this(2);
    }
    public int getX() {
        return x;
    }
}