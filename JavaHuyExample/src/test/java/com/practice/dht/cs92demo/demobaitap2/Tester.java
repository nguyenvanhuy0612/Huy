package com.practice.dht.cs92demo.demobaitap2;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Scanner;

public class Tester {
    public static void main(String[] args) throws ParseException {
        SimpleDateFormat f = new SimpleDateFormat("dd/MM/yyyy");
        HocVien h1 = new HocVien("Nguyen Van A", "TP.HCM", f.parse("12/04/1998"));
        HocVien h2 = new HocVien("Tran Thi B", "Binh Duong", f.parse("09/12/1996"));
        HocVien h3 = new HocVien("Vo HCM", "Dong Nai", f.parse("11/11/1999"));

        QuanLyHocVien ql = new QuanLyHocVien();

        ql.themHocVien(h1);
        ql.themHocVien(h2);
        ql.themHocVien(h3);

//        ql.hienThiDs();
//
//        System.out.println("======= TÌM KIẾM THEO MÃ HỌC VIÊN ======");
//        HocVien k = ql.timKiem(2);
//        k.hienThi();
//
//        System.out.println("======= TÌM KIẾM THEO TỪ KHÓA ======");
//        ArrayList<HocVien> k2 = ql.timKiem("hcm");
//
//        k2.forEach(HocVien::hienThi);
//
//        System.out.println("======= SẮP XẾP ======");
//
//        ql.sapXep();
//
//        ql.hienThiDs();
//
//        System.out.println("======= SẮP XẾP NGHỊCH ======");
//
//        ql.sapXepNghich();
//
//        ql.hienThiDs();
//
//        ql.sapXep();

        System.out.println("======= NHẬP ĐIỂM ======");
        Scanner scanner = new Scanner(System.in);
        ql.nhapDiemDs(scanner);
        ql.sapXepTheoDiemTrungBinh();

        System.out.println("======= SẮP XẾP THEO ĐIỂM TRUNG BÌNH ======");
        ql.hienThiDs();

        System.out.println("======= XÉT HỌC BỔNG ======");
        ql.xetHocBong().forEach(HocVien::hienThi);

    }
}
