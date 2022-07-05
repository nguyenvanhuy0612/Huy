package com.practice.bdd_junit_demo.steps;

import io.cucumber.java.Before;
import io.cucumber.java.BeforeAll;
import io.cucumber.java.BeforeStep;
import io.cucumber.java.Scenario;

public class Hooks {

    @BeforeAll
    public static void beforeAll() {
        System.out.println("========================================================================================");
        System.out.println(Thread.currentThread().getStackTrace()[1].getMethodName());
        // Init log
        // Init env
        System.out.println("========================================================================================");
    }

    @Before("@test2")
    public void before2(Scenario scenario) {
        System.out.println("========================================================================================");
        System.out.println(Thread.currentThread().getStackTrace()[1].getMethodName());
        System.out.println("before method with scenario: " + scenario.getName());
        System.out.println("before method with scenario line: " + scenario.getLine());
        // Init webdriver
        // login EP
        System.out.println("========================================================================================");
    }

    @Before("@test")
    public void before3(Scenario scenario) {
        System.out.println("========================================================================================");
        System.out.println(Thread.currentThread().getStackTrace()[1].getMethodName());
        System.out.println("before method with scenario: " + scenario.getName());
        System.out.println("before method with scenario line: " + scenario.getLine());
        // Init webdriver
        // login EP
        System.out.println("========================================================================================");
    }

    @Before
    public void before(Scenario scenario) {
        System.out.println("========================================================================================");
        System.out.println(Thread.currentThread().getStackTrace()[1].getMethodName());
        System.out.println("before method with scenario: " + scenario.getName());
        System.out.println("before method with scenario line: " + scenario.getLine());
        // Init webdriver
        // login EP
        System.out.println("========================================================================================");
    }

    @BeforeStep
    public void beforeStep(Scenario scenario) {
        System.out.println("========================================================================================");
        System.out.println(Thread.currentThread().getStackTrace()[1].getMethodName());
        System.out.println("beforeStep method with scenario getName: " + scenario.getName());
        System.out.println("beforeStep method with scenario getStatus: " + scenario.getStatus());
        System.out.println("beforeStep method with scenario getSourceTagNames: " + scenario.getSourceTagNames());
        System.out.println("beforeStep method with scenario getId: " + scenario.getId());
        System.out.println("beforeStep method with scenario getLine: " + scenario.getLine());
        System.out.println("========================================================================================");
    }
}
