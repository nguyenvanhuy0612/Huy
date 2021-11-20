package com.huy.practice.dht.kethua.baitap1.bai1;

import java.util.Scanner;

public class VanPhongPham extends SanPham{
    private String congDung;

    public VanPhongPham() {
    }

    public VanPhongPham(String maSo, String tenSp, double giaBan, String congDung) {
        super(maSo, tenSp, giaBan);
        this.congDung = congDung;
    }

    @Override
    public void nhap(Scanner scanner) {
        System.out.println("Nhap san pham Van Phong Pham");
        super.nhap(scanner);

        scanner.nextLine();

        System.out.print("Cong dung: ");
        this.congDung = scanner.nextLine();
        System.out.println("=========================");
    }

    @Override
    public void xuat() {
        System.out.println("Thong tin ve san pham Van Phong Pham:");
        super.xuat();

        System.out.println("Do dai phat: " + this.congDung);
        System.out.println("=========================");
    }

    @Override
    public String toString() {
        return super.toString().replace("}", "") +
                ", congDung='" + congDung + '\'' +
                '}';
    }

    public String getCongDung() {
        return congDung;
    }

    public void setCongDung(String congDung) {
        this.congDung = congDung;
    }
}
