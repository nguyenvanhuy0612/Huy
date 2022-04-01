package com.temp;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;
import java.util.regex.Pattern;

public class Page24h {
	WebDriver driver;
	Actions actions;

	public Page24h(WebDriver driver) {
		this.driver = driver;
		PageFactory.initElements(this.driver, this);
		this.actions = new Actions(this.driver);
	}

	@FindBy(xpath = "//a[text()='Danh má»¥c']")
	private WebElement danhMuc;

	@FindBy(xpath = "//a[text()='Thá»�i trang']")
	private WebElement thoiTrang;

	@FindBy(xpath = "//a[text()='Thá»�i trang cÃ´ng sá»Ÿ']")
	private WebElement congSo;

	public void actionTestCongSo() {
		actions.moveToElement(danhMuc).perform();
		actions.moveToElement(thoiTrang).click().perform();
//        actions.moveToElement(congSo).perform();
//        actions.click().perform();
	}

	public void test2CongSo() {
		actions.moveToElement(driver.findElement(By.xpath("//a[text()='Danh má»¥c']"))).perform();
		actions.moveToElement(driver.findElement(By.xpath("//a[text()='Thá»�i trang']"))).click().perform();
	}

	public void testTextMatch() {
		String defaultDialNumber = "COVID-19";
		Pattern p = Pattern.compile(defaultDialNumber.replaceAll("\\+", "\\\\+"));
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(30));
		Boolean isCovid = wait
				.until(ExpectedConditions.textMatches(By.xpath("//a[contains(@title, 'NgÃ y 12/12')]"), p));
		System.out.println("isCovid: " + isCovid);
	}

}
