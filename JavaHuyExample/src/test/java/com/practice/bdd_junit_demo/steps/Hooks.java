package com.practice.bdd_junit_demo.steps;

import io.cucumber.java.Before;
import io.cucumber.java.BeforeAll;
import io.cucumber.java.BeforeStep;
import io.cucumber.java.Scenario;

public class Hooks {

    @BeforeAll
    public static void before_or_after_all() {
        System.out.println(Thread.currentThread().getStackTrace()[1].getMethodName());
    }

    @Before
    public void before(Scenario scenario) {
        System.out.println(Thread.currentThread().getStackTrace()[1].getMethodName());
        System.out.println(scenario.getName());
    }

    @BeforeStep
    public void beforeStep(Scenario scenario) {
        System.out.println(Thread.currentThread().getStackTrace()[1].getMethodName());
        System.out.println(scenario.getName());
    }
}
