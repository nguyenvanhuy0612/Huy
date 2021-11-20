package com.huy.practice.dht.cs92demo;

public class PhanSo {
    private static int dem = 0;
    private int tuSo;
    private int mauSo;

    {
        dem++;
    }

    /**
     * Phan so 2 tham so
     *
     * @param tuSo
     * @param mauSo
     */
    public PhanSo(int tuSo, int mauSo) {
        this.tuSo = tuSo;
        this.mauSo = mauSo;
    }

    /**
     * Phan so 2/3
     */
    public PhanSo() {
        this(2, 3);
    }

    /**
     * Phan so 1 tham so
     *
     * @param tuSo
     */
    public PhanSo(int tuSo) {
        this(tuSo, 1);
    }

    /**
     * Phep cong voi phan so p
     *
     * @param p
     * @return
     */
    public PhanSo cong(PhanSo p) {
        int t = this.tuSo * p.mauSo + this.mauSo * p.tuSo;
        int m = this.mauSo * p.mauSo;
        return new PhanSo(t, m);
    }

    /**
     * Rut gon phan so (rut gon chinh no)
     */
    public void rutGonPhanSo() {
        int u = PhanSo.ucln(this.tuSo, this.mauSo);
        this.tuSo /= u;
        this.mauSo /= u;
    }

    /**
     * Rut gon phan so
     *
     * @return
     */
    public PhanSo rutGon() {
        int u = PhanSo.ucln(this.tuSo, this.mauSo);
        int t = this.tuSo / u;
        int m = this.mauSo / u;
        return new PhanSo(t, m);

    }

    /**
     * Tim Uoc Chung Lon Nhat cua 2 so a va b
     *
     * @param a
     * @param b
     * @return
     */
    public static int ucln(int a, int b) {
        while (a != b)
            if (a > b)
                a -= b;
            else
                b -= a;
        return a;
    }


    public void hienThi() {
        if (this.mauSo == 1)
            System.out.printf("%d\n", this.tuSo);
        else
            System.out.printf("%d/%d\n", this.tuSo, this.mauSo);
    }

    public static int getDem() {
        return dem;
    }

    public static void setDem(int dem) {
        PhanSo.dem = dem;
    }

    public int getTuSo() {
        return tuSo;
    }

    public void setTuSo(int tuSo) {
        this.tuSo = tuSo;
    }

    public int getMauSo() {
        return mauSo;
    }

    public void setMauSo(int mauSo) {
        this.mauSo = mauSo;
    }
}
