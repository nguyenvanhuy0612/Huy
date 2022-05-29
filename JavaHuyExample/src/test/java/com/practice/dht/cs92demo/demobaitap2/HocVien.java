package com.practice.dht.cs92demo.demobaitap2;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;
import java.util.stream.DoubleStream;

public class HocVien {
    private final int SO_MON_HOC = 3;
    private int maSo = ++dem;
    private String hoTen;
    private Date ngaySinh;
    private String queQuan;
    private double[] diem;
    private static int dem = 0;

    /**
     * Constructor
     *
     * @param hoTen
     * @param ngaySinh
     * @param queQuan
     */
    public HocVien(String hoTen, String queQuan, Date ngaySinh) {
        this.hoTen = hoTen;
        this.queQuan = queQuan;
        this.ngaySinh = ngaySinh;
        this.diem = null;
    }

    public HocVien() {

    }


    /**
     * Hien thi
     */
    public void hienThi() {
        SimpleDateFormat f = new SimpleDateFormat("dd/MM/yyyy");
        System.out.printf("Mã học viên: %d\n", this.maSo);
        System.out.printf("Họ tên: %s\n", this.hoTen);
        System.out.printf("Quê quán: %s\n", this.queQuan);
        System.out.printf("Ngày sinh: %s\n", f.format(this.ngaySinh));

        if (this.diem != null) {
            System.out.println("Điểm các môn học: ");
            for (double d : this.diem) {
                System.out.printf("%.2f\t", d);
            }
            System.out.printf("\nĐiểm trung bình là: %.2f\n", this.tinhTrungBinh());
        }
    }

    public double tinhTrungBinh() {
        return DoubleStream.of(this.diem).average().getAsDouble();
    }

    public void nhapHocVien(Scanner scanner) throws ParseException {
        SimpleDateFormat f = new SimpleDateFormat("dd/MM/yyyy");
        System.out.println("Nhap ho ten: ");
        this.hoTen = scanner.nextLine();
        System.out.println("Nhap que quan: ");
        this.queQuan = scanner.nextLine();
        System.out.println("Nhap ngay sinh (dd/MM/yyyy): ");
        this.ngaySinh = f.parse(scanner.nextLine());
    }

    public void nhapDiem(Scanner scanner) {
        this.diem = new double[SO_MON_HOC];
        for (int i = 0; i < SO_MON_HOC; i++) {
            System.out.printf("Nhập điểm môn thứ %d: ", i + 1);
            double d = scanner.nextDouble();
            while (0 > d || d > 10) {
                System.out.printf("Nhập sai, nhập lại điểm môn thứ %d: ", i + 1);
                d = scanner.nextDouble();
            }
            this.diem[i] = d;
        }
    }

    public boolean isHocBong() {
        for (double d : this.diem) {
            if (d < 5)
                return false;
        }
        return this.tinhTrungBinh() >= 8;
    }

    public int getMaSo() {
        return maSo;
    }

    private void setMaSo(int maSo) {
        this.maSo = maSo;
    }

    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public Date getNgaySinh() {
        return ngaySinh;
    }

    public void setNgaySinh(Date ngaySinh) {
        this.ngaySinh = ngaySinh;
    }

    public String getQueQuan() {
        return queQuan;
    }

    public void setQueQuan(String queQuan) {
        this.queQuan = queQuan;
    }

    public double[] getDiem() {
        return diem;
    }

    public void setDiem(double[] diem) {
        this.diem = diem;
    }

    public static int getDem() {
        return dem;
    }

    public static void setDem(int dem) {
        HocVien.dem = dem;
    }
}
