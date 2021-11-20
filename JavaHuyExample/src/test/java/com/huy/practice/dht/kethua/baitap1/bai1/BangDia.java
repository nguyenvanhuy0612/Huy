package com.huy.practice.dht.kethua.baitap1.bai1;

import java.util.Scanner;

public class BangDia extends SanPham {
    private double doDaiPhat;


    public BangDia() {
    }

    public BangDia(String maSo, String tenSp, double giaBan, double doDaiPhat) {
        super(maSo, tenSp, giaBan);
        this.doDaiPhat = doDaiPhat;
    }

    @Override
    public void nhap(Scanner scanner) {
        System.out.println("Nhap san pham Bang Dia");
        super.nhap(scanner);

        System.out.print("Do dai phat: ");
        this.doDaiPhat = scanner.nextDouble();
        System.out.println("=========================");
    }

    @Override
    public void xuat() {
        System.out.println("Thong tin ve san pham Bang Dia:");
        super.xuat();

        System.out.println("Do dai phat: " + this.doDaiPhat);
        System.out.println("=========================");
    }

    @Override
    public String toString() {
        return super.toString().replace("}", "") +
                ", doDaiPhat=" + doDaiPhat +
                '}';
    }

    public double getDoDaiPhat() {
        return doDaiPhat;
    }

    public void setDoDaiPhat(double doDaiPhat) {
        this.doDaiPhat = doDaiPhat;
    }
}
