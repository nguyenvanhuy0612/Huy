package com.practice.bdd_testng_demo.runner;

import io.cucumber.testng.AbstractTestNGCucumberTests;
import io.cucumber.testng.CucumberOptions;

@CucumberOptions(features = {"src/test/resources/features/Login.feature"},
        glue = {"com.example.Cucumber_TestNGDemo.definitions"},
        monochrome = true,
        tags = "not @ignored",
        publish = false,
        plugin = {"pretty", "html:target/cucumber-reports.html"}
)
public class CucumberRunner extends AbstractTestNGCucumberTests {

}
