package com.test;

import java.util.ArrayList;
import java.util.List;

public class Test6 {
    public static void main(String[] args) {
        List<String> data = new ArrayList<>();

        data.add("aa");
        data.add("ab");
        data.add("ac");
        data.add("dd");

        String[] st = data.toArray(new String[0]);
        System.out.println();
    }
}
