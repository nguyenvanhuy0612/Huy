package com.practice.bdd_junit_demo.steps;

import com.practice.bdd_junit_demo.lib.EnvSetup;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

public class TestStepsDefs {

    @Given("Go to url")
    public void go_to_url() {
        // Write code here that turns the phrase above into concrete actions
        System.out.println(Thread.currentThread().getStackTrace()[1].getMethodName());
        System.out.println("EnvSetup.environment_version = " + EnvSetup.environment_version);
    }
    @When("Login agent")
    public void login_agent() {
        // Write code here that turns the phrase above into concrete actions
        System.out.println(Thread.currentThread().getStackTrace()[1].getMethodName());
        System.out.println("EnvSetup.environment_version = " + EnvSetup.environment_version);
    }
    @Then("Verify login successfully")
    public void verify_login_successfully() {
        // Write code here that turns the phrase above into concrete actions
        System.out.println(Thread.currentThread().getStackTrace()[1].getMethodName());
        System.out.println("EnvSetup.environment_version = " + EnvSetup.environment_version);
    }
}
