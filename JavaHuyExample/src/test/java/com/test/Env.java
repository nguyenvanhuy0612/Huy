package com.test;

import com.practice.bdd_testng_demo.lib.EnvSetup;
import org.openqa.selenium.WebDriver;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;

public class Env {
    public static WebDriver driver;
    public static WebDriver driver2;

    public static void sleep(long sec) {
        try {
            Thread.sleep(sec * 1000);
        } catch (InterruptedException e) {
            System.out.println("InterruptedException");
        }
    }

    public static void main(String[] args) {
        ClassLoader classLoader = EnvSetup.class.getClassLoader();
        System.out.println(classLoader);
        // get a file from the resource folder, root of classpath
        System.out.println(classLoader.getResourceAsStream("user.json"));

        File file = new File(".");
        ClassLoader classLoader2 = Thread.currentThread().getContextClassLoader();

        StackTraceElement[] stackTrace = Thread.currentThread().getStackTrace();

        System.out.println(Thread.currentThread().getStackTrace()[1].getClassName());

        String filePath = System.getProperty("user.dir") + "/" + Thread.currentThread().getStackTrace()[1].getClassName().replace(".", "/");

        System.out.println(filePath);

        Path currentRelativePath = Paths.get("");
        String s = currentRelativePath.toAbsolutePath().toString();
        System.out.println("Current absolute path is: " + s);

    }
}
