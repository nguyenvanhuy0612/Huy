package com.temp;

import java.util.Arrays;
import java.util.Scanner;
import java.util.function.Function;

public class Test4 {

    double square(double number) {
        return Math.pow(number, 2);
    }


    void print(String... a) {
        for (String s : a) {
            System.out.println(s);
        }

        System.out.println(Arrays.toString(a));
    }

    public static void main(String[] args) {
//        Scanner s = new Scanner(System.in);
//        System.out.print("Nhap i = ");
//        int i = s.nextInt();
//        System.out.println(i);

        Test4 t = new Test4();
        Function<Double, Double> square = t::square;

        double ans = square.apply(24d);
        System.out.println(ans);


        t.print("huy1", "huy2", "huy3", "huy4", "huy5", "huy6");
    }
}
