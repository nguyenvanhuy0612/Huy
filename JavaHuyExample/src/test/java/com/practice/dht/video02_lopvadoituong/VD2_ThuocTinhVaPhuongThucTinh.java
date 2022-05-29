package com.practice.dht.video02_lopvadoituong;

public class VD2_ThuocTinhVaPhuongThucTinh {
    public static void main(String[] args) {
        TestVD2 t1 = new TestVD2();
        t1.inc();
        t1.inc();
        TestVD2 t2 = new TestVD2();
        t2.inc();
        System.out.println(TestVD2.getN());
    }
}
class TestVD2 {
    private static int n;
    public TestVD2() {
        n = 3;
    }
    public void inc() {
        n++;
    }

    public static int getN() {
        return n;
    }
}