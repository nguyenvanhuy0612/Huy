package com.huy.practice.pomDemo.test;

import com.huy.practice.pomDemo.data.EnvSetup;
import com.huy.practice.pomDemo.data.UtilityFunc;
import com.huy.practice.pomDemo.pages.GoogleSearchPage;
import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.PageFactory;
import org.testng.annotations.AfterSuite;
import org.testng.annotations.BeforeSuite;
import org.testng.annotations.Test;

import java.util.concurrent.TimeUnit;

public class SearchGoogleTest {
    GoogleSearchPage googleSearchPage;
    UtilityFunc utilityFunc;

    @BeforeSuite
    public void setup() {
        utilityFunc = new UtilityFunc();
        WebDriverManager.chromedriver().setup();
        ChromeOptions chromeOptions = new ChromeOptions();
        chromeOptions.addArguments("--no-sandbox");
        chromeOptions.addArguments("--headless");
        chromeOptions.addArguments("disable-gpu");
        EnvSetup.driver = new ChromeDriver(chromeOptions);
        EnvSetup.driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
        EnvSetup.driver.manage().window().maximize();
        googleSearchPage = PageFactory.initElements(EnvSetup.driver, GoogleSearchPage.class);
    }

    @AfterSuite
    public void tearDown() {
        if (EnvSetup.driver != null) EnvSetup.driver.close();
    }

    @Test
    public void test1(){
        EnvSetup.driver.get("https://google.com");
        googleSearchPage.inputSearch("huy");
        utilityFunc.wait(2);
        googleSearchPage.clickSearchButton();
        UtilityFunc utilityFunc = new UtilityFunc();
        utilityFunc.wait(10);
    }
}
