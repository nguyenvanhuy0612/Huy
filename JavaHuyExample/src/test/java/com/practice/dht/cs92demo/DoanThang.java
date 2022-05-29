package com.practice.dht.cs92demo;

public class DoanThang {
    private Diem diemDau;
    private Diem diemCuoi;

    /**
     * constructor
     *
     * @param diemDau
     * @param diemCuoi
     */
    public DoanThang(Diem diemDau, Diem diemCuoi) {
        this.diemDau = diemDau;
        this.diemCuoi = diemCuoi;
    }

    /**
     * hien thi
     */
    public void hienThi() {
        System.out.printf("[(%.1f, %.1f), (%.1f, %.1f)]\n", this.diemDau.getHoanhDo(), this.diemDau.getTungDo(),
                this.diemCuoi.getHoanhDo(), this.diemCuoi.getTungDo());
    }

    public double tinhDoDai() {
        return this.diemDau.tinhKhoangCach(this.diemCuoi);
    }

    /**
     * Trung Diem
     * @return
     */
    public Diem timTrungDiem() {
        double h = (this.diemDau.getHoanhDo() + this.diemCuoi.getHoanhDo()) / 2;
        double t = (this.diemDau.getTungDo() + this.diemCuoi.getTungDo()) / 2;
        return new Diem(h, t);
    }

    public Diem getDiemDau() {
        return diemDau;
    }

    public void setDiemDau(Diem diemDau) {
        this.diemDau = diemDau;
    }

    public Diem getDiemCuoi() {
        return diemCuoi;
    }

    public void setDiemCuoi(Diem diemCuoi) {
        this.diemCuoi = diemCuoi;
    }
}
