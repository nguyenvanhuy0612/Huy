package com.practice.dht.kethua.baitap2.bai1;

import java.util.Objects;

public class HinhChuNhat {
    protected double chieuDai;
    protected double chieuRong;

    public HinhChuNhat() {
    }

    public HinhChuNhat(double chieuDai, double chieuRong) {
        this.chieuDai = chieuDai;
        this.chieuRong = chieuRong;
    }

    public double tinhDienTich() {
        return this.chieuDai * this.chieuRong;
    }

    public double tinhChuVi() {
        return 2 * (this.chieuDai + this.chieuRong);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        HinhChuNhat hcn = (HinhChuNhat) o;
        return Double.compare(hcn.chieuDai, chieuDai) == 0 && Double.compare(hcn.chieuRong, chieuRong) == 0;
    }

    @Override
    public int hashCode() {
        return Objects.hash(chieuDai, chieuRong);
    }

    public String showInfo() {
        return "chieuDai=" + chieuDai + ", chieuRong=" + chieuRong;
    }

    @Override
    public String toString() {
        return this.getClass().getSimpleName() + "{" +
                showInfo() +
                ", dienTich=" + this.tinhDienTich() +
                ", chuVi=" + this.tinhChuVi() +
                '}';
    }

    public double getChieuDai() {
        return chieuDai;
    }

    public void setChieuDai(double chieuDai) {
        this.chieuDai = chieuDai;
    }

    public double getChieuRong() {
        return chieuRong;
    }

    public void setChieuRong(double chieuRong) {
        this.chieuRong = chieuRong;
    }
}
