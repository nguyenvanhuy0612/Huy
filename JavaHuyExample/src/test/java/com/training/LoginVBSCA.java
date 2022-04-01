package com.training;

import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.annotations.Test;

import java.text.SimpleDateFormat;
import java.time.Duration;
import java.util.*;
import java.util.concurrent.TimeUnit;

public class LoginVBSCA {

	@Test
	public void DateTest() {
		final SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy HH:mm");
		Calendar cal = Calendar.getInstance();
	}

	@Test
	public void EnterTest() {
		System.out.println("Init driver");
		WebDriverManager.chromedriver().setup();
		WebDriver driver = new ChromeDriver();
		driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(30));

		System.out.println("Enter to url");
		driver.get("http://vbsca.ca/login/");

		Common.waitSec(2);

		System.out.println("Close driver");
		driver.close();

	}

	@Test
	public void LoginTest() {
		System.out.println("Init driver");
		WebDriverManager.chromedriver().setup();
		WebDriver driver = new ChromeDriver();

		System.out.println("Enter to url");
		driver.get("http://vbsca.ca/login/login.asp");

		System.out.println("Enter username and password");
		driver.findElement(By.xpath("//input[@name='txtUsername']")).sendKeys("admin");
		driver.findElement(By.xpath("//input[@name='txtPassword']")).sendKeys("123");
		System.out.println("Click login button");
		driver.findElement(By.xpath("//input[@value='Login']")).click();

		Common.waitSec(5);

		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(60));
		// wait.until(ExpectedConditions.numberOfElementsToBe())
		wait.until(ExpectedConditions
				.visibilityOfElementLocated(By.xpath("//div[text()='Proactive Outreach Dashboard']")));

		if (new WebDriverWait(driver, Duration.ofSeconds(5)).until(ExpectedConditions.alertIsPresent()) != null) {
			driver.switchTo().alert().accept();
		}
		System.out.println("Close driver");
		driver.close();

	}
}
