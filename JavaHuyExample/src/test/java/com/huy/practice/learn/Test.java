package com.huy.practice.learn;

public class Test {

    public static void main(String[] args) {
        GenericJava<String, String> g = new GenericJava<>("key", "value");
        g.print();

        GenericJava<String, Integer> ip = new GenericJava<>("Iphone 12", 1500);
        ip.print();

        GenericJava<String, String> t = null;

        try {
            t = new GenericJava<>("1", "2");
            throw new Exception();
        }catch (Exception e){
            e.printStackTrace();
            t.print();
            System.out.println("Abc");
        }


    }
}
