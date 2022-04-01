package com.insight.consumer;

import java.util.function.BiConsumer;
import java.util.function.Consumer;

public class Example1 {

    static void printValue(int val) {
        System.out.println(val);
    }

    public static void main(String[] args) {
        // Create Consumer interface
        Consumer<String> consumer = new Consumer<String>() {
            @Override
            public void accept(String name) {
                System.out.println("Hello, " + name);
            }
        };
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
