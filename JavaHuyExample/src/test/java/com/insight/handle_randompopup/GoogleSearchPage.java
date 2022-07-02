package com.insight.handle_randompopup;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

public class GoogleSearchPage {

    WebDriver driver;

    @FindBy(name = "q")
    public WebElement searchBox;

    public GoogleSearchPage(WebDriver driver) {
        this.driver = driver;
    }

    public GoogleSearchPage launch() {
        driver.get("https://www.google.com.vn/");
        return this;
    }

    public GoogleSearchPage clear() {
        driver.findElement(By.name("q")).clear();
        return this;
    }

    public GoogleSearchPage enterSearch(String text) {
        searchBox.sendKeys(text);
        return this;
    }

    public GoogleSearchPage enter() {
        searchBox.sendKeys(Keys.RETURN);
        return this;
    }
}
