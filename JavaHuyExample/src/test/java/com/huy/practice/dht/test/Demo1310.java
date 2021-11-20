package com.huy.practice.dht.test;

import com.huy.practice.dht.cs92demo.PhanSo;

public class Demo1310 {
    public static void main(String[] args) {
        PhanSo p1 = new PhanSo(2, 3);
        PhanSo p2 = new PhanSo(2, 6);

        PhanSo c1 = p1.cong(p2);

        c1.hienThi();

        c1.rutGon().hienThi();

        c1.hienThi();

        //c1.rutGonPhanSo();

        //c1.hienThi();

        System.out.println("Dem = " + PhanSo.getDem());
        System.out.println("tu so " + c1.getTuSo());

    }
}
