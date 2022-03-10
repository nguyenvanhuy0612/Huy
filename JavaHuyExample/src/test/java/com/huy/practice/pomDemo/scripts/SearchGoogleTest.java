package com.huy.practice.pomDemo.scripts;

import com.huy.practice.pomDemo.lib.EnvSetup;
import com.huy.practice.pomDemo.lib.UtilityFunc;
import com.huy.practice.pomDemo.pages.GoogleSearchPage;
import org.openqa.selenium.support.PageFactory;
import org.testng.annotations.Test;

public class SearchGoogleTest extends Base{
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
}
