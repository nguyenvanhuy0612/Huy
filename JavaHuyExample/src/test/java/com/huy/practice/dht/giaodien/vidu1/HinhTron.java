package com.huy.practice.dht.giaodien.vidu1;

public class HinhTron implements Hinh {
    private double banKinh;

    public HinhTron() {
        this(0);
    }

    public HinhTron(double banKinh) {
        this.banKinh = banKinh;
    }

    @Override
    public double tinhDienTich() {
        return Math.PI * Math.pow(this.banKinh, 2);
    }

    @Override
    public double tinhChuVi() {
        return 2 * Math.PI * this.banKinh;
    }

    @Override
    public String toString() {
        return String.format(this.getClass().getSimpleName() + "{banKinh=%.2f, ChuVi=%.2f, DienTich=%.2f}",
                this.banKinh, this.tinhChuVi(), this.tinhDienTich());
    }

    public double getBanKinh() {
        return banKinh;
    }

    public void setBanKinh(double banKinh) {
        this.banKinh = banKinh;
    }
}
