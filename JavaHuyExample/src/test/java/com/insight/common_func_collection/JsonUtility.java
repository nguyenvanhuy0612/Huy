package com.insight.common_func_collection;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonWriter;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class JsonUtility {

    public static JsonElement stringToJson(String jsonData) {
        return JsonParser.parseString(jsonData);
    }

    public static void parseJson(Object obj, String fileNamePath) {
        Gson gson = new Gson();
        try {
            // 1. Java object to JSON file
            gson.toJson(obj, new FileWriter(fileNamePath));
            // 2. Java object to JSON string
            String json = gson.toJson(obj);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void readJsonFile(String fileNamePath) {
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

    public static void writeJsonToFile(String fileNamePath) {

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
