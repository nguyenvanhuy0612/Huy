package com.practice.dht.giaodien.vidu1;

public interface Hinh {
    // Các phương thức trừu tượng
    double tinhDienTich();

    double tinhChuVi();

    // Phương thức mặc định
    default void hienThi() {
        String s = "Chu vi: %.2f\nDien tich: %.2f";
        s = String.format(s, this.tinhChuVi(), this.tinhDienTich());
        System.out.println(s);
    }

    // Private method
    private String getName(){
        return this.getClass().getSimpleName();
    }
}
