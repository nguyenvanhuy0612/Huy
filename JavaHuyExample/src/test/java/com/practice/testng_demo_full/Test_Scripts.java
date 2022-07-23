package com.practice.testng_demo_full;

import org.testng.annotations.Listeners;
import org.testng.annotations.Test;

import java.util.Arrays;

@Listeners(Listener.class)
public class Test_Scripts {

    @Test(dataProvider = "StringProvider", dataProviderClass = DataUtils.class)
    public void test1(Object[] obj) {
        System.out.println();
        Arrays.asList(obj).forEach(System.out::println);
    }

}
