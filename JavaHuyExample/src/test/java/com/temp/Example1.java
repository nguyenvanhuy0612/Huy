package com.temp;

public class Example1 {
    public static void main(String[] args) {
        // StringBuffer
        StringBuffer sbf = new StringBuffer("Hello");

        // StringBuilder
        // không đồng bộ(non-synchronized)
        StringBuilder sbd = new StringBuilder("Hello");
    }

}
