package com.insight.streamapi.function;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.function.Function;
import java.util.stream.Collectors;

public class Example1 {
    public static void main(String[] args) {
        Function<String, String> print = String::toUpperCase;

        for (String s : new String[]{"huy1", "huy2", "huy3"}) {
            System.out.println(print.apply(s));
        }

        Arrays.stream(new String[]{"test1", "test2", "test3"}).map(print).collect(Collectors.toList()).forEach(System.out::println);

    }
}
