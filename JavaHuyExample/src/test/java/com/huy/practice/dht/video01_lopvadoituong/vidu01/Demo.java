package com.huy.practice.dht.video01_lopvadoituong.vidu01;

public class Demo {
    public static void main(String[] args) {
        PhanSo p = new PhanSo();
        p.hienThi();
        System.out.println();
        PhanSo q = new PhanSo(5);
        q.hienThi();
        System.out.println();
        PhanSo r = new PhanSo(2, 3);
        r.hienThi();
        System.out.println();
        q.cong(r).hienThi();
    }
}
