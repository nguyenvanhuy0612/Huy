package com.test;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class Test3 {
    public static void main(String[] args) {
        final SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy HH:mm");
        Calendar cal = Calendar.getInstance();
        System.out.println(cal.getTime().toString());
        String currTime = format.format(cal.getTime());
        System.out.println(currTime);
    }
}
