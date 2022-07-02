package com.insight.handle_randompopup;

import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;

import java.time.Duration;

public class TestGoogleSearch {

    WebDriver driver;
    GoogleSearchPage googleSearchPageObj;


    @BeforeMethod
    public void setup() {
        WebDriverManager.chromedriver().setup();
        driver = new ChromeDriver();
        driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(30));
        driver.manage().timeouts().pageLoadTimeout(Duration.ofSeconds(30));
        driver.manage().window().maximize();
        googleSearchPageObj = MyPageFactory.initElements(driver, GoogleSearchPage.class);
    }

    @Test
    public void test1() {
        googleSearchPageObj.launch().clear().enterSearch("huy").enter();
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(1));
        wait.pollingEvery(Duration.ofSeconds(2));

    }



    @AfterMethod
    public void tearDown() {
        if (driver != null)
            driver.quit();
    }

}
