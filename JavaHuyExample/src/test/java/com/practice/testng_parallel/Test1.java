package com.practice.testng_parallel;

import org.testng.annotations.Test;

public class Test1 {

    @Test
    public void test1() {
        System.out.println("Test1 - id:" + Thread.currentThread().getId());
        System.out.println("Test1 - name:" + Thread.currentThread().getName());
        //UtilityFun.wait(2);
        System.out.println("Test1 - id:" + Thread.currentThread().getId());
    }

    @Test
    public void test2() {
        System.out.println("Test2 - id:" + Thread.currentThread().getId());
        //UtilityFun.wait(5);
        System.out.println("Test2 - id:" + Thread.currentThread().getId());
    }

    @Test
    public void test3() {
        System.out.println("Test3 - id:" + Thread.currentThread().getId());
        //UtilityFun.wait(4);
        System.out.println("Test3 - id:" + Thread.currentThread().getId());
    }
}
