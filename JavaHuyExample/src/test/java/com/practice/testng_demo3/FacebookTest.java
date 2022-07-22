package com.practice.testng_demo3;

@HuyListener(HuyListenerClass.class)
public class FacebookTest {

    @PerformIt
    public void verifyLogin() {
        System.out.printf("%s perform %s\n", this.getClass().getSimpleName(), Thread.currentThread().getStackTrace()[1].getMethodName());
        Utils.wait(3);
    }

    @PerformIt
    public void verifyAccounts() {
        System.out.printf("%s perform %s\n", this.getClass().getSimpleName(), Thread.currentThread().getStackTrace()[1].getMethodName());
        Utils.wait(3);
    }

}
