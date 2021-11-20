package com.huy.practice.dht.kethua.baitap2.bai1;

public class Tester {

    public static void test1() {
        HinhChuNhat hcn1 = new HinhChuNhat(12, 4);
        System.out.println(hcn1);
    }

    public static void test2() {
        HinhVuong hv1 = new HinhVuong(5);
        System.out.println(hv1);
    }


    public static void main(String[] args) {
        System.out.println();
        test1();
        test2();
    }
}
