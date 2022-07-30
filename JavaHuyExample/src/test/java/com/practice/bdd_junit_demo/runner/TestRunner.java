package com.practice.bdd_junit_demo.runner;

import com.practice.bdd_junit_demo.lib.EnvSetup;
import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.BeforeClass;
import org.junit.runner.RunWith;

import java.io.File;

@RunWith(Cucumber.class)
@CucumberOptions(
//        features = {"src/test/java/com/practice/bdd_junit_demo/resources/features"},
        features = {"src/test/java/com/practice/bdd_junit_demo/resources/features"},
//        glue = {"com.practice.bdd_junit_demo.steps"},
        glue = {"com.practice.bdd_junit_demo.steps"},
        monochrome = true,
        //tags = "not @ignored and (@test or @test1 or @test2)",
        tags = "@TestData",
        publish = false,
        plugin = {"pretty",
                "html:target/cucumber/reports/Cucumber.html",
                "json:target/cucumber/reports/Cucumber.json",
                "junit:target/cucumber/reports/Cucumber.xml"
        }
)
public class TestRunner {

    @BeforeClass
    public static void junitBeforeClass() {
        System.out.println("========================================================================================");
        //Init log
        String configPath = System.getProperty("user.dir") + "/src/test/java/com/demo_log4j/data/config/log4j2_config3.properties";
        System.out.println("configPath: " + configPath);
        System.setProperty("log4j2.configurationFile", new File(configPath).toURI().toString());
        // Before Suite alternative
        EnvSetup.environment_version = 22;
        System.out.println(Thread.currentThread().getStackTrace()[1].getMethodName());
        System.out.println("EnvSetup.environment_version = " + EnvSetup.environment_version);
        System.out.println("========================================================================================");
    }
}
