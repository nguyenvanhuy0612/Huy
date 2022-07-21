package com.practice.testng_demo2;

import java.io.FileInputStream;
import java.io.InputStream;
import java.lang.reflect.Method;
import java.util.Properties;

public class Huy_TestNGCustom {

    public static void main(String[] args) throws Exception{
        Properties properties = new Properties();
        InputStream inputStream = new FileInputStream("src/test/java/com/practice/testng_demo2/run.properties");
        properties.load(inputStream);
        inputStream.close();

        Class<?> clazz = Class.forName(properties.getProperty("class"));
        Object object = clazz.getDeclaredConstructor().newInstance();

        for (Method method : object.getClass().getMethods()) {
            if (method.isAnnotationPresent(PerformIt.class) && method.getName().contentEquals(properties.getProperty("method"))){
                PerformIt annotation = method.getAnnotation(PerformIt.class);
                String value = annotation.value();
                method.invoke(object);
            }
        }
    }

}
