package com.temp;

import com.google.gson.Gson;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.testng.Assert;
import org.testng.annotations.Test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.concurrent.TimeUnit;

public class Test3 {


    @Test
    public void test13() {
        boolean a = true, b = false, c =  true;

        System.out.println("true && true: " + (true && true));
        System.out.println("true && false: " + (true && false));
        System.out.println("false && true: " + (false && true));
        System.out.println("false && false: " + (false && false));
        System.out.println();
        System.out.println("true || true: " + (true || true));
        System.out.println("true || false: " + (true || false));
        System.out.println("false || true: " + (false || true));
        System.out.println("false || false: " + (false || false));
        System.out.println();
        System.out.println("!(true && true): " + !(true && true));
        System.out.println("!(true && false)): " + !(true && false));
        System.out.println("!(false && true) " + !(false && true));
        System.out.println("!(false && false): " + !(false && false));
        System.out.println();
        System.out.println("!(true || true): " + !(true || true));
        System.out.println("!(true || false): " + !(true || false));
        System.out.println("!(false || true): " + !(false || true));
        System.out.println("!(false || false): " + !(false || false));

    }

    @Test
    public void test12() {

        boolean a = true, b = false, c =  true;

        System.out.println();



        System.out.println(false || false);



        Object test3 = new Test3();
        Object[][] data = new Object[][] {{test3}, {"val1"}, {"val2", "val3", "val4"}};

        Object[] data1 = new Object[] {"val1", "val2", "val3", test3};

        System.out.println(Arrays.deepToString(data));
    }


    @Test
    public void test11() {
        TreeMap<String, String> map = new TreeMap<>(String.CASE_INSENSITIVE_ORDER);

        HashMap<String, String> map1 = new HashMap<>();



        map.put("abc", "123");
        map.put("aBc", "222");
        map.put("abC", "333");

        System.out.println(map.get("abc"));
        System.out.println(map.get("abC"));

    }

    @Test
    public void test10() {
        String jsonString = "{'employee.name':'Bob','employee.salary':10000}";
        Gson gson = new Gson();
        Map map = gson.fromJson(jsonString, Map.class);
        Assert.assertEquals(2, map.size());
        Assert.assertEquals(Double.class, map.get("employee.salary").getClass());
    }

    @Test
    public void test9() {
        String dataraw = "{\"Call Pacing Type\":\"Preview\", \"Timed Preview\":\"Yes\", \"Preview Time\":\"30\", \"Can Cancel Preview\":\"Enable\", \"ACW Time\":\"30\", \"ACW extensions\":\"0\", \"Default Completion code\":\"DefaultACWCode\"}";
//        JSONObject jsonObject = new JSONObject(dataraw);
        Gson gson = new Gson();
        HashMap<String, String> map = gson.fromJson(dataraw, HashMap.class);

        System.out.println(map.get("Call Pacing Type"));


    }

    public Map<String, Object> jsonToMap(JSONObject json) throws JSONException {
        Map<String, Object> retMap = new HashMap<>();

        if(json != JSONObject.NULL) {
            retMap = toMap(json);
        }
        return retMap;
    }

    public HashMap<String, Object> toMap(JSONObject object) throws JSONException {
        HashMap<String, Object> map = new HashMap<>();

        Iterator<String> keysItr = object.keys();
        while(keysItr.hasNext()) {
            String key = keysItr.next();
            Object value = object.get(key);

            if(value instanceof JSONArray) {
                value = toList((JSONArray) value);
            }

            else if(value instanceof JSONObject) {
                value = toMap((JSONObject) value);
            }
            map.put(key, value);
        }
        return map;
    }

    public List<Object> toList(JSONArray array) throws JSONException {
        List<Object> list = new ArrayList<>();
        for(int i = 0; i < array.length(); i++) {
            Object value = array.get(i);
            if(value instanceof JSONArray) {
                value = toList((JSONArray) value);
            }

            else if(value instanceof JSONObject) {
                value = toMap((JSONObject) value);
            }
            list.add(value);
        }
        return list;
    }



    @Test
    public void test8() throws InterruptedException {
        System.out.println("b");
        TimeUnit.SECONDS.sleep(10);
        System.out.println("a");
        double x = 2.531231;

        long y = (long)(x * 1000);
        System.out.println(y);
    }

    @Test
    public void test7() {
        long start = new Date().getTime();
        System.out.println(start);
        sleep(3);
        long end = new Date().getTime();
        System.out.println(end);
        System.out.println(end-start);
        long s1 = currentTimeInSec();
        sleep(5);
        System.out.println(currentTimeInSec() - s1);
    }

    public long currentTimeInSec(){
        return new Date().getTime() / 1000;
    }

    @Test
    public void test6() {
        Set<String> data = Set.of("CDwindow-7AFA3A37312354256D10BF8B2C375DF9", "CDwindow-6DE83389FBF33945AD25B630E5340B3B]");
        System.out.println(data);
        ArrayList<String> data2 = new ArrayList<>(data);

        System.out.println(data2.get(1));

    }

    @Test
    public void test5() {
        Hashtable<String, String> data = new Hashtable<>();

        data.put("a", "a1");
        data.put("b", "b1");
        data.put("c", "c1");
        data.put("a", "d1");
        data.put("e", "e1");
    }

    @Test
    public void test4() throws ParseException {

        String text = "03/23/2022 02:54:3988 AM";
        final SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss aa");
        Calendar cal = Calendar.getInstance();
        cal.setTime(format.parse(text));
        Date date = cal.getTime();

        System.out.println(date);
        System.out.println();

        String text2 = "Mar-16-2022 00:00:00";
        final SimpleDateFormat format2 = new SimpleDateFormat("MMM-dd-yyyy HH:mm:ss");

        String result = format2.format(date);
        System.out.println("result = " + result);
        System.out.println(cal.get(Calendar.HOUR_OF_DAY));
    }

    @Test
    public void test3() {

        Hashtable<Object, Object> hashtable = new Hashtable<>();
        hashtable.put("COLUMN_1", "1");
        hashtable.put("COLUMN_2", "1");
        hashtable.put("COLUMN_3", "1");
        hashtable.put("COLUMN_4", "1");
        hashtable.put("COLUMN1_5", "1");
        hashtable.put("COLUMN1_53", "1");
        hashtable.put("COLUMN2_5", "1");
        hashtable.put("COLUMN12_5", "1");
        hashtable.entrySet().removeIf(e -> e.getKey().toString().startsWith("COLUMN_"));
        System.out.println();
    }


    @Test
    public void test2() {
        Pages pages = new Pages(1, "h");
        Utilities.p1 = pages;
        pages = new Pages(2, "b");
        Utilities.p2 = Utilities.p1;
        Utilities.p1 = new Pages(3, "c");
        System.out.println();

    }


    @Test
    public void test1() {
        HashMap<String, String> hashMap = new HashMap<>();
        String texts = "Reply Srinivas : Run -> Automation TC , Automation TCs: 30";
        for (String data : texts.split(","))
        {
            hashMap.put(data.split(":")[0].trim(), data.split(":")[1].trim());
        }
        System.out.println(hashMap);
    }

    public static void sleep(int sec){
        try {
            Thread.sleep(sec * 1000L);
        }catch (Exception ignored){}
    }
    public static void sleepInMilliSec(long sec){
        try {
            Thread.sleep(sec);
        }catch (Exception ignored){}
    }
}
