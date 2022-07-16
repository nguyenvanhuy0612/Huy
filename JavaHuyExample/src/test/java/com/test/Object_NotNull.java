package com.test;

import java.util.Objects;

public class Object_NotNull {
    public static void main(String[] args) {
        YahooPage yahooPage = Objects.requireNonNull(new YahooPage());

    }
}
