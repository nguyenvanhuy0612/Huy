package com.huy.practice.learn;

public class Test {

    public static void main(String[] args) {
        GenericJava<String, String> g = new GenericJava<>("key", "value");
        g.print();

        GenericJava<String, Integer> ip = new GenericJava<>("Iphone 12", 1500);
        ip.print();

    }
}
