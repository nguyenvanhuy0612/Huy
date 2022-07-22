package com.practice.testng_demo3;

import java.io.FileInputStream;
import java.io.InputStream;
import java.lang.reflect.Method;
import java.util.Properties;

public class Huy_TestNGCustom {

    public static final String FILE_PATH = "src/test/java/com/practice/testng_demo3/run.properties";

    public static void main(String[] args) throws Exception{
        Properties properties = new Properties();
        InputStream inputStream = new FileInputStream(FILE_PATH);
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
