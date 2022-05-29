package com.practice.dht.kethua.baitap2.bai2;

public class NhanVienD extends NhanVien {
    private double phuCap;

    public NhanVienD() {
    }

    public NhanVienD(String ten, double phuCap) {
        super(ten);
        this.phuCap = phuCap;
    }

    @Override
    public String toString() {
        return super.toString().replaceFirst(".$", "") +
                ", phuCap=" + phuCap +
                '}';
    }

    @Override
    public double tinhLuong(double ngayCong) {
        return super.tinhLuong(ngayCong) + phuCap;
    }
}
