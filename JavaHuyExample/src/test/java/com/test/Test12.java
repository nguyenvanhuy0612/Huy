package com.test;

import org.openqa.selenium.By;
import org.openqa.selenium.support.pagefactory.ByAll;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Test12 {
    public static void main(String[] args) {
        new ByAll(By.id("123"), By.id("123"));
        List<String> lists = Arrays.asList("123", "3455", "000", "daaaaaaa", "4445", "1");
        boolean isLargerThree = lists.stream().allMatch(s -> s.length()>3);
        System.out.println(isLargerThree);

//        lists.stream().filter(s -> {
//
//        })
    }
}
