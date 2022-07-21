package com.practice.testng_demo2;

public class TruongVoKy {
    private final String phai = "Minh Giao";

    @PerformIt
    public void cuuDuongThanCong() {
        System.out.printf("%s perform %s\n", this.getClass().getSimpleName(), Thread.currentThread().getStackTrace()[1].getMethodName());
        Utils.wait(3);
    }

    @PerformIt
    public void canKhonDaiNaDi() {
        System.out.printf("%s perform %s\n", this.getClass().getSimpleName(), Thread.currentThread().getStackTrace()[1].getMethodName());
        Utils.wait(3);
    }

    @PerformIt
    public void thaiCucQuyen() {
        System.out.printf("%s perform %s\n", this.getClass().getSimpleName(), Thread.currentThread().getStackTrace()[1].getMethodName());
        Utils.wait(3);
    }

    @PerformIt
    public void thaiCucKiem() {
        System.out.printf("%s perform %s\n", this.getClass().getSimpleName(), Thread.currentThread().getStackTrace()[1].getMethodName());
        Utils.wait(3);
    }

    public void throwException() {
        System.out.printf("%s perform %s\n", this.getClass().getSimpleName(), Thread.currentThread().getStackTrace()[1].getMethodName());
        Utils.wait(3);
        throw new RuntimeException("example exception");
    }

}
