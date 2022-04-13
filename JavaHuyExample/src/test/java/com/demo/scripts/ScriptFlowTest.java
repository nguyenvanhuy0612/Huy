package com.demo.scripts;

import org.testng.annotations.Test;

public class ScriptFlowTest extends Base {
    @Override
    public void performBeforeSuiteOperation() {
        System.out.println("Entering method: " + Thread.currentThread().getStackTrace()[1].getMethodName());
    }

    @Override
    public void performBeforeTestOperation() {
        System.out.println("Entering method: " + Thread.currentThread().getStackTrace()[1].getMethodName());
    }

    @Override
    public void performBeforeClassOperation() {
        System.out.println("Entering method: " + Thread.currentThread().getStackTrace()[1].getMethodName());
    }

    @Override
    public void performBeforeMethodOperation() {
        System.out.println("Entering method: " + Thread.currentThread().getStackTrace()[1].getMethodName());
    }

    @Override
    public void performAfterMethodOperation() {
        System.out.println("Entering method: " + Thread.currentThread().getStackTrace()[1].getMethodName());
    }

    @Override
    public void performAfterClassOperation() {
        System.out.println("Entering method: " + Thread.currentThread().getStackTrace()[1].getMethodName());
    }

    @Override
    public void performAfterTestOperation() {
        System.out.println("Entering method: " + Thread.currentThread().getStackTrace()[1].getMethodName());
    }

    @Override
    public void performAfterSuiteOperation() {
        System.out.println("Entering method: " + Thread.currentThread().getStackTrace()[1].getMethodName());
    }

    @Test
    public void test1() {
        System.out.println("Entering method: " + Thread.currentThread().getStackTrace()[1].getMethodName());
    }
    @Test
    public void test2() {
        System.out.println("Entering method: " + Thread.currentThread().getStackTrace()[1].getMethodName());
    }
}
