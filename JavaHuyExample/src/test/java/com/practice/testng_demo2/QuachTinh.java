package com.practice.testng_demo2;

public class QuachTinh {

    public void cuuAmChanKinh() {
        System.out.printf("%s perform %s\n", this.getClass().getSimpleName(), Thread.currentThread().getStackTrace()[1].getMethodName());
        Utils.wait(3);
    }

    public void hangLongThapBatChuong() {
        System.out.printf("%s perform %s\n", this.getClass().getSimpleName(), Thread.currentThread().getStackTrace()[1].getMethodName());
        Utils.wait(3);
    }

}
