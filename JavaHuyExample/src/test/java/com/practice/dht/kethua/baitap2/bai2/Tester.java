package com.practice.dht.kethua.baitap2.bai2;

import java.util.Arrays;

public class Tester {

    public static void test1() {
        NhanVien n1 = new NhanVienA("Nhan vien A1");
        NhanVien n2 = new NhanVienD("Nhan vien D1", 100);
        NhanVien n3 = new NhanVienA("Nhan vien 3");


//        System.out.println(n1);
//        System.out.println(n2);
//        System.out.println(n3);

        System.out.println("========= QUAN LY NHAN VIEN ==========");

        QuanLyNhanVien ql = new QuanLyNhanVien();

        //ql.themNhanVien(Arrays.asList(new NhanVien[] {n1, n2, n3}));
        ql.themNhanVien(Arrays.asList(n1, n2, n3));

        System.out.println(ql);


    }

    public static void test2() {

    }

    public static void main(String[] args) {
        Tester.test1();

    }
}
