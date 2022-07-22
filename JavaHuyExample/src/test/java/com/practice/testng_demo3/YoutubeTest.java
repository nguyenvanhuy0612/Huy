package com.practice.testng_demo3;

@HuyListener(HuyListenerClass.class)
public class YoutubeTest {

    @PerformIt
    public void verifySearch() {
        System.out.printf("%s perform %s\n", this.getClass().getSimpleName(), Thread.currentThread().getStackTrace()[1].getMethodName());
        Utils.wait(3);
    }

    @PerformIt
    public void verifyAds() {
        System.out.printf("%s perform %s\n", this.getClass().getSimpleName(), Thread.currentThread().getStackTrace()[1].getMethodName());
        Utils.wait(3);
    }

    @PerformIt
    public void seachMusicLoFi() {
        System.out.printf("%s perform %s\n", this.getClass().getSimpleName(), Thread.currentThread().getStackTrace()[1].getMethodName());
        Utils.wait(3);
    }

    @PerformIt
    public void searchMusicHiFi() {
        System.out.printf("%s perform %s\n", this.getClass().getSimpleName(), Thread.currentThread().getStackTrace()[1].getMethodName());
        Utils.wait(3);
    }

    public void throwException() {
        System.out.printf("%s perform %s\n", this.getClass().getSimpleName(), Thread.currentThread().getStackTrace()[1].getMethodName());
        Utils.wait(3);
        throw new RuntimeException("example exception");
    }

}
