package com.huy.practice.dht.kethua.baitap1.bai1;

import java.util.Objects;
import java.util.Scanner;

public class Sach extends SanPham {
    private int soTrang;

    public Sach(String maSo, String tenSp, double giaBan, int soTrang) {
        super(maSo, tenSp, giaBan);
        this.soTrang = soTrang;
    }

    public Sach() {
    }

    @Override
    public void nhap(Scanner scanner) {
        System.out.println("Nhap san pham Sach");
        super.nhap(scanner);

        System.out.print("So Trang: ");
        this.soTrang = scanner.nextInt();
        System.out.println("=========================");
    }

    @Override
    public void xuat() {
        System.out.println("Thong tin ve san pham Sach:");
        super.xuat();

        System.out.println("So trang: " + this.soTrang);
        System.out.println("=========================");
    }

    @Override
    public String toString() {
        return super.toString().replace("}", "") +
                ", soTrang=" + soTrang +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;
        Sach sach = (Sach) o;
        return soTrang == sach.soTrang && super.equals(o);
    }

    @Override
    public int hashCode() {
        return Objects.hash(super.hashCode(), soTrang);
    }

    //FOR TEST ONLY
    public void forSachOnly() {
        System.out.println(this.getClass().getName() + " ---> " + Thread.currentThread().getStackTrace()[1].getMethodName());
        System.out.println("So Trang: " + this.soTrang);
    }

    public void forSachTestSetTrang(int soTrang) {
        this.soTrang = soTrang;
    }

    public int getSoTrang() {
        return soTrang;
    }

    public void setSoTrang(int soTrang) {
        this.soTrang = soTrang;
    }
}
