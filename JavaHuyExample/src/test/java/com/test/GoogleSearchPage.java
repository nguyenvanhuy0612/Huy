package com.test;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

public class GoogleSearchPage {

    @FindBy(name = "q")
    private WebElement searchBox;

    @FindBy(name = "btnK")
    private WebElement searchBtn;

    public GoogleSearchPage launch() {
        Env.driver.get("https://google.com");
        return this;
    }

    public GoogleSearchPage search(String text){
        this.searchBox.sendKeys(text);
        Env.sleep(1);
        this.searchBtn.click();
        return this;
    }

}
