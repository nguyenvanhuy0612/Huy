package com.practice.testng_demo_full;

import org.testng.IRetryAnalyzer;
import org.testng.ITestResult;

public class RetryAnalyzer implements IRetryAnalyzer {

    public static int retryLimit = 2;
    public int counter = 0;

    @Override
    public boolean retry(ITestResult result) {
        System.out.println("Result: " + result.getStatus());
        if (counter < retryLimit) {
            counter++;
            return true;
        }
        return false;
    }
}
