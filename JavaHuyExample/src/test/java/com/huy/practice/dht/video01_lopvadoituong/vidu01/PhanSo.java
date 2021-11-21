package com.huy.practice.dht.video01_lopvadoituong.vidu01;

public class PhanSo {
    private static int dem = 0;
    private int tuSo;
    private int mauSo;

    {
        dem++;
    }

    /**
     * Phuong thuc khoi tao khong tham so, tu=0, mau=1
     */
    public PhanSo() {
        this(0, 1);
//        this.tuSo = 0;
//        this.mauSo = 1;
    }

    public PhanSo(int t) {
        this(t, 1);
//        this.tuSo = t;
//        this.mauSo = 1;
    }

    /**
     * Phuong thuc khoi tao 2 tham so
     *
     * @param t : tuso
     * @param m : mauso
     */
    public PhanSo(int t, int m) {
        this.tuSo = t;
        this.mauSo = m;
    }

    public void hienThi() {
        System.out.printf("%d/%d", tuSo, mauSo);
    }

    public void rutGon() {
        int a = PhanSo.ucln(this.tuSo, this.mauSo);
        this.tuSo /= a;
        this.mauSo /=a;
    }

    public static int ucln(int a, int b) {
        while (a != b) {
            if (a > b)
                a -= b;
            else
                b -= a;
        }
        return a;
    }

    public PhanSo cong(PhanSo q) {
        int t = this.tuSo * q.mauSo + this.mauSo * q.tuSo;
        int m = this.mauSo * q.mauSo;
        return new PhanSo(t, m);
    }

    public static int getDem() {
        return dem;
    }

    public int getTuSo() {
        return tuSo;
    }

    public int getMauSo() {
        return mauSo;
    }

    public void setTuSo(int t) {
        this.tuSo = t;
    }

    public void setMauSo(int mauSo) {
        this.mauSo = mauSo;
    }
}
