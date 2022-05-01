package com.test;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.pagefactory.ByAll;
import org.openqa.selenium.support.pagefactory.ByChained;

public class XpathChain {
    WebDriver driver;

    public void test1() {
        By parentLoc = By.xpath("//html");
        By childLoc = By.id("username");
        By chain = new ByChained(parentLoc, childLoc);
        driver.findElements(new ByChained(By.id("details"), By.className("personName")));
        driver.findElements(new ByAll(By.id("err1"), By.className("errBox")));


        // NEW
        By loc = new By.ByXPath("username");
    }
}
