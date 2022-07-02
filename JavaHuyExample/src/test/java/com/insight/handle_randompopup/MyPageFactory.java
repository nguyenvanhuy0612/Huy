package com.insight.handle_randompopup;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;

import java.lang.reflect.Field;

public class MyPageFactory {

    public static <T> T initElements(WebDriver driver, Class<T> pageObject) {

        //first init elements
        T page = PageFactory.initElements(driver, pageObject);

        //then access all the WebElements and create a wrapper
        for (Field field : page.getClass().getDeclaredFields()) {
            if (field.getType().equals(WebElement.class)) {
                try {
                    field.setAccessible(true);
                    //reset the webElement with proxy object
                    field.set(page, ElementGuard.guard((WebElement) field.get(page)));
                } catch (IllegalAccessException var10) {
                    throw new RuntimeException(var10);
                }
            }
//            if (field.getType().equals(WebDriver.class)) {
//                try {
//                    field.setAccessible(true);
//                    //reset the webElement with proxy object
//                    field.set(page, ElementGuard.guard((WebDriver) field.get(page)));
//                }catch (IllegalAccessException var10){
//                    throw new RuntimeException(var10);
//                }
//            }
        }
        return page;
    }
}
