package com.test;

import com.google.gson.JsonElement;
import com.google.gson.JsonNull;
import com.google.gson.JsonObject;
import com.insight.common_func_collection.JsonUtility;

public class Json_Test {
    public static void main(String[] args) {
        String filePath = "src/test/resources/temp/txtJson.json";
        JsonObject jsonObject = JsonUtility.parseFileToJsonObject(filePath);
        System.out.println(jsonObject);
        jsonObject.remove("abc");
        jsonObject.add("timeBasedFinishCriteria", JsonNull.INSTANCE);
        System.out.println(jsonObject);
        String data = jsonObject.toString().replaceAll("\"null\"", "null");
        System.out.println(data);
    }
}
