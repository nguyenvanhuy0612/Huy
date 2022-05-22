package com.insight.exception_example;

import org.testng.annotations.Test;

public class Example1 {

    @Test
    public void test2() {
        System.out.println(Thread.currentThread().getStackTrace()[1].getMethodName());
        System.out.println(1 / 0);
    }

    @Test
    public void test() {
        System.out.println(Thread.currentThread().getStackTrace()[1].getMethodName());
        try {
            System.out.println(1 / 0);
        } catch (ArithmeticException e) {
            throw e;
        }
    }

    @Test
    public void test3() {
        System.out.println(Thread.currentThread().getStackTrace()[1].getMethodName());
        try {
            System.out.println(1 / 0);
        } catch (ArithmeticException e) {
            throw new ArithmeticException();
        }
    }

    @Test
    public void test4() {
        System.out.println(Thread.currentThread().getStackTrace()[1].getMethodName());
        try {
            System.out.println(1 / 0);
        } catch (ArithmeticException e) {
            e.printStackTrace();
            throw new ArithmeticException();
        }
    }
}
