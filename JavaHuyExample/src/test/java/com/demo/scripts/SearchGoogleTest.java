package com.demo.scripts;

import com.demo.lib.EnvSetup;
import com.demo.lib.UtilityFunc;
import com.demo.pages.GoogleSearchPage;
import org.openqa.selenium.support.PageFactory;
import org.testng.annotations.Test;

public class SearchGoogleTest extends Base {
    GoogleSearchPage googleSearchPage;

    @Override
    public void performBeforeSuiteOperation() {
        googleSearchPage = PageFactory.initElements(EnvSetup.driver, GoogleSearchPage.class);
    }

    @Override
    public void performBeforeTestOperation() {

    }

    @Override
    public void performBeforeClassOperation() {

    }

    @Override
    public void performBeforeMethodOperation() {

    }

    @Override
    public void performAfterMethodOperation() {

    }

    @Override
    public void performAfterClassOperation() {

    }

    @Override
    public void performAfterTestOperation() {

    }

    @Override
    public void performAfterSuiteOperation() {

    }

    @Test
    public void test1(){
        EnvSetup.driver.get("https://google.com");
        googleSearchPage.inputSearch("huy");
        utilityFunc.wait(2);
        googleSearchPage.clickSearchButton();
        UtilityFunc utilityFunc = new UtilityFunc();
        utilityFunc.wait(10);
    }

    @Test
    public void test2() {
        System.out.println("test2");
    }
}
