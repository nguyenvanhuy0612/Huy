package com.temp;

import com.google.common.reflect.TypeToken;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import org.testng.annotations.Test;

import java.lang.reflect.Type;

public class JsonTest {

    @Test
    public void t1() {
        JsonObject jsonObject = new JsonObject();

        jsonObject.addProperty("name", "123");

        jsonObject.add("gzFileList", new JsonArray());


        jsonObject.get("gzFileList").getAsJsonArray().add("file1");
        jsonObject.get("gzFileList").getAsJsonArray().add("file2");
        jsonObject.get("gzFileList").getAsJsonArray().add("file3");
        jsonObject.get("gzFileList").getAsJsonArray().add("file4");
        System.out.println();


        int i = jsonObject.get("name").getAsInt();
        Integer i1 = jsonObject.get("name").getAsInt();
        Long i2 = jsonObject.get("name").getAsLong();

    }

    public static void main(String[] args) {
        Student std = new Student();
        std.age = 20;
        std.name = "Huy";

        Gson gson = new Gson();

        String stdJsonText = gson.toJson(std);

        System.out.println(stdJsonText);

        // text to object
        //1. declare object type
        Type objType = new TypeToken<Student>() {
        }.getType();

        //2. convert json text -> object
        Student std2 = gson.fromJson(stdJsonText, objType);

        std2.print();


    }
}

class Student {
    public String name;
    public int age;

    public void print() {
        System.out.println("name: " + this.name + ", age = " + this.age);
    }
}