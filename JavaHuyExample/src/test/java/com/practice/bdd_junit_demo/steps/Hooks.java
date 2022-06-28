package com.practice.bdd_junit_demo.steps;

import io.cucumber.java.Before;
import io.cucumber.java.BeforeAll;
import io.cucumber.java.BeforeStep;

public class Hooks {

    @BeforeAll
    public static void before_or_after_all() {
        System.out.println(Thread.currentThread().getStackTrace()[1].getMethodName());
    }

    @Before
    public void before() {
        System.out.println(Thread.currentThread().getStackTrace()[1].getMethodName());
    }

    @BeforeStep
    public void beforeStep() {
        System.out.println(Thread.currentThread().getStackTrace()[1].getMethodName());
    }
}
