package com.huy.practice.pomDemo.pages;

import com.huy.practice.pomDemo.data.EnvSetup;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindAll;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.How;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.util.ArrayList;
import java.util.List;

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

    public void example() {

    }
    enum WaitType {
        VISIBLE,
        INVISIBLE,
        CLICKABLE,
        SELECTED
    }

    private void waitForElement(WebElement webElement, WaitType waitType, int timeInSec) {
        timeInSec = timeInSec <= 0 ? 30 : timeInSec;
        WebDriverWait wait = new WebDriverWait(EnvSetup.driver, timeInSec);
        switch (waitType) {
            case VISIBLE:
                wait.until(ExpectedConditions.visibilityOf(webElement));
                break;
            case INVISIBLE:
                wait.until(ExpectedConditions.invisibilityOf(webElement));
                break;
            case CLICKABLE:
                wait.until(ExpectedConditions.elementToBeClickable(webElement));
                break;
            case SELECTED:
                wait.until(ExpectedConditions.elementToBeSelected(webElement));
                break;
            default:
                wait.until(ExpectedConditions.visibilityOf(webElement));
                break;
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
                waitForElement(element, WaitType.CLICKABLE, 30);
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
