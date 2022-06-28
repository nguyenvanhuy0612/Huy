package com.practice.bdd_junit_demo.runner;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(features = {"src/test/java/com/practice/bdd_junit_demo/resources/features"},
        glue = {"com.practice.bdd_junit_demo.steps"},
        monochrome = true,
        tags = "not @ignored",
        plugin = {"pretty", "html:target/cucumber-reports.html"}
)
public class TestRunner {

    @Before
    public void junitBefore() {
        System.out.println(Thread.currentThread().getStackTrace()[1].getMethodName());
    }

    @BeforeClass
    public static void junitBeforeClass() {
        System.out.println(Thread.currentThread().getStackTrace()[1].getMethodName());
    }

}
