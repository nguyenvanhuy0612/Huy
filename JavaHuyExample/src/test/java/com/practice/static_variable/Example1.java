package com.practice.static_variable;

import java.util.HashMap;

public class Example1 {
    public static String defString;

    public Object object;

    public static void main(String[] args) {
        Example1 example1 = new Example1();
        HashMap<String, Object> map = new HashMap<>();
        example1.object = "str";
        map.put("obj", example1.object);
        example1.object = "123";
    }

    public static void addString(String data) {
        System.out.println(data);
        data = "null";
    }

    public static void main1(String[] args) {
        defString = "def";
        addString(defString);
    }

    public HashMap<String, Object> getData() {
        return null;
    }
}
