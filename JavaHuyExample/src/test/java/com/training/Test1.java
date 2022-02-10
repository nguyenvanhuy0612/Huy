package com.training;

import java.util.Scanner;

public class Test1 {

    void testReturn(){
        System.out.println("Test return");
        Scanner s = new Scanner(System.in);
        System.out.print("Enter a = ");
        String a = s.nextLine();

        if(a.isEmpty() || a.isBlank()) {
            System.out.println("Return without any actions");
            return;
        }
        System.out.println("a = " + a);
    }

    public static void main(String[] args) {
        Test1 t = new Test1();
        t.testReturn();
    }
}
