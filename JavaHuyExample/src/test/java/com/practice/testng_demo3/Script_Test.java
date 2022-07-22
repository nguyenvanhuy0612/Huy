package com.practice.testng_demo3;

import java.io.FileInputStream;
import java.io.InputStream;
import java.lang.reflect.Method;
import java.util.Properties;

public class Script_Test {

    public static final String FILE_PATH = "src/test/java/com/practice/testng_demo3/run.properties";

    public static void main(String[] args) throws Exception {

        Properties properties = new Properties();
        InputStream inputStream = new FileInputStream(FILE_PATH);
        properties.load(inputStream);
        inputStream.close();

        Class<?> clazz = Class.forName(properties.getProperty("class"));
        Object object = clazz.getDeclaredConstructor().newInstance();

        Method method = object.getClass().getMethod(properties.getProperty("method"));

        // Listener
        boolean testStatus = true;
        try {
            method.invoke(object);
        } catch (Exception e) {
            e.printStackTrace();
            testStatus = false;
        }
        System.out.println("testStatus: " + testStatus);
    }

    public static void main3(String[] args) throws Exception {

        Properties properties = new Properties();
        InputStream inputStream = new FileInputStream(FILE_PATH);
        properties.load(inputStream);
        inputStream.close();

        Class<?> clazz = Class.forName(properties.getProperty("class"));
        Object object = clazz.getDeclaredConstructor().newInstance();

        Method method = object.getClass().getMethod(properties.getProperty("method"));
        method.invoke(object);

        for (Method m : object.getClass().getMethods()) {
            //System.out.println(m.getName());
            System.out.println(m);
        }
    }

    public static void main2(String[] args) throws Exception {

        YoutubeTest youtubeTest = new YoutubeTest();
        FacebookTest facebookTest = new FacebookTest();
        GoogleTest googleTest = new GoogleTest();

        Method method = youtubeTest.getClass().getMethod("verifySearch");
        method.invoke(youtubeTest);

        method = facebookTest.getClass().getMethod("verifyLogin");
        method.invoke(facebookTest);

        method = googleTest.getClass().getMethod("gmailSpamTest");
        method.invoke(googleTest);
    }

    public static void main1(String[] args) {

        YoutubeTest youtubeTest = new YoutubeTest();
        FacebookTest facebookTest = new FacebookTest();
        GoogleTest googleTest = new GoogleTest();

        youtubeTest.verifySearch();
        facebookTest.verifyLogin();
        googleTest.gmailSpamTest();
        youtubeTest.seachMusicHiFi();
    }


}
