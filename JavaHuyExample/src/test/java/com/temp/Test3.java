package com.temp;

import org.testng.annotations.Test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;

public class Test3 {

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
}
