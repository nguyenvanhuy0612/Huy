package com.insight.handlerandompopup;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import java.lang.reflect.Proxy;

public class ElementGuard {

    public static WebElement guard(WebElement element) {
        ElementProxy proxy = new ElementProxy(element);
        WebElement wrappedElement = (WebElement) Proxy.newProxyInstance(
                ElementProxy.class.getClassLoader(), new Class[]{WebElement.class}, proxy);
        return wrappedElement;
    }

    public static WebDriver guard(WebDriver driver) {
        WebDriverProxy proxy = new WebDriverProxy(driver);
        WebDriver wrappedDriver = (WebDriver) Proxy.newProxyInstance(
                WebDriverProxy.class.getClassLoader(), new Class[]{WebDriverProxy.class}, proxy);
        return wrappedDriver;
    }

}