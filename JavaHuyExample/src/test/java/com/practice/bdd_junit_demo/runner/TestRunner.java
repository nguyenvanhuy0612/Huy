package com.practice.bdd_junit_demo.runner;

import com.practice.bdd_junit_demo.lib.EnvSetup;
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
        publish = false,
        plugin = {"pretty", "html:target/cucumber-reports.html"}
)
public class TestRunner {

    @Before
    public void junitBefore() {
        EnvSetup.environment_version = 2;
        System.out.println(Thread.currentThread().getStackTrace()[1].getMethodName());
        System.out.println("EnvSetup.environment_version = " + EnvSetup.environment_version);
    }

    @BeforeClass
    public static void junitBeforeClass() {
        EnvSetup.environment_version = 22;
        System.out.println(Thread.currentThread().getStackTrace()[1].getMethodName());
        System.out.println("EnvSetup.environment_version = " + EnvSetup.environment_version);
    }
}
