package com.huy.practice.pomDemo.lib;

import org.openqa.selenium.WebDriver;

public class EnvSetup {
    public static WebDriver driver;
    public static WebDriver driver1;
    public static WebDriver driver2;
    public static WebDriver driver3;

    public static int implicitWaitSec;
    public static int explicitWaitSec;

    static {
        implicitWaitSec = 30;
        explicitWaitSec = 60;
    }
}
