package com.practice.testng_demo_full;

import org.testng.Assert;
import org.testng.annotations.Test;

public class Test_Script_Retry {

    int num = 0;

    @Test(retryAnalyzer = RetryAnalyzer.class)
    public void test1() {
        System.out.println("Test1 got failed: " + ++num);
        throw new RuntimeException();
    }

    @Test
    public void test2NoRetryConfigured() {
        System.out.println("Test1 got failed: " + ++num);
        Assert.fail("Make test fail");
    }

}
