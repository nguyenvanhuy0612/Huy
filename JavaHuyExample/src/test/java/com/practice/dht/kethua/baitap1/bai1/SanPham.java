package com.practice.dht.kethua.baitap1.bai1;

import java.util.Objects;
import java.util.Scanner;

public class SanPham {
    private String maSo;
    private String tenSp;
    private double giaBan;

    public SanPham() {
    }

    public SanPham(String maSo, String tenSp, double giaBan) {
        this.maSo = maSo;
        this.tenSp = tenSp;
        this.giaBan = giaBan;
    }

    public void nhap(Scanner scanner) {
        System.out.print("Ma san pham: ");
        this.maSo = scanner.nextLine();
        System.out.print("Ten san pham: ");
        this.tenSp = scanner.nextLine();
        System.out.print("Gia san pham: ");
        this.giaBan = scanner.nextDouble();
    }

    public void xuat() {
        System.out.println("Ma san pham: " + this.maSo);
        System.out.println("Ten san pham: " + this.tenSp);
        System.out.println("Gia san pham: " + this.giaBan);
    }

    @Override
    public String toString() {
        return this.getClass().getSimpleName() + "{" +
                "maSo='" + maSo + '\'' +
                ", tenSp='" + tenSp + '\'' +
                ", giaBan=" + giaBan +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        SanPham sanPham = (SanPham) o;
        //return Double.compare(sanPham.giaBan, giaBan) == 0 && maSo.equals(sanPham.maSo) && tenSp.equals(sanPham.tenSp);
        return this.maSo.equals(sanPham.maSo);
    }

    @Override
    public int hashCode() {
        return Objects.hash(maSo);
    }

    //Setter + getter
    public String getMaSo() {
        return maSo;
    }

    public void setMaSo(String maSo) {
        this.maSo = maSo;
    }

    public String getTenSp() {
        return tenSp;
    }

    public void setTenSp(String tenSp) {
        this.tenSp = tenSp;
    }

    public double getGiaBan() {
        return giaBan;
    }

    public void setGiaBan(double giaBan) {
        this.giaBan = giaBan;
    }
}
