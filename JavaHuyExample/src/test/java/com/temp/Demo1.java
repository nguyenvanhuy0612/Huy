package com.temp;

import org.testng.annotations.Test;

import java.util.HashMap;
import java.util.Hashtable;

public class Demo1 {

    @Test
    public void test1() {
        Hashtable<String, String> lst1 = new Hashtable<>();

        lst1.put("1", "A");
        lst1.put("2", "B");
        lst1.put("3", "C");
        lst1.put("4", "D");

        String data = lst1.get("data");
        //System.out.println(data);

        String d1 = data == null ? "d1" : data;
        //System.out.println(d1);

        System.out.println(lst1.containsKey("1"));
        System.out.println(lst1.containsKey("2"));
        System.out.println(lst1.getOrDefault("2", "123"));


        HashMap<String, String> m1 = new HashMap<>();

        m1.put("1", "F");

        System.out.println(m1.getOrDefault("1", "A"));

        m1.putAll(lst1);

        System.out.println(m1);



    }

}
