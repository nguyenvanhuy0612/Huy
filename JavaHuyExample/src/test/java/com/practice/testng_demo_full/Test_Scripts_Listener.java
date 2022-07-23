package com.practice.testng_demo_full;

import org.testng.annotations.*;

import static java.lang.System.out;


public class Test_Scripts_Listener {
    @BeforeSuite
    public void bfSuite() {out.println("bfSuite");}
    @BeforeTest
    public void bfTest() {out.println("bfTest");}
    @BeforeClass
    public void bfClass() {out.println("bfClass");}
    @BeforeMethod
    public void bfMethod() {out.println("bfMethod");}
    @Test public void testLoginGoogle() {out.println("testLoginGoogle");}
    @Test public void testLoginFacebook() {out.println("testLoginFacebook");}
    @AfterMethod public void atMethod() {out.println("atMethod");}
    @AfterClass public void atClass() {out.println("atClass");}
    @AfterTest public void atTest() {out.println("atTest");}
    @AfterSuite public void atSuite() {out.println("atSuite");}


//    @Test(dataProvider = "StringProvider", dataProviderClass = DataUtils.class)
//    public void test1(Object[] obj) {
//        System.out.println();
//        Arrays.asList(obj).forEach(System.out::println);
//        Stream.of(obj).forEach(System.out::println);
//    }

}
