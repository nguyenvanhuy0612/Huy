package com.insight.thread.atomic;

import java.util.concurrent.atomic.AtomicReference;

public class Example1 {

    public static void main(String[] args) {

        AtomicReference<String> data = new AtomicReference<>();

        if (data.get() == null) {
            System.out.println("NULL");
            throw new RuntimeException();
        }

        System.out.println(data);

        data.set("Abc");

        System.out.println(data);

        data.set("1234");

        System.out.println(data);

    }
}
