package com.test;

import org.openqa.selenium.*;
import org.openqa.selenium.Point;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.interactions.Locatable;

import java.awt.*;
import java.awt.event.InputEvent;

public class Test10_Robot {
    public static void main(String[] args) throws AWTException, InterruptedException {
        Robot robot = new Robot();
        WebDriver driver = new ChromeDriver();
        JavascriptExecutor js = (JavascriptExecutor) driver;
        WebElement element = driver.findElement(By.xpath("//html"));

        robot.mouseMove(element.getLocation().getX(), element.getLocation().getY());
        robot.mousePress(InputEvent.BUTTON1_DOWN_MASK);
        Thread.sleep(50);
        robot.mouseRelease(InputEvent.BUTTON1_DOWN_MASK);
        WebElement htmlElement = driver.findElement(By.tagName("html"));
        Point viewPortLocation = ((Locatable) htmlElement).getCoordinates().onScreen();
        int x = viewPortLocation.getX();
        int y = viewPortLocation.getY();

        Object viewport_height = js.executeScript("return window.innerHeight");
        Object viewport_width = js.executeScript("return window.innerWidth");
    }
}
