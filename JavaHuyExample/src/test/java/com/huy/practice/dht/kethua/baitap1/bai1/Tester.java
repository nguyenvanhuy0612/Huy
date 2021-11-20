package com.huy.practice.dht.kethua.baitap1.bai1;


import java.util.Scanner;

public class Tester {

    //@Test
    public void test1() {
        System.out.println(this.getClass().getName());
    }

    //@Test
    public void test2() {
        String a = "";
        String b = "String";
        String c = a.equals("") ? b : a;
        System.out.println(c);
    }

    //@Test
    public static void test3() {
        Scanner scanner = new Scanner(System.in);
        SanPham s1 = new Sach("1", "sach", 120, 300);
        //s1.nhap(scanner);
        //s1.xuat();

        System.out.println(s1);
        int s1Hash = s1.hashCode();
        ((Sach) s1).forSachTestSetTrang(100);

        System.out.println();

        Sach sach = (Sach) s1;
        sach.forSachOnly();
        int sachHash = sach.hashCode();
        sach.forSachTestSetTrang(200);
        System.out.println();

//        scanner.nextLine();
//
//        SanPham s2 = new BangDia();
//        s2.nhap(scanner);
//        s2.xuat();
//
//        QuanLySanPham ql = new QuanLySanPham();
//        ql.themSp(s1);
//        ql.themSp(s2);
//
//        System.out.println("====== SAP XEP GIAM THEO GIA =========");
//        ql.sapXepGiam();
//        ql.xuat();

    }

    public static void test4() {
        SanPham sp1 = new SanPham("sp", "demo", 12);

        SanPham s1 = new Sach("sach tu nhien", "Toan", 120, 300);
        SanPham s2 = new Sach("sach xa hoi", "Van", 150, 400);
        SanPham s3 = new Sach("sach tu nhien", "Hoa", 70, 90);

        SanPham b1 = new BangDia("ca nhac", "Nhac thieu nhi", 100, 45);
        SanPham b2 = new BangDia("nhac tre", "Nhac tre", 50, 45.5);
        SanPham b3 = new BangDia("ca nhac", "hit 100", 70, 66);


        SanPham v1 = new VanPhongPham("sach", "sach van", 70, "viet");

        System.out.println(sp1);

        System.out.println(s1);

        System.out.println(b1);

        System.out.println(v1);


        System.out.println();

        Sach ss1 = (Sach) s1;

        boolean isEqualS1S2 = s1.equals(s2);
        boolean isEqualS1S3 = s1.equals(s3);
        boolean isEqualS2S3 = s2.equals(s3);

        System.out.println(isEqualS1S2);

        System.out.println(s1);


        System.out.println();

        int hashS1 = s1.hashCode();
        int hashS2 = s2.hashCode();
        int hashS3 = s3.hashCode();

        System.out.println();


        int soTrangS1 = ((Sach) s1).getSoTrang();

        ((Sach) s1).setSoTrang(100);

        System.out.println();

    }

    public static void main(String[] args) {
        test4();
    }
}
