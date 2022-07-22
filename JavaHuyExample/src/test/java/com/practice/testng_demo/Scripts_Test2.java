package com.practice.testng_demo;

import com.practice.log4j_demo.lib.InitLog4j2;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.testng.annotations.BeforeSuite;
import org.testng.annotations.DataProvider;
import org.testng.annotations.Listeners;
import org.testng.annotations.Test;

import java.util.HashMap;

@Listeners({Listener.class})
public class Scripts_Test2 {
    public static Logger log = LogManager.getLogger(Scripts_Test2.class);

    @DataProvider(name = "Authentication")
    public static Object[][] credentials() {
        HashMap<String, String> map00 = new HashMap<>();
        map00.put("Key00", "Value");
        map00.put("Key2", "Value2");
        map00.put("Key3", "Value3");
        HashMap<String, String> map01 = new HashMap<>();
        map01.put("Key01", "Value");
        map01.put("Key2", "Value2");
        map01.put("Key3", "Value3");
        HashMap<String, String> map10 = new HashMap<>();
        map10.put("Key10", "Value00");
        map10.put("Key2", "Value2");
        map10.put("Key3", "Value3");
        HashMap<String, String> map11 = new HashMap<>();
        map11.put("Key11", "Value00");
        map11.put("Key2", "Value2");
        map11.put("Key3", "Value3");
        Object[][] objects = new Object[2][2];
        objects[0][0] = map00;
        objects[0][1] = map01;
        objects[1][0] = map10;
        objects[1][1] = map11;
        return objects;
    }

    @DataProvider(name = "dataProvider1")
    public static Object[][] dataProvider1() {
        HashMap<String, String> map00 = new HashMap<>();
        map00.put("Key00", "Value");
        map00.put("Key2", "Value2");
        map00.put("Key3", "Value3");
        Object[][] objects = new Object[1][1];
        objects[0][0] = map00;
        return objects;
    }

    @BeforeSuite
    public void initLog() {
        System.setProperty("log_filename", "Test");
        InitLog4j2.config();
    }

    @Test(dataProvider = "Authentication", dataProviderClass = Scripts_Test2.class)
    public void test1(HashMap<String, String> testData) {
        log.info(Thread.currentThread().getStackTrace()[1].getMethodName());
        System.out.println(testData);
    }

    @Test(dataProvider = "Authentication", dataProviderClass = Scripts_Test2.class)
    public void test2(HashMap<String, String>[] testData) {
        log.info(Thread.currentThread().getStackTrace()[1].getMethodName());
        System.out.println(testData);
    }

    @Test(dataProvider = "dataProvider1", dataProviderClass = Scripts_Test2.class)
    public void test3(HashMap<String, String> testData) {
        log.info(Thread.currentThread().getStackTrace()[1].getMethodName());
        System.out.println(testData);
    }

    @Test(dataProvider = "dataProvider1", dataProviderClass = Scripts_Test2.class)
    public void test4(HashMap<String, String>[] testData) {
        log.info(Thread.currentThread().getStackTrace()[1].getMethodName());
        System.out.println(testData);
    }
}
