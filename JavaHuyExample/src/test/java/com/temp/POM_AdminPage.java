package com.temp;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;

public class POM_AdminPage {
    private WebDriver driver;
    private WebDriverWait wait;
    private int lazyLoadTime;

    public POM_AdminPage(WebDriver webDriver) {
        this.driver = webDriver;
        wait = new WebDriverWait(driver, Duration.ofSeconds(60));
        lazyLoadTime = 2;
    }

    public POM_AdminPage() {
    }

    // Elements
    @FindBy(id = "username")
    private WebElement username;
    @FindBy(id = "tr-login")
    private WebElement btnNext;
    @FindBy(id = "password")
    private WebElement password;
    @FindBy(id = "kc-login")
    private WebElement btnLogin;
    // Home page
    @FindBy(xpath = "//div[text()='Administration']")
    private WebElement appAdministration;
    // Workspace - Layout
    @FindBy(xpath = "//*[@data-sidebar-id='workspaces']")
    private WebElement menuWorkspaces;
    @FindBy(xpath = "//a[contains(text(), 'Layout Manager')]")
    private WebElement layoutManager;
    @FindBy(xpath = "//input[@puppeteer-id='layout-manager__layouts-search']")
    private WebElement inpSearchLayout;
    @FindBy(xpath = "//button[@aria-label='Clone Layout']")
    private WebElement btnCloneLayout;
    @FindBy(xpath = "//input[@puppeteer-id='form-input--name']")
    private WebElement inpLayoutName;
    @FindBy(xpath = "//input[@puppeteer-id='form-input--description']")
    private WebElement inpLayoutDes;
    @FindBy(id = "okButton")
    private WebElement btnSaveLayout;
    // WS -


    @FindBy(xpath = "//*[contains(text()='Business Rules']")
    private WebElement businessRules;

    // support method
    private void waitSec(int sec) {
        try {
            Thread.sleep(sec * 1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    private void setWebDriverWait(int waitTime) {
        this.wait = new WebDriverWait(this.driver, Duration.ofSeconds(waitTime));
    }

    private void waitFor(WebElement element) {
        System.out.println("waitFor : ");
        wait.until(ExpectedConditions.visibilityOf(element));
        waitSec(lazyLoadTime);
    }

    private void click(WebElement element) {
        System.out.println("waitClick : ");
        wait.until(ExpectedConditions.elementToBeClickable(element));
        waitSec(lazyLoadTime);
        element.click();
    }

    private void actionClick(WebElement element) {
        wait.until(ExpectedConditions.elementToBeClickable(element));
        waitSec(lazyLoadTime);
        new Actions(this.driver).moveToElement(element).click().perform();
    }

    private void sendkeys(WebElement element, CharSequence s) {
        wait.until(ExpectedConditions.visibilityOf(element));
        waitSec(lazyLoadTime);
        element.sendKeys(s);
    }


    //main
    public void login() {
        sendkeys(this.username, "admin@pepsi.com");
        actionClick(this.btnNext);
        sendkeys(this.password, "1_Abc_123");
        waitSec(1);
        actionClick(this.btnLogin);
        waitSec(5);
        actionClick(this.appAdministration);
    }

    public void cloneLayout(String layoutName) {
        click(this.menuWorkspaces);
        waitSec(5);
        click(this.layoutManager);
        waitSec(5);
        sendkeys(inpSearchLayout, Keys.chord("DefaultNewAccountLayout", Keys.ENTER));
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//span[contains(text(), 'DefaultNewAccountLayout')]")));
        click(this.btnCloneLayout);
        sendkeys(this.inpLayoutName, layoutName);
        sendkeys(this.inpLayoutDes, layoutName);
        click(this.btnSaveLayout);
        this.inpSearchLayout.clear();
        sendkeys(this.inpSearchLayout, layoutName);
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//span[contains(text(), '"+layoutName+"')]")));

    }

    public void addRule(String number) {
//        xpathClick("//*[contains(text()='Business Rules']");
//        xpathClick("//*[contains(text()='Context Data Rule']");
//        xpathClick("//*[contains(text()='Add Rule']");
        waitSec(5);
        driver.findElement(By.xpath("//input[@label='Context Rule Name']")).sendKeys("pom_rule" + number);
        driver.findElement(By.id("input_conditionKey_0")).sendKeys("queueName");
        driver.findElement(By.id("input_conditionValue_0")).sendKeys("pom_queue" + number);
        waitSec(1);
        Select s = new Select(driver.findElement(By.id("queueId")));
        s.selectByValue("");
    }


}
