package com.practice.bdd_demo.lib;

import org.openqa.selenium.WebDriver;

public class EnvSetup {

    public static WebDriver WEBDRIVER;
    public static WebDriver WEBDRIVER1;
    public static WebDriver WEBDRIVER2;

    public final static String DATA_PATH = System.getProperty("user.dir") + "/src/test/java/com/bdd_demo/data";
    public final static String FEATURE_PATH = System.getProperty("user.dir") + "/src/test/java/com/bdd_demo/feature";
    public final static String LIB_PATH = System.getProperty("user.dir") + "/src/test/java/com/bdd_demo/lib";
    public final static String SCRIPTS_PATH = System.getProperty("user.dir") + "/src/test/java/com/bdd_demo/scripts";
    public final static String STEPS_PATH = System.getProperty("user.dir") + "/src/test/java/com/bdd_demo/steps";

}
