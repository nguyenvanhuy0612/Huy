package com.practice.dht.kethua.baitap1.bai1;

import java.util.ArrayList;
import java.util.Comparator;

public class QuanLySanPham {
    private ArrayList<SanPham> sp = new ArrayList<>();

    public void themSp(SanPham s) {
        this.sp.add(s);
    }

    public void xuat() {
        //this.sp.forEach(SanPham::xuat);
        this.sp.forEach(sanPham -> {
            sanPham.xuat();
            //System.out.println("===========================");
        });
    }

    public ArrayList<SanPham> laySpSach() {
        ArrayList<SanPham> kq = new ArrayList<>();
        this.sp.forEach(p -> {
            if (p instanceof Sach) {
                kq.add(p);
            }
        });
        return kq;
    }

    public ArrayList<SanPham> timKiem(String kw) {
        ArrayList<SanPham> kq = new ArrayList<>();
        this.sp.forEach(p -> {
            if (p.getTenSp().toLowerCase().contains(kw.toLowerCase()) ||
                    p.getMaSo().equalsIgnoreCase(kw)) {
                kq.add(p);
            }
        });
        return kq;
    }

    public void sapXep() {
        /*
            this.sp.sort((p1, p2) -> {
            double g1 = p1.getGiaBan();
            double g2 = p2.getGiaBan();
            //return g1 > g2 ? 1 : (g1 < g2 ? -1 : 0);
            return Double.compare(p1.getGiaBan(), p2.getGiaBan());
            });
         */
        this.sp.sort(Comparator.comparingDouble(SanPham::getGiaBan));
    }

    public void sapXepGiam() {
        this.sp.sort((p1, p2) -> {
            //return g1 > g2 ? 1 : (g1 < g2 ? -1 : 0);
            return Double.compare(p2.getGiaBan(), p1.getGiaBan());
        });
    }

    public ArrayList<SanPham> getSp() {
        return sp;
    }

    public void setSp(ArrayList<SanPham> sp) {
        this.sp = sp;
    }
}
