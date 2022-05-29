package com.demo.pages;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

public class TestPage {
    String url = "https://stackoverflow.com/";

    @FindBy(linkText = "Stack Overflow")
    private WebElement link;

    public void getLinkText() {
        System.out.println(link.getText());
    }

}
