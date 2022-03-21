package com.huy.scripts;


import com.huy.lib.EnvSetup;
import com.huy.lib.Listener;

import io.github.bonigarcia.wdm.WebDriverManager;
import org.apache.log4j.Logger;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.testng.annotations.*;

import java.time.Duration;

@Listeners({
        Listener.class
})
public abstract class BaseScripts {

    private final Logger LOGGER = Logger.getLogger(this.getClass().getName());

//    public abstract void performBeforeSuiteOperation();
//    public abstract void performBeforeTestOperation();
//    public abstract void performBeforeClassOperation();
    public abstract void performBeforeMethodOperation();

    public abstract void performAfterMethodOperation();
//    public abstract void performAfterClassOperation();
//    public abstract void performAfterTestOperation();
//    public abstract void performAfterSuiteOperation();

    @BeforeSuite
    public void setup() {
        System.out.println("BeforeSuite");
        EnvSetup.WEBDRIVER = EnvSetup.initDriver();
        //performBeforeSuiteOperation();
    }


    @BeforeTest
    public void beforeTest() {
        System.out.println("BeforeTest");
        //performBeforeTestOperation();
    }

    @BeforeClass
    public void beforeClass() {
        System.out.println("BeforeClass");
        //performBeforeClassOperation();
    }

    @BeforeMethod
    public void beforeMethod() {
        System.out.println("BeforeMethod");
        performBeforeMethodOperation();
    }

    @AfterMethod
    public void afterMethod() {
        System.out.println("AfterMethod");
        performAfterMethodOperation();
    }

    @AfterClass
    public void afterClass() {
        System.out.println("AfterClass");
        //performAfterClassOperation();
    }

    @AfterTest
    public void afterTest() {
        System.out.println("AfterTest");
        //performAfterTestOperation();
    }

    @AfterSuite
    public void tearDown() {
        System.out.println("AfterSuite");
        //performAfterSuiteOperation();
        if (EnvSetup.WEBDRIVER != null) EnvSetup.WEBDRIVER.quit();
    }

}
