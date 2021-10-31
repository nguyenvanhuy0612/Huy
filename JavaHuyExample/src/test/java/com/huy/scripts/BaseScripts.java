package com.huy.scripts;


import com.huy.lib.Listener;
import org.testng.annotations.*;

@Listeners({
        Listener.class
})
public class BaseScripts {
    @BeforeSuite
    public void beforeSuite() {
        System.out.println("beforeSuite");
    }

    @BeforeClass
    public void beforeClass() {
        System.out.println("beforeClass");
    }

    @BeforeMethod
    public void beforeMethod() {
        System.out.println("beforeMethod");
    }

    @AfterMethod
    public void afterMethod() {
        System.out.println("afterMethod");
    }

    @AfterClass
    public void afterClass() {
        System.out.println("afterClass");
    }

    @AfterSuite
    public void afterSuite() {
        System.out.println("afterSuite");
    }

    @BeforeGroups
    public void beforeGroups() {
        System.out.println("beforeGroups");
    }

    @AfterGroups
    public void afterGroups() {
        System.out.println("afterGroups");
    }

}
