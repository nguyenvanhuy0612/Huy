package com.practice.junit_demo;

import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

public class Test1 {

    @BeforeClass
    public static void beforeClass() {
        System.out.println(Thread.currentThread().getStackTrace()[1].getMethodName());
    }

    @Before
    public void before() {
        System.out.println(Thread.currentThread().getStackTrace()[1].getMethodName());
    }

    @Test
    public void test1() {
        System.out.println(Thread.currentThread().getStackTrace()[1].getMethodName());
    }

    @Test
    public void test2() {
        System.out.println(Thread.currentThread().getStackTrace()[1].getMethodName());
    }
}
