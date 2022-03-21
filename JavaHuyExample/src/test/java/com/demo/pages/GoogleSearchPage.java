package com.demo.pages;

import com.demo.lib.EnvSetup;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindAll;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.How;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;
import java.util.List;
import java.util.NoSuchElementException;

public class GoogleSearchPage {
    @FindBy(xpath = "//img[@alt='Google']")
    private WebElement imgGoogleLogo;

    @FindBy(xpath = "//*[@aria-label='Search by voice']")
    private WebElement btnVoiceSearch;

    @FindBy(xpath = "//div[@class='FPdoLc lJ9FBc']//*[@name='btnK']")
    private WebElement btnSearch;

    @FindAll({
            @FindBy(xpath = "//*[@name='btnK']")
    })
    private List<WebElement> btnSearchs;

    @FindBy(xpath = "//div[@class='FPdoLc lJ9FBc']//*[@name='btnI']")
    private WebElement btnLuckySearch;

    @FindBy(xpath = "//input[@name='q']")
    private WebElement inputSearchText;

    @FindBy(how = How.XPATH, using = "//input[@name='q']")
    private WebElement inputSearchText2;

    public void inputSearch(String text) {
        text = text.equals("") ? "Default search" : text;
        this.inputSearchText.sendKeys(text);
    }

    public WebElement presentElement(By by, int sec) {
        EnvSetup.driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(sec));
        try {
            return EnvSetup.driver.findElement(by);
        }catch (NoSuchElementException e){
            System.out.println("Not found element with locator: " + by);
            return null;
        }finally {
            EnvSetup.driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(EnvSetup.implicitWaitSec));
        }
    }

    public WebElement presentElement(WebElement element, int sec) {
        EnvSetup.driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(sec));
        try {
            return new WebDriverWait(EnvSetup.driver, Duration.ofSeconds(sec))
                    .until(ExpectedConditions.visibilityOf(element));
        }catch (NoSuchElementException e){
            System.out.println("Not found element: " + element);
            return null;
        }finally {
            EnvSetup.driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(EnvSetup.implicitWaitSec));
        }
    }

    public void clickSearchButton() {
        WebDriverWait wait = new WebDriverWait(EnvSetup.driver, 5);
        System.out.printf("So luong WebElement cua btnSearchs la %d\n", btnSearchs.size());
        for (int i = btnSearchs.size() - 1; i >= 0; i--) {
            System.out.printf("Element thu %d\n", i);
            WebElement element = btnSearchs.get(i);
//            if (element.isDisplayed() && element.isEnabled()){
//                element.click();
//                break;
//            }
            try {
                presentElement(element, 30);
                element.click();
                break;
            } catch (Exception ignored) {
                System.out.println("Exception, continue");
            }
        }

        /*for (int i = 0; i < btnSearchs.size(); i++) {
            System.out.printf("WebDriver thu %d", i);
            WebElement btn = btnSearchs.get(btnSearchs.size() - i - 1);
            WebElement found = wait.until(ExpectedConditions.elementToBeClickable(btn));
            if (found != null) {
                found.click();
                break;
            }
        }*/
    }
}