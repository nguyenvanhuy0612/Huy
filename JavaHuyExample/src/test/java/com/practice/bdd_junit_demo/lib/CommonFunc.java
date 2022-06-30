package com.practice.bdd_junit_demo.lib;

import com.google.gson.JsonObject;
import org.openqa.selenium.chrome.ChromeDriver;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class CommonFunc {

    public static List<HashMap<String, String>> readExcelFile(String fileNamePath, String sheetName) {
        List<HashMap<String, String>> excelData = new ArrayList<>();
        // code to read excel file
        return excelData;
    }

    public static String getFromJson(JsonObject jsonObject, String key) {
        String value = "";
        return value;
    }

    public static void initChromeDriver() {
        EnvSetup.driver = new ChromeDriver();
    }


}
