package com.temp;

import org.testng.annotations.Test;

import java.util.HashMap;
import java.util.Hashtable;

public class Demo1 {

    @Test
    public void test1() {
        Hashtable<String, String> lst1 = new Hashtable<>();

        lst1.put("1", "F");

        String data = lst1.get("data");
        //System.out.println(data);

        String d1 = data == null ? "d1" : data;
        //System.out.println(d1);

        System.out.println(lst1.containsKey("1"));
        System.out.println(lst1.containsKey("2"));
        System.out.println(lst1.getOrDefault("2", "123"));



        HashMap<String, String> m1 = new HashMap<>();




    }

}
