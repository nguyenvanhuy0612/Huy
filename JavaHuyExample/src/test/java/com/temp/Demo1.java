package com.temp;

import org.testng.annotations.Test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Demo1 {


    @Test
    public void test2() {
        final String regex = "\\{[^\\{\\}]+\\}";
        final String string = "{group1:ID|=|1}, {group2:ID|=|1}, {group3:ID|=|1}\n"
                + "{group1:ID|=|1}, {{group2:ID|=|1}, {group3:ID|=|1}}\n"
                + "{{group2:ID|=|1}, {group3:ID|=|1}}, {group1:ID|=|1}";

        final Pattern pattern = Pattern.compile(regex, Pattern.MULTILINE);
        final Matcher matcher = pattern.matcher(string);

        ArrayList<String> lst = new ArrayList<>();

        while (matcher.find()) {
            //System.out.println("Full match: " + matcher.group(0));
            lst.add(matcher.group().replaceAll("[\\{\\}]", ""));
            for (int i = 1; i <= matcher.groupCount(); i++) {
                //System.out.println("Group " + i + ": " + matcher.group(i));
            }
        }

        System.out.println(lst);





    }


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
