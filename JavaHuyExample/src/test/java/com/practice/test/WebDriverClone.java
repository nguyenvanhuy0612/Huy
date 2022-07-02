package com.practice.test;

import org.openqa.selenium.WebDriver;

import java.io.Serializable;

public class WebDriverClone implements Serializable {
    WebDriver driver;

    public WebDriverClone(WebDriver driver) {
        this.driver = driver;
    }
}
