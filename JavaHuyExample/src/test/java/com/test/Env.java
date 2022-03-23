package com.test;

import org.openqa.selenium.WebDriver;

public class Env {
    public static WebDriver driver;
    public static WebDriver driver2;

    public static void sleep(long sec){
        try {
            Thread.sleep(sec * 1000);
        }catch (InterruptedException e){
            System.out.println("InterruptedException");
        }
    }
}
