package com.huy.practice.dht.video02_lopvadoituong;

public class VD3_InitializationBlock {
}
class NhanVienVD3 {
    private static int dem = 1;
    private int mssv;
    private String hoTen;
    {
        mssv = dem;
        dem++;
    }
    public NhanVienVD3(String ht) {
        this.hoTen = ht;
    }

    public static int getDem() {
        return dem;
    }


    public int getMssv() {
        return mssv;
    }

    public void setMssv(int mssv) {
        this.mssv = mssv;
    }

    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }
}
