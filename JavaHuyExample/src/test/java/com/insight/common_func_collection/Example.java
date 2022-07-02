package com.insight.common_func_collection;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class Example {

    public static void main3(String[] args) {
        InputStream inputStream = Example.class.getClassLoader().getResourceAsStream("user.json");
        JsonUtility.writeJsonToFile(System.getProperty("user.dir") + "/src/test/resources/user.json");
    }

    public static void main2(String[] args) {
        XMLUtility utility = new XMLUtility();
        String file = System.getProperty("user.dir") + "/src/test/resources/staff.xml";
        XMLUtility.readXMLFile(file);
    }


    public static void main1(String[] args) {
        try (InputStream input = Example.class.getClassLoader().getResourceAsStream("config.properties")) {

            Properties prop = new Properties();

            if (input == null) {
                System.out.println("Sorry, unable to find config.properties");
                return;
            }

            //load a properties file from class path, inside static method
            prop.load(input);

            //get the property value and print it out
            System.out.println(prop.getProperty("db.url"));
            System.out.println(prop.getProperty("db.user"));
            System.out.println(prop.getProperty("db.password"));

        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }

}
