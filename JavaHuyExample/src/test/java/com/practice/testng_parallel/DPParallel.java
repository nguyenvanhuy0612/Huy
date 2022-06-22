package com.practice.testng_parallel;

import org.testng.annotations.DataProvider;
import org.testng.annotations.Test;

public class DPParallel {

    @Test(dataProvider = "TestData")
    public void Test1(String username, String password) {
        System.out.println(Thread.currentThread().getName() + Thread.currentThread().getId() + " - " + username + " : " + password);
    }

    @DataProvider(name = "TestData", parallel = true)
    public Object[][] dataProvider() {
        return new Object[][]{
                new Object[]{"username1", "password1"},
                new Object[]{"username2", "password2"},
                new Object[]{"username3", "password3"},
                new Object[]{"username4", "password4"}
        };
    }
}
