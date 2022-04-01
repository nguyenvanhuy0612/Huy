package com.insight.hover;

import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.interactions.Actions;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

import java.time.Duration;
import java.util.function.Consumer;
import java.util.regex.Pattern;

public class HoverTest {
    private WebDriver driver;
    private Actions action;

    Consumer<By> hover = (By by) -> {
        action.moveToElement(driver.findElement(by))
                .perform();
    };

    @Test
    public void hoverTest() {
        driver.get("https://www.bootply.com/render/6FC76YQ4Nh");

        hover.accept(By.linkText("Dropdown"));
        hover.accept(By.linkText("Dropdown Link 5"));
        hover.accept(By.linkText("Dropdown Submenu Link 5.4"));
        hover.accept(By.linkText("Dropdown Submenu Link 5.4.1"));
    }

    @Test
    public void test2() {
        String by = "Dropdown -> Dropdown Link 5 -> Dropdown Submenu Link 5.4 -> Dropdown Submenu Link 5.4.1";

        driver.get("https://www.bootply.com/render/6FC76YQ4Nh");

        Pattern.compile("->")
                .splitAsStream(by)
                .map(String::trim)
                .map(By::linkText)
                .forEach(hover);
    }

    @BeforeTest
    public void setupDriver() {
        WebDriverManager.chromedriver().setup();
        driver = new ChromeDriver();
        action = new Actions(driver);
        driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(60));
    }

    @AfterTest
    public void teardownDriver() {
        driver.quit();
    }
}
