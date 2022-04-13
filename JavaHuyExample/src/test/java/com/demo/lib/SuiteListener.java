package com.demo.lib;

import org.testng.*;

public class SuiteListener implements ISuiteListener, ITestListener {
    @Override
    public void onStart(ISuite suite) {
        System.out.println("Entering method: onStart(ISuite suite)");
    }

    @Override
    public void onFinish(ISuite suite) {
        System.out.println("Entering method: onFinish(ISuite suite)");
    }

    @Override
    public void onTestStart(ITestResult result) {
        System.out.println("Entering method: onTestStart(ITestResult result)");
    }

    @Override
    public void onTestSuccess(ITestResult result) {
        System.out.println("Entering method: onTestSuccess(ITestResult result)");
    }

    @Override
    public void onTestFailure(ITestResult result) {
        System.out.println("Entering method: onTestFailure(ITestResult result)");
    }

    @Override
    public void onTestSkipped(ITestResult result) {
        System.out.println("Entering method: onTestSkipped(ITestResult result)");
    }

    @Override
    public void onTestFailedButWithinSuccessPercentage(ITestResult result) {
        System.out.println("Entering method: onTestFailedButWithinSuccessPercentage(ITestResult result)");
    }

    @Override
    public void onTestFailedWithTimeout(ITestResult result) {
        System.out.println("Entering method: onTestFailedWithTimeout(ITestResult result)");
    }

    @Override
    public void onStart(ITestContext context) {
        System.out.println("Entering method: onStart(ITestContext context)");
    }

    @Override
    public void onFinish(ITestContext context) {
        System.out.println("Entering method: onFinish(ITestContext context)");
    }
}
