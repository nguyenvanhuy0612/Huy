package com.insight.common_func_collection;

import com.google.gson.*;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonWriter;

import java.io.*;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class JsonUtility {
    public static Gson gson;

    static {
        gson = new GsonBuilder().setPrettyPrinting().create();
    }

    public static void findJsonElement(JsonElement jsonElement, String key, List<JsonElement> result) {
        if (jsonElement.isJsonArray()) {
            for (JsonElement jsonElement1 : jsonElement.getAsJsonArray()) {
                findJsonElement(jsonElement1, key, result);
            }
        } else if (jsonElement.isJsonObject()) {
            Set<Map.Entry<String, JsonElement>> entrySet = jsonElement.getAsJsonObject().entrySet();
            for (Map.Entry<String, JsonElement> entry : entrySet) {
                if (entry.getKey().equals(key)) {
                    result.add(entry.getValue());
                }
                findJsonElement(entry.getValue(), key, result);
            }
        } else {
            if (jsonElement.toString().equals(key)) {
                result.add(jsonElement);
            }
        }
    }


    public static JsonElement parseStrToJson(String jsonData) {
        return JsonParser.parseString(jsonData);
    }

    public static JsonElement stringToJsonElement(String jsonString) {
        return gson.fromJson(jsonString, JsonElement.class);
    }

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    public static void writeObjectToFile(Object obj, String fileNamePath) {
        try (Writer writer = new FileWriter(fileNamePath)) {
            // 1. Java object to JSON file
            gson.toJson(obj, writer);
            // 2. Java object to JSON string
            // String json = gson.toJson(obj);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void writeJsonElementToFile(JsonElement jsonElement, String fileNamePath) {
        try (Writer writer = new FileWriter(fileNamePath)) {
            // write json element to file fileNamePath
            gson.toJson(jsonElement, writer);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void writeJsonObjectToFile(JsonObject jsonObject, String fileNamePath) {
        try (Writer writer = new FileWriter(fileNamePath)) {
            // write json object to file fileNamePath
            gson.toJson(jsonObject, writer);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    public static JsonElement readFileToJsonElement(String fileNamePath) {
        try {
            return gson.fromJson(new FileReader(fileNamePath), JsonElement.class);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static JsonElement parseFileToJson(String fileNamePath) {
        try {
            return JsonParser.parseReader(new FileReader(fileNamePath));
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static JsonObject parseFileToJsonObject(String fileNamePath) {
        try {
            JsonElement jsonElement = JsonParser.parseReader(new FileReader(fileNamePath));
            if (jsonElement.isJsonObject())
                return jsonElement.getAsJsonObject();
            else if (jsonElement.isJsonArray() | jsonElement.isJsonPrimitive()) {
                JsonObject jsonObject = new JsonObject();
                jsonObject.add("data", jsonElement);
                return jsonObject;
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void readJsonFile_Test(String fileNamePath) {
        // just example
        try (JsonReader reader = new JsonReader(new FileReader(fileNamePath))) {
            reader.beginObject();

            while (reader.hasNext()) {

                String name = reader.nextName();

                if (name.equals("name")) {

                    System.out.println(reader.nextString());

                } else if (name.equals("age")) {

                    System.out.println(reader.nextInt());

                } else if (name.equals("messages")) {

                    // read array
                    reader.beginArray();

                    while (reader.hasNext()) {
                        System.out.println(reader.nextString());
                    }

                    reader.endArray();

                } else {
                    reader.skipValue(); //avoid some unhandle events
                }
            }

            reader.endObject();

        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    public static void writeJsonToFile_Test(String fileNamePath) {

        // just example
        try (JsonWriter writer = new JsonWriter(new FileWriter(fileNamePath))) {

            writer.beginObject();                   // {
            writer.name("name").value("mkyong");    // "name" : "mkyong"
            writer.name("age").value(29);           // "age" : 29

            writer.name("messages");                // "messages" :
            writer.beginArray();                    // [
            writer.value("msg 1");                  // "msg 1"
            writer.value("msg 2");                  // "msg 2"
            writer.value("msg 3");                  // "msg 3"
            writer.endArray();                      // ]

            writer.endObject();                     // }

        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
