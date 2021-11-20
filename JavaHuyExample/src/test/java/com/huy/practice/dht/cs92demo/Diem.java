package com.huy.practice.dht.cs92demo;

public class Diem {
    private double hoangDo;
    private double tungDo;

    /**
     * Constructor
     *
     * @param hoangDo
     * @param tungDo
     */
    public Diem(double hoangDo, double tungDo) {
        this.hoangDo = hoangDo;
        this.tungDo = tungDo;
    }

    /**
     * Tinh khoang cach
     * @param diem
     * @return
     */
    public double tinhKhoangCach(Diem diem){
        return Math.sqrt(Math.pow(this.hoangDo - diem.hoangDo, 2) + Math.pow(this.tungDo - diem.tungDo, 2));
    }

    public void hienThi() {
        System.out.printf("(%.1f, %.1f)\n", this.hoangDo, this.tungDo);
    }

    public double getHoangDo() {
        return hoangDo;
    }

    public void setHoangDo(double hoangDo) {
        this.hoangDo = hoangDo;
    }

    public double getTungDo() {
        return tungDo;
    }

    public void setTungDo(double tungDo) {
        this.tungDo = tungDo;
    }
}
