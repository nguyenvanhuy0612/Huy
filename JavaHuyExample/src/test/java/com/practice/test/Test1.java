package com.practice.test;

import io.github.bonigarcia.wdm.WebDriverManager;
import org.apache.commons.lang3.SerializationUtils;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.Arrays;
import java.util.List;

public class Test1 {

    public static void main(String[] args) {
        WebDriverManager.chromedriver().setup();
        WebDriver driver1 = new ChromeDriver();
        WebDriver driver2 = (WebDriver) cloneObject(driver1);
        System.out.println();
    }

    public static void main2(String[] args) {
        System.out.println("Test 1");
        List<String> name = Arrays.asList("huy", "123");
        Employee employee = new Employee();
        WebDriverManager.chromedriver().setup();
        WebDriver driver1 = new ChromeDriver();
        WebDriverClone clone = new WebDriverClone(driver1);
        WebDriverClone driverClone = SerializationUtils.clone(clone);
        WebDriver driver2 = driverClone.driver;
    }

    private static Object cloneObject(Object obj) {
        // not correct
        try {
            Object clone = obj.getClass().getDeclaredConstructor().newInstance();
            //Object clone = obj.getClass().newInstance();
            for (Field field : obj.getClass().getDeclaredFields()) {
                field.setAccessible(true);
                if (field.get(obj) == null || Modifier.isFinal(field.getModifiers())) {
                    continue;
                }
                if (field.getType().isPrimitive() || field.getType().equals(String.class)
                        || field.getType().getSuperclass().equals(Number.class)
                        || field.getType().equals(Boolean.class)) {
                    field.set(clone, field.get(obj));
                } else {
                    Object childObj = field.get(obj);
                    if (childObj == obj) {
                        field.set(clone, clone);
                    } else {
                        field.set(clone, cloneObject(field.get(obj)));
                    }
                }
            }
            return clone;
        } catch (Exception e) {
            return null;
        }
    }
}
