package com.practice.dht.cs92demo.demobaitap2;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Scanner;
import java.util.stream.Collectors;

public class QuanLyHocVien {
    private ArrayList<HocVien> ds = new ArrayList<>();

    public void themHocVien(HocVien hocVien) {
        this.ds.add(hocVien);
    }

    public void themHocVien(Scanner scanner) throws ParseException {
        System.out.println("Them hoc vien vao danh sach");
        HocVien h = new HocVien();
        h.nhapHocVien(scanner);
        this.ds.add(h);
    }

    public void hienThiDs() {
        this.ds.forEach((HocVien h) -> {
            h.hienThi();
            System.out.println("=====================");
        });
        //this.ds.forEach(HocVien::hienThi);
    }

    public ArrayList<HocVien> timKiem(String kw) {
        kw = kw.toLowerCase();
        ArrayList<HocVien> qk = new ArrayList<>();
        for (HocVien h : this.ds) {
            if (h.getHoTen().toLowerCase().contains(kw) ||
                    h.getQueQuan().toLowerCase().contains(kw)) {
                qk.add(h);
            }
        }
        return qk;
    }

    /**
     * @param maSo
     * @return
     */
    public HocVien timKiem(int maSo) {
        for (HocVien h : this.ds) {
            if (h.getMaSo() == maSo) {
                return h;
            }
        }
        return null;
    }

    public void sapXepTheoDiemTrungBinh() {
        this.ds.sort((HocVien h1, HocVien h2) -> {
            double tb1 = h1.tinhTrungBinh();
            double tb2 = h2.tinhTrungBinh();
            return -1 * Double.compare(tb1, tb2);
            //return tb1 > tb2 ? 1 : (tb1 < tb2 ? -1 : 0);
        });
    }

    public void sapXep() {
        this.ds.sort(Comparator.comparingInt(HocVien::getMaSo));
    }

    public void sapXepNghich() {
        this.ds.sort((HocVien h1, HocVien h2) -> h2.getMaSo() - h1.getMaSo());
    }

    public void nhapDs(Scanner scanner) {

    }

    public void nhapDiemDs(Scanner scanner) {
        this.ds.forEach((HocVien h) -> {
            System.out.printf("Nhập điểm cho học sinh \"%s\"\n", h.getHoTen().toUpperCase());
            h.nhapDiem(scanner);
        });
//        for (HocVien h : this.ds) {
//            h.nhapDiem(scanner);
//        }
    }

    public ArrayList<HocVien> xetHocBong() {
        return this.ds.stream().filter(HocVien::isHocBong).collect(Collectors.toCollection(ArrayList::new));
    }

    public ArrayList<HocVien> getDs() {
        return ds;
    }

    public void setDs(ArrayList<HocVien> ds) {
        this.ds = ds;
    }
}
