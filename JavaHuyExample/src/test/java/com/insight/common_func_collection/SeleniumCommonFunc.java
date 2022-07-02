package com.insight.common_func_collection;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;

public class SeleniumCommonFunc {

    public static int DRIVER_IMPLICIT_TIMEOUT = 60;


    public static WebElement presentElement(WebDriver driver, By by, int timeout) {
        try {
            driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(timeout));
            return driver.findElement(by);
        } catch (Exception e) {
            return null;
        } finally {
            driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(SeleniumCommonFunc.DRIVER_IMPLICIT_TIMEOUT));
        }
    }

    public static WebElement presentElement(WebDriver driver, WebElement element, int timeout) {
        try {
            driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(0));
            return new WebDriverWait(driver, Duration.ofSeconds(timeout)).until(ExpectedConditions.visibilityOf(element));
        } catch (Exception e) {
            return null;
        } finally {
            driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(SeleniumCommonFunc.DRIVER_IMPLICIT_TIMEOUT));
        }
    }
}
