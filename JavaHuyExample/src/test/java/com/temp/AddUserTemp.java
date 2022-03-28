package com.temp;

import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;

import java.time.Duration;

public class AddUserTemp {
    private WebDriver driver;
    private POM_AdminPage adminPageObj;

    private void waitSec(int sec) {
        try {
            Thread.sleep(sec * 1000);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @BeforeMethod
    public void setup() {
        WebDriverManager.chromedriver().setup();
        driver = new ChromeDriver();
        driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(30));
        driver.manage().timeouts().pageLoadTimeout(Duration.ofSeconds(30));
        driver.manage().window().maximize();
        driver.get("https://sbx-3.ixcc-sandbox.avayacloud.com/services/ApplicationCenter/");
        adminPageObj = PageFactory.initElements(this.driver, POM_AdminPage.class);

    }

    @Test
    public void test1() throws InterruptedException {
        JavascriptExecutor executor = (JavascriptExecutor) driver;
        int count = 0;
        if ((Boolean) executor.executeScript("return window.jQuery != undefined")) {
            while (!(Boolean) executor.executeScript("return jQuery.active == 0")) {
                Thread.sleep(4000);
                if (count > 4) break;
                count++;
            }
        }
        WebDriverWait wait = new WebDriverWait(driver, 30);
        wait.until((ExpectedCondition<Boolean>) wd ->
                ((JavascriptExecutor) wd).executeScript("return document.readyState").equals("complete"));

        wait.pollingEvery(Duration.ofSeconds(1));
    }


    @Test
    public void add() {
        adminPageObj.login();
        adminPageObj.cloneLayout("tma_huy1");
        waitSec(30);
    }

    @AfterMethod
    public void tearDown() {
        if (driver != null) {
            driver.close();
        }
    }


}
