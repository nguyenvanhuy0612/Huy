package com.demo.scripts;

import com.demo.lib.EnvSetup;
import com.demo.pages.TestPage;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.PageFactory;
import org.testng.annotations.Test;

public class Test002_Overflow extends BaseScripts {
    private TestPage testPageObj;


    @Override
    public void performBeforeMethodOperation() {
        testPageObj = PageFactory.initElements(EnvSetup.WEBDRIVER, TestPage.class);
    }

    @Override
    public void performAfterMethodOperation() {
    }

    @Test
    public void Test1() {
        System.out.println("Entering methods Test1");
        EnvSetup.WEBDRIVER.get("https://stackoverflow.com/");
        testPageObj.getLinkText();
        EnvSetup.WEBDRIVER.get("https://google.com/");
        System.out.println();
        WebDriver curDriver = EnvSetup.WEBDRIVER;
        curDriver.quit();
        curDriver = null;

        System.out.println("Create new");
        EnvSetup.WEBDRIVER = EnvSetup.initDriver();
        performBeforeMethodOperation();
        EnvSetup.WEBDRIVER.get("https://stackoverflow.com/");
        testPageObj.getLinkText();
        System.out.println("End Test1");


    }

}
