package com.huy.practice.dht.kethua.baitap2.bai1;

public class HinhVuong extends HinhChuNhat {

    public HinhVuong() {
    }

    public HinhVuong(double canh) {
        super(canh, canh);
    }

    @Override
    public String showInfo(){
        return "canh=" + this.chieuDai;
    }

//    @Override
//    public String toString() {
//        return super.toString();
//    }
}
