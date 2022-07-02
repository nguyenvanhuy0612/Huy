package com.insight.handle_randompopup;

import org.openqa.selenium.WebDriver;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;

public class WebDriverProxy implements InvocationHandler {

    private final WebDriver driver;

    public WebDriverProxy(WebDriver driver) {
        this.driver = driver;
    }

    @Override
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
        //before invoking actual method check for the popup
        this.checkForPopupAndKill();
        //at this point, popup would have been closed if it had appeared. element action can be called safely now.
        Object result = method.invoke(driver, args);
        return result;
    }

    private void checkForPopupAndKill() {
        Common.sleep(10);
    }
}
