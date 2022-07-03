package com.practice.test;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.insight.common_func_collection.EnvSetup;
import com.insight.common_func_collection.FileUtility;
import com.insight.common_func_collection.JsonUtility;
import com.insight.common_func_collection.XMLUtility;
import org.openqa.selenium.json.Json;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class XML_Test_Strategy {

    public static void processObject(JsonObject jsonObject) {
        Map<String, String> propertiesMap = jsonObject.entrySet().stream()
                .filter(entry -> entry.getValue().isJsonPrimitive())
                .collect(Collectors.toMap(Map.Entry::getKey, entry -> entry.getValue().getAsString()));
        Map<String, JsonObject> jsonObjectMap = jsonObject.entrySet().stream()
                .filter(entry -> entry.getValue().isJsonObject())
                .collect(Collectors.toMap(Map.Entry::getKey, entry -> entry.getValue().getAsJsonObject()));

        System.out.println(propertiesMap);
        System.out.println(jsonObjectMap);


//        for (Map.Entry<String, JsonElement> entry : jsonObject.entrySet()) {
//            String key = entry.getKey();
//            JsonElement value = entry.getValue();
//            System.out.println("Key: " + key + "\t value: " + value);
//
//            if (value.isJsonObject()) {
//                // Process Click (or add) Key
//
//                processObject(value.getAsJsonObject());
//            } else if (value.isJsonArray()) {
//                System.out.println("process array");
//            } else if (value.isJsonPrimitive()) {
//                System.out.println("process primitive");
//                processPrimitive(key, value.getAsString());
//            }
//        }
    }

    public static void processPrimitive(String key, String value) {
        // set
        System.out.println(key + " - " + value);
    }

    public static String convertData(String name) {
        if (name.equals("action")) {
            return "call";
        } else if (name.equals("#document")) {
            return "campaignstrategy";
        }
        return name;
    }

    public static void main(String[] args) {
        String file = EnvSetup.USERDIR + "/src/test/java/com/practice/test/CC_SimpleCalltest.xml";
        String fileContent = FileUtility.readFileAsString(file);
        fileContent = fileContent.substring(fileContent.indexOf("<?"), fileContent.length() - 1);

        JsonElement jsonElement = XMLUtility.xmlToJson(fileContent);

        List<JsonElement> handlers = new ArrayList<>();
        JsonUtility.findJsonElement(jsonElement, "Handler", handlers);

        JsonObject jsonObjectHandler = handlers.get(0).getAsJsonObject();

        jsonObjectHandler.entrySet().forEach(entry -> {
            if (entry.getValue().isJsonObject()) {
                System.out.println("process obj");
            } else if (entry.getValue().isJsonArray()) {
                System.out.println("process array");
            } else if (entry.getValue().isJsonPrimitive()) {
                System.out.print("process primitive: ");
                System.out.println(entry.getKey() + " - " + entry.getValue().getAsString());
            }
        });


        for (int i = 0; i < handlers.size(); i++) {
            JsonElement handler = handlers.get(i);
            // Process Handler i with key (click to handler)
            System.out.println(handler);
            processObject(handler.getAsJsonObject());

//            if (handler.isJsonObject()) {
//                System.out.println("process obj: " + handler);
//
//            } else if (handler.isJsonArray()) {
//                System.out.println("process array: " + handler);
//
//            } else if (handler.isJsonPrimitive()) {
//                System.out.print("process primitive: " + handler);
//
//            }

        }

        //JsonObject jsonObject = jsonElement.getAsJsonObject();

        System.out.println();
    }
}
