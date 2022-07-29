package com.insight.selenium.wait;

import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;

public class Example_Wait {
    public static void main(String[] args) {
        WebDriverManager.chromedriver().setup();
        WebDriver driver = new ChromeDriver();
        driver.get("https://google.com");

        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
        WebElement element = wait.until(d -> d.findElement(By.name("q")));
        System.out.println(element);

        boolean isFound = wait.until(d -> d.findElements(By.name("q")).size() != 0);
        System.out.println(isFound);

        isFound = wait.until(d -> {
            if (d.findElements(By.name("q1")).size() != 0)
                return true;
            return false;
        });
        System.out.println(isFound);
    }
}
