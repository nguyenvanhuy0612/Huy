package com.temp;

import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.annotations.Test;

import java.time.Duration;

public class SeleniumActionTest {
    WebDriver driver;


    @Test
    public void test1() {
        WebDriverManager.chromedriver().setup();
        driver = new ChromeDriver();

        driver.manage().window().maximize();
        driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(30));
        driver.manage().timeouts().pageLoadTimeout(Duration.ofSeconds(60));
        //
        Actions actions = new Actions(driver);
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(120));
        JavascriptExecutor js = (JavascriptExecutor) driver;


        //
        driver.get("https://www.24h.com.vn/");
//        SeleniumActionTest.wait(2);
//        WebElement danhMuc = driver.findElement(By.xpath("//a[text()='Danh mục']"));
//        actions.moveToElement(danhMuc).perform();
//        WebElement thoiTrang = driver.findElement(By.xpath("//a[text()='Thời trang']"));
//        actions.moveToElement(thoiTrang).perform();
//        WebElement congSo = driver.findElement(By.xpath("//a[text()='Thời trang công sở']"));
//        congSo.click();


        Page24h page24hObj = new Page24h(driver);
        page24hObj.testTextMatch();


        SeleniumActionTest.wait(15);

        int x = 10;

        new WebDriverWait(driver, Duration.ofSeconds(10)).pollingEvery(Duration.ofSeconds(30 > x ? 1 :2));

        driver.close();


    }

    public static void wait(int secs) {
        try {
            Thread.sleep(secs * 1000L);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
