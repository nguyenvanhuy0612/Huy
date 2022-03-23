package com.test;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

public class YahooPage {

    @FindBy(linkText = "Sign up")
    private WebElement signUpBtn;

    public YahooPage launch() {
        Env.driver2.get("https://mail.yahoo.com/");
        return this;
    }

    public YahooPage signUp(){
        this.signUpBtn.click();
        return this;
    }
}
