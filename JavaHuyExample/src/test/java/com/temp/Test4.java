package com.temp;

import java.util.Scanner;
import java.util.function.Function;

public class Test4 {

    double square(double number) {
        return Math.pow(number, 2);
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
    }
}
