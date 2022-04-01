package com.huy.lib;

import io.cucumber.java.af.En;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.annotations.Test;

import java.time.Duration;
import java.util.concurrent.TimeUnit;

public class Common {

//    public boolean isElementDisplay(By by, int sec)
//    {
//        EnvSetup.WEBDRIVER.manage().timeouts().implicitlyWait(sec, TimeUnit.SECONDS);
//        try
//        {
//            return EnvSetup.WEBDRIVER.findElement(by).isDisplayed();
//        } catch (Exception e)
//        {
//            return false;
//        }
//        finally
//        {
//            EnvSetup.WEBDRIVER.manage().timeouts().implicitlyWait(60, TimeUnit.SECONDS);
//        }
//    }

	public WebElement presentElement(By by, int sec) {
		EnvSetup.WEBDRIVER.manage().timeouts().implicitlyWait(Duration.ofSeconds(0));
		try {
			return new WebDriverWait(EnvSetup.WEBDRIVER, Duration.ofSeconds(sec))
					.until(ExpectedConditions.visibilityOfElementLocated(by));
		} catch (Exception e) {
			return null;
		} finally {
			EnvSetup.WEBDRIVER.manage().timeouts().implicitlyWait(Duration.ofSeconds(60));
		}
	}

	public boolean isElementDisplay(By by, int sec) {
		EnvSetup.WEBDRIVER.manage().timeouts().implicitlyWait(Duration.ofSeconds(60));
		try {
			new WebDriverWait(EnvSetup.WEBDRIVER, Duration.ofSeconds(sec))
					.until(ExpectedConditions.visibilityOfElementLocated(by));
			return true;
		} catch (Exception e) {
			return false;
		} finally {
			EnvSetup.WEBDRIVER.manage().timeouts().implicitlyWait(Duration.ofSeconds(60));
		}
	}

	@Test
	public void test() {
		WebElement element = presentElement(By.id("id1"), 30);
		if (element == null)
			System.out.println("not found");
		else {
			System.out.println("found");
			element.click();
		}

		boolean isDisplays = isElementDisplay(By.id("id1"), 30);
		if (isDisplays)
			System.out.println("not found");
		else {
			System.out.println("found");
			EnvSetup.WEBDRIVER.findElement(By.id("id1")).click();
		}
	}

}
