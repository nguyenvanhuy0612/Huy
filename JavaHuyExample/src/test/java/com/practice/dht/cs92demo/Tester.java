package com.practice.dht.cs92demo;

public class Tester {
    public static void main(String[] args) throws Exception {
        Diem d1 = new Diem(2, 4);
        Diem d2 = new Diem(5, -1);
        d1.hienThi();
        double kc = d1.tinhKhoangCach(d2);
        System.out.printf("Khoang cach d1 va d2 la: %f\n", kc);

        DoanThang dt1 = new DoanThang(d1, d2);

        dt1.hienThi();
        System.out.printf("Do dai la: %f\n", dt1.tinhDoDai());

        dt1.timTrungDiem().hienThi();



        Diem trenTrai = new Diem(11, 33);
        Diem duoiPhai = new Diem(55, 22);
        HinhChuNhat hinhChuNhat = new HinhChuNhat(trenTrai, duoiPhai);

        hinhChuNhat.hienThi();
        System.out.println("Dien tich hinh chu nhat = " + hinhChuNhat.tinhDienTich());

    }
}
