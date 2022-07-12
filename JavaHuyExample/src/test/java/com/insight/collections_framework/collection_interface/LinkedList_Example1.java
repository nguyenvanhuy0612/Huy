package com.insight.collections_framework.collection_interface;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedList;

public class LinkedList_Example1 {

    public static void main(String[] args) {
        // linked list order
        LinkedList<String> listName = new LinkedList<>();
        listName.add("A");
        listName.add("E");
        listName.add("B");
        listName.add("C");
        listName.add("D");

        listName.forEach(System.out::println);

        ArrayList<String> arrayListName = new ArrayList<>();
        arrayListName.add("A");
        arrayListName.add("E");
        arrayListName.add("B");
        arrayListName.add("C");
        arrayListName.add("D");

        arrayListName.forEach(System.out::println);

        LinkedHashMap<String, String> linkedHashMap = new LinkedHashMap<>();
        linkedHashMap.put("k4", "v4");
        linkedHashMap.put("k2", "v2");
        linkedHashMap.put("k1", "v1");
        linkedHashMap.put("k3", "v3");

        //linkedHashMap.remove("k4");

        linkedHashMap.forEach((k, v) -> System.out.println(k + " - " + v));

        HashMap<String, String> hashMap = new HashMap<>();
        hashMap.put("k4", "v4");
        hashMap.put("k2", "v2");
        hashMap.put("k1", "v1");
        hashMap.put("k3", "v3");

        //hashMap.remove("k4");

        hashMap.forEach((k, v) -> System.out.println(k + " - " + v));
    }
}
