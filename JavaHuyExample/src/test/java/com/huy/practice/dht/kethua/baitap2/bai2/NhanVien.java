package com.huy.practice.dht.kethua.baitap2.bai2;

import java.util.Objects;

public class NhanVien {
    protected final double LUONG_CO_BAN = 100000;
    protected static int dem;
    protected int maSo = ++dem;
    protected String ten;
    protected double heSoLuong = 1;

//    {
//        maSo = ++dem;
//    }

    static {
        dem = 0;
    }

    public NhanVien() {
    }

    public NhanVien(String ten) {
        this.ten = ten;
    }

    public double tinhLuong(double ngayCong) {
        return heSoLuong * LUONG_CO_BAN * ngayCong;
    }


    @Override
    public String toString() {
        return this.getClass().getSimpleName() + "{" +
                "LUONG_CO_BAN=" + LUONG_CO_BAN +
                ", maSo=" + maSo +
                ", ten='" + ten + '\'' +
                ", heSoLuong=" + heSoLuong +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        NhanVien nhanVien = (NhanVien) o;
        return maSo == nhanVien.maSo;
    }

    @Override
    public int hashCode() {
        return Objects.hash(maSo);
    }

    public int getMaSo() {
        return maSo;
    }

    public void setMaSo(int maSo) {
        this.maSo = maSo;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public double getLUONG_CO_BAN() {
        return LUONG_CO_BAN;
    }

    public static int getDem() {
        return dem;
    }

    public static void setDem(int dem) {
        NhanVien.dem = dem;
    }
}
