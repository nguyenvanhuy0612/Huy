package com.huy.practice.dht.kethua.xulyngoaile;

import io.cucumber.plugin.event.Node;

import java.util.InputMismatchException;

public class Tester {
    public static int divide(String s1, String s2) {
        int c = -1;
        try {
            int a = Integer.parseInt(s1);
            int b = Integer.parseInt(s2);
            c = a / b;
        } catch (InputMismatchException inputMismatchException) {
            inputMismatchException.printStackTrace();
        } finally {
            System.out.println("Finally: DONE");
        }
        return c;
    }

    public static void main(String[] args) {
        try {
            int c = divide("12", "0");
            System.out.println(c);
        }catch (ArithmeticException ex){
            System.out.println("Divide By Zero");
        }
        System.out.println("DONE");
    }
}
