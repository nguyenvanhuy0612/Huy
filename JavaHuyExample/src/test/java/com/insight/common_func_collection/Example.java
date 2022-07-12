package com.insight.common_func_collection;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;

public class Example {

    public static void main(String[] args) throws FileNotFoundException {
        String fileNamePath = System.getProperty("user.dir") + "/src/test/resources/user.json";
        String fileNamePath2 = System.getProperty("user.dir") + "/src/test/resources/user3.json";
        JsonElement jsonElement = JsonUtility.readFileToJsonElement(fileNamePath);
        JsonUtility.writeJsonElementToFile(jsonElement, fileNamePath2);
        JsonElement jsonElement1 = JsonParser.parseReader(new FileReader(fileNamePath));
        System.out.println(jsonElement1);
    }

    public static void main4(String[] args) {
        String fileNamePath = System.getProperty("user.dir") + "/src/test/java/com/data/WorkspaceCCaaS.xlsx";
        HashMap<String, List<HashMap<String, String>>> results = ExcelUtility.readExcelFile(fileNamePath);
        System.out.println(results);

        HashMap<String, String> resultMap = ExcelUtility.readExcelFile(fileNamePath, "Agent", "Verify agent cannot complete dial when do not select completion code");
        System.out.println(resultMap);
    }

    public static void main3(String[] args) {
        InputStream inputStream = Example.class.getClassLoader().getResourceAsStream("user.json");
        JsonUtility.writeJsonToFile_Test(System.getProperty("user.dir") + "/src/test/resources/user111.json");
    }

    public static void main2(String[] args) {
        //XMLUtility utility = new XMLUtility();
        String file = System.getProperty("user.dir") + "/src/test/resources/staff.xml";
        XMLUtility.readXMLFile_Test(file);
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
