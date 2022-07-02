package com.insight.common_func_collection;

import java.io.*;
import java.util.Properties;

public class Utility {

    public static Properties readProperties(String fileNamePath) {
        try (InputStream input = new FileInputStream(fileNamePath)) {
            Properties prop = new Properties();

            // load a properties file
            prop.load(input);

            // get the property value and print it out
//            System.out.println(prop.getProperty("db.url"));
//            System.out.println(prop.getProperty("db.user"));
//            System.out.println(prop.getProperty("db.password"));

            return prop;
        } catch (IOException ex) {
            ex.printStackTrace();
            return null;
        }
    }

    public static void writeProperties(String fileNamePath, String key, String value) {
        try (OutputStream output = new FileOutputStream(fileNamePath)) {
            Properties prop = new Properties();

            // set the properties value
//            prop.setProperty("db.url", "localhost");
//            prop.setProperty("db.user", "mkyong");
//            prop.setProperty("db.password", "password");
            prop.setProperty(key, value);

            // save properties to project root folder
            prop.store(output, null);

            System.out.println(prop);

        } catch (IOException e) {
            e.printStackTrace();
        }


    }

    @SuppressWarnings("unchecked")
    private static <T extends Throwable> void throwException(Throwable exception, Object object) throws T {
        throw (T) exception;
    }

    public static void throwException(Throwable exception) {
        Utility.throwException(exception, null);
    }

    public static void wait(int sec) {
        try {
            Thread.sleep(sec * 1000L);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public static void wait(double sec) {
        try {
            Thread.sleep((long) (sec * 1000));
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
