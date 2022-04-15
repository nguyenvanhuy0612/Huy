package com.test;

import org.testng.annotations.Test;

import java.util.ArrayList;
import java.util.List;

public class Test1 {

    @Test
    public void test1() {

        Long x = Long.valueOf("1333");
        long y = Long.valueOf(x);
        System.out.println(y);
        List<String> list = new ArrayList<>();
        list.add("123");
        list.add("45");
        list.add("23");
        list.add("856");

        System.out.println(list.toString());





//        System.out.println();
//        List<Long> x = new ArrayList<>();
//
//
//        String xt = x.toString();
//        System.out.println(xt);
    }

}
