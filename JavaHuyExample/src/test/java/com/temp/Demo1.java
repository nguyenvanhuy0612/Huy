package com.temp;

import com.google.gson.Gson;
import org.json.JSONArray;
import org.json.JSONObject;
import org.testng.annotations.Test;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Demo1 {

    @Test
    public void test7() {
        String callbackPhoneNumberSelected = "";
        String currentSelect = "(Phone 12) +13035383840 Etc/UTC";
        Matcher matcher = Pattern.compile("(\\+?\\d{3,}[^)( ])").matcher(currentSelect);
        if (matcher.find()) {
            callbackPhoneNumberSelected = matcher.group(1);
            System.out.println("The current selected phone number is : " + callbackPhoneNumberSelected);
        }
    }


    @Test
    public void test6() {
        System.out.println(String.format("value is %2.0f", 32.33434));
        System.out.println(String.format("value is %2.0f", 32.33434));
    }

    @Test
    public void test5() throws ParseException {
        final DateFormat format = new SimpleDateFormat("MM/dd/yyyy HH:mm");
        String example = "11/18/2021 22:56";
        Date date = format.parse(example);
//        System.out.println(date.getHours());
//        System.out.println(date.getMinutes());
//        System.out.println(date);
//        System.out.println(format.format(date));


        Calendar cal = Calendar.getInstance();

        System.out.println(cal.getTime());

        cal.setTime(date);
        cal.add(Calendar.MINUTE, 3);



        System.out.println(cal.get(Calendar.MINUTE));
        System.out.println(cal.get(Calendar.HOUR_OF_DAY));

        String out = format.format(cal.getTime());
        System.out.println(out.substring(0, 10));


        System.out.println(example.substring(0, 10));

        cal.setTime(format.parse("01/02/2020 10:40"));
        System.out.println(format.format(cal.getTime()));


    }

    @Test
    public void test4() {
        new A().show();
    }


    @Test
    public void test3() {
        String jsonString = "{\"pageInfo\":{\"pageName\":\"abc\",\"pagePic\":\"http://example.com/content.jpg\"},\"posts\":[{\"post_id\":\"123456789012_123456789012\",\"actor_id\":\"1234567890\",\"picOfPersonWhoPosted\":\"http://example.com/photo.jpg\",\"nameOfPersonWhoPosted\":\"JaneDoe\",\"message\":\"Soundscool.Can'twaittoseeit!\",\"likesCount\":\"2\",\"comments\":[],\"timeOfPost\":\"1234567890\"}]}";
        //System.out.println(jsonString);

        Gson gson = new Gson();

        JSONObject obj = new JSONObject(jsonString);
        System.out.println(obj.toString(4));

        String pageName = obj.getJSONObject("pageInfo").getString("pageName");
        System.out.println("pageName : " + pageName);

        JSONArray posts = obj.getJSONArray("posts");
        System.out.println(posts.toString(4));

    }


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


class A {
    public void show() {
        System.out.println("Class A");
    }
}