package com.practice.testng_demo_full;

import org.testng.ITestContext;
import org.testng.annotations.DataProvider;

import java.lang.reflect.Method;
import java.util.HashMap;

import static java.lang.System.out;

public class DataUtils {

    @DataProvider(name = "newMap")
    public static Object[][] dpHashMap() {
        out.format("Class: %s \nMethod: %s\n", DataUtils.class.getSimpleName(), Thread.currentThread().getStackTrace()[1].getMethodName());
        HashMap<String, String> map00 = new HashMap<>();
        map00.put("Key00", "Value");
        map00.put("Key2", "Value2");
        map00.put("Key3", "Value3");
        Object[][] objects = new Object[1][1];
        objects[0][0] = map00;
        return objects;
    }

    @DataProvider(name = "methodProvider")
    public static Object[][] dpMethodProvider(Method method) {
        out.format("Class: %s \nMethod: %s\n", DataUtils.class.getSimpleName(), Thread.currentThread().getStackTrace()[1].getMethodName());
        out.println(method.getName());
        Object[][] objects = new Object[1][1];
        objects[0][0] = method.getName();
        return objects;
    }

    @DataProvider(name = "ITestContextProvider")
    public static Object[][] dpITestContextProvider(ITestContext iTestContext) {
        out.format("Class: %s \nMethod: %s\n", DataUtils.class.getSimpleName(), Thread.currentThread().getStackTrace()[1].getMethodName());
        out.println(iTestContext.getName());
        Object[][] objects = new Object[1][1];
        objects[0][0] = iTestContext.getName();
        return objects;
    }

    @DataProvider(name = "StringProvider")
    public static Object[][] dpStringProvider() {
        out.format("Class: %s \nMethod: %s\n", DataUtils.class.getSimpleName(), Thread.currentThread().getStackTrace()[1].getMethodName());
        Object[][] objects = new Object[2][10];
        objects[0] = new String[]{"Huy", "nguyen", "1994", "HUy1111"};
        //objects[0][1] = "4444";
        objects[0][2] = "5555";
        objects[0][3] = "6666";
        objects[1][4] = "7777";
        objects[1][9] = "9999";
        return objects;
    }

    @DataProvider(name = "SingleStringProvider")
    public static Object[][] dpSingleStringProvider() {
        out.format("Class: %s \nMethod: %s\n", DataUtils.class.getSimpleName(), Thread.currentThread().getStackTrace()[1].getMethodName());
        Object[][] objects = new Object[1][1];
        objects[0][0] = "Huy";
        return objects;
    }
}
