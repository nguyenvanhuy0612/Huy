package com.demo.lib;

import org.testng.*;

public class SuiteListener implements ISuiteListener, ITestListener {
    @Override
    public void onStart(ISuite suite) {
        System.out.println("Entering method: " + Thread.currentThread().getStackTrace()[1].getMethodName());
    }

    @Override
    public void onFinish(ISuite suite) {
        System.out.println("Entering method: " + Thread.currentThread().getStackTrace()[1].getMethodName());
    }

    @Override
    public void onTestStart(ITestResult result) {
        System.out.println("Entering method: " + Thread.currentThread().getStackTrace()[1].getMethodName());
    }

    @Override
    public void onTestSuccess(ITestResult result) {
        System.out.println("Entering method: " + Thread.currentThread().getStackTrace()[1].getMethodName());
    }

    @Override
    public void onTestFailure(ITestResult result) {
        System.out.println("Entering method: " + Thread.currentThread().getStackTrace()[1].getMethodName());
    }

    @Override
    public void onTestSkipped(ITestResult result) {
        System.out.println("Entering method: " + Thread.currentThread().getStackTrace()[1].getMethodName());
    }

    @Override
    public void onTestFailedButWithinSuccessPercentage(ITestResult result) {
        System.out.println("Entering method: " + Thread.currentThread().getStackTrace()[1].getMethodName());
    }

    @Override
    public void onTestFailedWithTimeout(ITestResult result) {
        System.out.println("Entering method: " + Thread.currentThread().getStackTrace()[1].getMethodName());
    }

    @Override
    public void onStart(ITestContext context) {
        System.out.println("Entering method: " + Thread.currentThread().getStackTrace()[1].getMethodName());
    }

    @Override
    public void onFinish(ITestContext context) {
        System.out.println("Entering method: " + Thread.currentThread().getStackTrace()[1].getMethodName());
    }
}
