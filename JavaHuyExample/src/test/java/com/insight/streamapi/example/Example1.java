package com.insight.streamapi.example;

import java.util.Arrays;
import java.util.function.BiConsumer;
import java.util.function.BiPredicate;
import java.util.function.Consumer;
import java.util.function.Function;

public class Example1 {


    static void printValue(int val) {
        System.out.println(val);
        return;
    }
    public static void printValue(String s)
    {
        if (s.length() > 10) {
            return;
        }
        System.out.println("Hello " + s);
    }
    public static void main(String[] args) {

//        Consumer<String> hello = s -> {
//            System.out.println("Hello +" + s);
//        };

        Arrays.asList("123", "32423").forEach(s -> System.out.println("hello " + s));


//
//        hello.andThen(hello).accept("123");

        BiPredicate<String, String> BiPredicate = (s1, s2) -> {
            System.out.println(s1);
            System.out.println(s2);
            return false;
        };

        System.out.println(BiPredicate.test("s1", "s2"));

        BiPredicate<String, String> BiPredicate2 = new BiPredicate<String, String>() {

            @Override
            public boolean test(String s1, String s2) {
                System.out.println(s1);
                System.out.println(s2);
                return false;
            }
        };

        System.out.println(BiPredicate2.test("s1", "s2"));



        // Create Consumer interface
        Consumer<String> consumer = new Consumer<String>() {
            @Override
            public void accept(String name) {
                System.out.println("Hello, " + name);
            }
        };

        // Create Consumer interface use lambda
        Consumer<String> consumer0 = name -> System.out.println("Hello, " + name);
        // Calling Consumer method
        consumer.accept("gpcoder"); // Hello, gpcoder

        // Create Consumer interface with lambda expression
        Consumer<String> consumer1 = (name) -> System.out.println("Hello, " + name);
        // Calling Consumer method
        consumer1.accept("gpcoder"); // Hello, gpcoder

        // Create Consumer interface with method reference
        Consumer<Integer> consumer2 = Example1::printValue;
        // Calling Consumer method
        consumer2.accept(12); // 12


        BiConsumer<String, String> bc = (a, b) -> System.out.println("Hello: " + a + ", hello: " + b);

        bc.accept("Huy", "Huong Dan Java");

    }


}
