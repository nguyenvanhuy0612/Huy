package com.huy.practice.dht.cs92demo;

public class HinhChuNhat {
    private Diem trenTrai;
    private Diem duoiPhai;

    /**
     * constructor
     *
     * @param trenTrai
     * @param duoiPhai
     * @throws Exception
     */
    public HinhChuNhat(Diem trenTrai, Diem duoiPhai) throws Exception {
        if (trenTrai.getHoanhDo() < duoiPhai.getHoanhDo() && trenTrai.getTungDo() > duoiPhai.getTungDo()) {
            this.trenTrai = trenTrai;
            this.duoiPhai = duoiPhai;
        } else {
            throw new Exception("Nhap sai");
        }
    }

    /**
     * tinh dien tich hinh chu nhat
     *
     * @return
     */
    public double tinhDienTich() {
        double chieuDai = this.duoiPhai.getHoanhDo() - this.trenTrai.getHoanhDo();
        double chieuRong = this.trenTrai.getTungDo() - this.duoiPhai.getTungDo();
        return chieuDai * chieuRong;
    }

    /**
     * hien thi hinh chu nhat tren console
     */
    public void hienThi() {
        System.out.printf("(%.1f, %.1f)------------\n", this.trenTrai.getHoanhDo(), this.trenTrai.getTungDo());
        System.out.println("|                     |");
        System.out.println("|                     |");
        System.out.printf("------------(%.1f, %.1f)\n", this.duoiPhai.getHoanhDo(), this.duoiPhai.getTungDo());
    }

    public Diem getTrenTrai() {
        return trenTrai;
    }

    public void setTrenTrai(Diem trenTrai) {
        this.trenTrai = trenTrai;
    }

    public Diem getDuoiPhai() {
        return duoiPhai;
    }

    public void setDuoiPhai(Diem duoiPhai) {
        this.duoiPhai = duoiPhai;
    }
}
