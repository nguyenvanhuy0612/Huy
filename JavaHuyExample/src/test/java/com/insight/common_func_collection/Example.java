package com.insight.common_func_collection;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.google.gson.internal.LinkedTreeMap;
import org.apache.commons.io.FileUtils;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.*;

public class Example {

    public static void main(String[] args) {
        String fileNamePath = System.getProperty("user.dir") + "/src/test/resources/file.xlsx";
        String[][] data = new String[][]{
                new String[]{"Name", "Age"},
                new String[]{"Huy", "20"}
        };

        //ArrayList<String> lists = (ArrayList<String>) Arrays.asList("");
        List<String> list = new ArrayList<>();
        list.toArray();
        ExcelUtility.writeToFile(data, fileNamePath, "sheel1");
    }

    public static void main5(String[] args) throws IOException {
        String fileNamePath = System.getProperty("user.dir") + "/src/test/resources/user.json";
        String fileNamePath2 = System.getProperty("user.dir") + "/src/test/resources/user2.json";
        JsonElement jsonElement = JsonUtility.readFileToJsonElement(fileNamePath);
        //JsonUtility.writeJsonElementToFile(jsonElement, fileNamePath2);
        JsonElement jsonElement1 = JsonParser.parseReader(new FileReader(fileNamePath));
        System.out.println(jsonElement1);

        String fileStr1 = FileUtility.readFileAsString(fileNamePath);
        String fileStr2 = FileUtils.readFileToString(new File(fileNamePath2), StandardCharsets.UTF_8);

        HashMap<String, Object> fileMap2 = JsonUtility.jsonStringToMap(fileStr2);
        LinkedHashMap<String, Object> fileLinkedMap2 = JsonUtility.jsonStringToLinkedHashMap(fileStr2);
        System.out.println(fileMap2);
        TreeMap treeMap = new TreeMap();
        LinkedTreeMap linkedTreeMap = new LinkedTreeMap();
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
