package com.practice.bdd_junit_demo.steps;

import com.practice.bdd_junit_demo.lib.EnvSetup;
import io.cucumber.java.ParameterType;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.time.LocalDate;

public class TestStepsDefs {

    private final Logger log = LogManager.getLogger(TestStepsDefs.class);

    @ParameterType("red|blue|yellow")  // regexp
    public String color(String color){  // type, name (from method)
        return color.toUpperCase();       // transformer function
    }

    @ParameterType("([0-9]{4})-([0-9]{2})-([0-9]{2})")
    public LocalDate iso8601Date(String year, String month, String day) {
        return LocalDate.of(Integer.parseInt(year), Integer.parseInt(month), Integer.parseInt(day));
    }

    @Given("today is {iso8601Date}")
    public void today_is(LocalDate date) {
        log.info("date: " + date);
    }

    @Given("Go to url")
    public void go_to_url() {
        // Write code here that turns the phrase above into concrete actions
        log.info(Thread.currentThread().getStackTrace()[1].getMethodName());
        log.info("EnvSetup.environment_version = " + EnvSetup.environment_version);
    }
    @When("Login agent")
    public void login_agent() {
        // Write code here that turns the phrase above into concrete actions
        log.info(Thread.currentThread().getStackTrace()[1].getMethodName());
        log.info("EnvSetup.environment_version = " + EnvSetup.environment_version);
    }
    @Then("Verify login successfully")
    public void verify_login_successfully() {
        // Write code here that turns the phrase above into concrete actions
        log.info(Thread.currentThread().getStackTrace()[1].getMethodName());
        log.info("EnvSetup.environment_version = " + EnvSetup.environment_version);
    }
}
