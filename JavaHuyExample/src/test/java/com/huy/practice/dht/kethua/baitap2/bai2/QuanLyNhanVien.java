package com.huy.practice.dht.kethua.baitap2.bai2;

import java.util.ArrayList;
import java.util.List;

public class QuanLyNhanVien {
    private List<NhanVien> ds = new ArrayList<>();

    public QuanLyNhanVien() {
    }

    public QuanLyNhanVien(ArrayList<NhanVien> ds) {
        this.ds = ds;
    }

    public void themNhanVien(NhanVien nhanVien) {
        this.ds.add(nhanVien);
    }

    public void themNhanVien(List<NhanVien> dsNv) {
        this.ds.addAll(dsNv);
    }

    @Override
    public String toString() {
        StringBuilder s = new StringBuilder();
        this.ds.forEach(n -> {
            s.append(n.toString()).append("\n");
        });
//        for (NhanVien n : this.ds) {
//            s.append(n.toString()).append("\n");
//        }
        return s.toString();
    }

    public List<NhanVien> getDs() {
        return ds;
    }

    public void setDs(ArrayList<NhanVien> ds) {
        this.ds = ds;
    }
}
