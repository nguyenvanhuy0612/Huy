package com.insight.time;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;

public class PracticeTime {
    public static void main(String[] args) {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();
        System.out.println(dtf.format(now));

        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        Date date = new Date();
        System.out.println(formatter.format(date));

        System.out.println(java.time.LocalDate.now());

        System.out.println(java.time.LocalTime.now());

        System.out.println(java.time.LocalDateTime.now());

        System.out.println(java.time.Clock.systemUTC().instant());

        java.util.Date date2 = new java.util.Date();
        System.out.println(date2);

        long millis3 = System.currentTimeMillis();
        java.util.Date date3 = new java.util.Date(millis3);
        System.out.println(date3);

        long millis4 = System.currentTimeMillis();
        java.sql.Date date4 = new java.sql.Date(millis4);
        System.out.println(date4);

        java.util.Date date5 = Calendar.getInstance().getTime();
        System.out.println(date5);

    }


}
