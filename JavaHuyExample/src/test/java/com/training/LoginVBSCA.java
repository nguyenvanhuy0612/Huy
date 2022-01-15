package com.training;

import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.testng.annotations.Test;

public class LoginVBSCA {

    @Test
    public void EnterTest() {
        System.out.println("Init driver");
        WebDriverManager.chromedriver().setup();
        WebDriver driver = new ChromeDriver();

        System.out.println("Enter to url");
        driver.get("http://vbsca.ca/login/");

        Common.waitSec(2);

        System.out.println("Close driver");
        driver.close();

    }

    @Test
    public void LoginTest() {
        System.out.println("Init driver");
        WebDriverManager.chromedriver().setup();
        WebDriver driver = new ChromeDriver();

        System.out.println("Enter to url");
        driver.get("http://vbsca.ca/login/login.asp");

        System.out.println("Enter username and password");
        driver.findElement(By.xpath("//input[@name='txtUsername']")).sendKeys("admin");
        driver.findElement(By.xpath("//input[@name='txtPassword']")).sendKeys("123");
        System.out.println("Click login button");
        driver.findElement(By.xpath("//input[@value='Login']")).click();

        Common.waitSec(5);

        System.out.println("Close driver");
        driver.close();

    }
}
