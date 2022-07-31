package com.insight.selenium.practice;

import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import java.io.IOException;
import java.util.HashMap;
import java.util.concurrent.TimeUnit;

public class MultiBrowserSelenium {
    public static void main(String[] args) throws InterruptedException, IOException {
        HashMap<String, Object> sharedData = new HashMap<>();

        WebDriverManager.chromedriver().setup();
        ChromeOptions options = new ChromeOptions();
        options.addArguments("--headless");
        WebDriver driver = new ChromeDriver(options);

        sharedData.put("driverOrigin", driver);

        driver.get("https://google.com");
        TimeUnit.SECONDS.sleep(2);

        System.out.println(driver);
        WebDriver driver1 = driver;

        driver = new ChromeDriver(options);
        sharedData.put("driver1", driver);

        driver.get("https://youtube.com");


        System.out.println(driver);
        TimeUnit.SECONDS.sleep(2);

        driver.close();
        driver.quit();

        driver1.quit();

        Runtime.getRuntime().exec("taskkill /f /im chromedriver*");
        System.out.println(sharedData);
    }
}
