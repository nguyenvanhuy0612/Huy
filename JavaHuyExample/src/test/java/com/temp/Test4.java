package com.temp;

import org.openqa.selenium.WebElement;

import java.util.*;
import java.util.function.Consumer;
import java.util.function.Function;
import java.util.function.Supplier;

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
        Integer x0 = 110;

        x0 = Integer.valueOf(1);


        System.out.println(x0 instanceof Integer);

        int x = 10;
        Supplier<Boolean> isPresent = () -> {
            if (x == 10) {
                System.out.println(x);
                return true;
            }
            return false;
        };
        System.out.println(isPresent.get());


        List<Object> lists = Arrays.asList("string", "hello", Arrays.asList("inside1", "inside2"), "bye");

        System.out.println(lists instanceof Collection);
        for (Object object : lists) {
            System.out.println(object instanceof Collection);
            System.out.println(object instanceof List<?>);
            System.out.println(object instanceof List);
            System.out.println(object instanceof String);
        }

        Consumer<List<Object>> consumertest = texts -> {
            for (Object text : texts) {
                if (text instanceof String)
                    System.out.println(text);
                else if (text instanceof List)
                    for (Object t : (List<?>) text) {
                        if (t instanceof String)
                            System.out.println(t);
                    }
            }
        };

        consumertest.accept(lists);


        Consumer<ArrayList<Object>> consumer = listActions -> {
            ((WebElement) listActions.get(0)).click();
            System.out.println(listActions.get(1).toString());
        };


        String[] texts = {"t1", "t2"};
        System.out.println(texts[0]);


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
