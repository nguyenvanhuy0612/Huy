package com.huy.practice.dht.video01_lopvadoituong.vidu01;

import org.testng.annotations.Test;

public class Demo {

    @Test
    public void test1() {
        PhanSo r = new PhanSo(2, 3);
        PhanSo x = new PhanSo(2, 4);
        x.hienThi();
        System.out.println();
        x.rutGon();
        x.hienThi();
        System.out.println();
        System.out.println(PhanSo.getDem());
    }

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
