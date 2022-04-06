package com.demo.scripts;

import com.demo.lib.SuiteListener;
import com.demo.lib.EnvSetup;
import com.demo.lib.UtilityFunc;
import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.testng.annotations.*;

import java.time.Duration;


@Listeners({SuiteListener.class})
public abstract class Base {
    protected UtilityFunc utilityFunc;

    public abstract void performBeforeSuiteOperation();
    public abstract void performBeforeTestOperation();
    public abstract void performBeforeClassOperation();
    public abstract void performBeforeMethodOperation();

    public abstract void performAfterMethodOperation();
    public abstract void performAfterClassOperation();
    public abstract void performAfterTestOperation();
    public abstract void performAfterSuiteOperation();

    @BeforeSuite
    public void setup() {
        System.out.println("BeforeSuite");
        utilityFunc = new UtilityFunc();
        WebDriverManager.chromedriver().setup();
        ChromeOptions chromeOptions = new ChromeOptions();
        chromeOptions.addArguments("--no-sandbox");
//        chromeOptions.addArguments("--headless");
        chromeOptions.addArguments("disable-gpu");
        EnvSetup.driver = new ChromeDriver(chromeOptions); //chrome
        EnvSetup.driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(EnvSetup.implicitWaitSec));
        EnvSetup.driver.manage().window().maximize();
        this.performBeforeSuiteOperation();
    }

    @BeforeTest
    public void beforeTest() {
        System.out.println("BeforeTest");
        this.performBeforeTestOperation();
    }

    @BeforeClass
    public void beforeClass() {
        System.out.println("BeforeClass");
        this.performBeforeClassOperation();
    }

    @BeforeMethod
    public void beforeMethod() {
        System.out.println("BeforeMethod");
        this.performBeforeMethodOperation();
    }

    @AfterMethod
    public void afterMethod() {
        System.out.println("AfterMethod");
        this.performAfterMethodOperation();
    }

    @AfterClass
    public void afterClass() {
        System.out.println("AfterClass");
        this.performAfterClassOperation();
    }

    @AfterTest
    public void afterTest() {
        System.out.println("AfterTest");
        this.performAfterTestOperation();
    }

    @AfterSuite
    public void tearDown() {
        System.out.println("AfterSuite");
        this.performAfterSuiteOperation();
        if (EnvSetup.driver != null) EnvSetup.driver.quit();
    }
}
