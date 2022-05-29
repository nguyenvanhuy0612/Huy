package com.practice.dht.cs92demo;

public class Diem {
    private double hoanhDo;
    private double tungDo;

    /**
     * Constructor
     *
     * @param hoanhDo
     * @param tungDo
     */
    public Diem(double hoanhDo, double tungDo) {
        this.hoanhDo = hoanhDo;
        this.tungDo = tungDo;
    }

    /**
     * Tinh khoang cach
     * @param diem
     * @return
     */
    public double tinhKhoangCach(Diem diem){
        return Math.sqrt(Math.pow(this.hoanhDo - diem.hoanhDo, 2) + Math.pow(this.tungDo - diem.tungDo, 2));
    }

    public void hienThi() {
        System.out.printf("(%.1f, %.1f)\n", this.hoanhDo, this.tungDo);
    }

    public double getHoanhDo() {
        return hoanhDo;
    }

    public void setHoanhDo(double hoanhDo) {
        this.hoanhDo = hoanhDo;
    }

    public double getTungDo() {
        return tungDo;
    }

    public void setTungDo(double tungDo) {
        this.tungDo = tungDo;
    }
}
