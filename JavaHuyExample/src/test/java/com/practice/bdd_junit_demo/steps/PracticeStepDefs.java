package com.practice.bdd_junit_demo.steps;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class PracticeStepDefs {
    private final Logger log = LogManager.getLogger(TestStepsDefs.class);

    @Given("test")
    public void test() {
        log.info("test");
    }

    @When("^test1")
    public void test1() {
        log.info("Test1");
    }

    @Given("Test Background")
    public void testBackground() {
        System.out.println("testBackground");
    }
}
