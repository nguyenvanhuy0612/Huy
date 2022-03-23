package com.test;

import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.PageFactory;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;

import java.time.Duration;

public class Script_Test {

    GoogleSearchPage googleSearchPageObj;
    YahooPage yahooPageObj;

    @BeforeMethod
    public void setup() {
        WebDriverManager.chromedriver().setup();
        WebDriverManager.firefoxdriver().setup();
        Env.driver = new ChromeDriver();
        Env.driver2 = new FirefoxDriver();
        Env.driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(10));
        Env.driver2.manage().timeouts().implicitlyWait(Duration.ofSeconds(10));

        googleSearchPageObj = PageFactory.initElements(Env.driver, GoogleSearchPage.class);
        //yahooPageObj = PageFactory.initElements(Env.driver2, YahooPage.class);
    }

    @Test
    public void test1() {
        googleSearchPageObj.launch().search("google");
        GoogleSearchPage googleSearchPageObj2 = PageFactory.initElements(Env.driver2, GoogleSearchPage.class);
        googleSearchPageObj2.launch().search("firefox");
        System.out.println();
    }
}
