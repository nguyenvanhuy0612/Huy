package com.temp;

import com.google.gson.JsonObject;
import org.testng.annotations.Test;

import java.util.ArrayList;
import java.util.List;
import java.util.function.BiConsumer;

public class Example2 {
    @Test
    public void test3() {
        System.out.println();
        JsonObject js = new JsonObject();
        js.addProperty("filename", "outfile");
//		js
    }

    @Test
    public void test2() {
        BiConsumer<String, String> greeter1 = (firstName,
                                               lastName) -> System.out.println("Hello " + firstName + " " + lastName);
        BiConsumer<String, String> greeter2 = (firstName,
                                               lastName) -> System.out.println("Hello " + firstName.toUpperCase() + " "
                + lastName.toUpperCase());
        greeter1.andThen(greeter2).accept("James", "Smith");
    }


    @Test
    public void test1() {
        List<String> lists1 = new ArrayList<>();
        lists1.add("s1");
        lists1.add("s2");
        lists1.add("s3");
        lists1.add("s4");
        lists1.add("s5");
        while (true) {
            for (String s : lists1) {
                if (s.contains("s3")) {
                    break;
                }
            }
            break;
        }
    }


    public static void main(String[] args) {
        String text = "text";
        text = "123";
        System.out.println(text);
        String test = "asd12312312asdnaskjd`1~!@#$%^*(&)(";
        String newTest = test.replaceAll("\\D", "");
        String size = "1\n";
        System.out.println(size);
        String newSize = size.trim();
        System.out.println(newSize);
        System.out.println();
        System.out.println("Hello");
        boolean[] lists =
                {true, false};
        // test !(a || b) = !a && !b
        //https://vi.wikipedia.org/wiki/Lu%E1%BA%ADt_De_Morgan
        //Định lý này được phát biểu và dùng lại trong lô gíc và đại số Boole như sau:
        for (boolean a : lists) {
            for (boolean b : lists) {
                System.out.printf("a = %b, b = %b \n", a, b);
                System.out.printf("!(a || b) = %b , !a && !b = %b \n", !(a || b), !a && !b);
                System.out.printf("!(a && b) = %b , (!a || !b) = %b \n", !(a && b), (!a || !b));
            }
        }
    }
}
