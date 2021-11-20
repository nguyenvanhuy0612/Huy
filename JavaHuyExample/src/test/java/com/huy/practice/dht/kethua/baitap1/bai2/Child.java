package com.huy.practice.dht.kethua.baitap1.bai2;

import org.testng.annotations.Test;

public class Child extends Base {
    public static int s1 = 2;

    public static void print() {
        System.out.println("Child - print");
    }

    @Test
    public void test1() {
        System.out.println(s1);
        print();
    }
}
