package com.practice.testng_parallel;

import org.testng.annotations.Test;

public class Test2 {

    @Test
    public void test21() {
        System.out.println("Test21 - id:" + Thread.currentThread().getId());
        System.out.println("Test21 - name:" + Thread.currentThread().getName());
        //UtilityFun.wait(4);
        System.out.println("Test21 - id:" + Thread.currentThread().getId());
    }

    @Test
    public void test22() {
        System.out.println("Test22 - id:" + Thread.currentThread().getId());
        UtilityFun.wait(1);
        System.out.println("Test22 - id:" + Thread.currentThread().getId());
    }
}
