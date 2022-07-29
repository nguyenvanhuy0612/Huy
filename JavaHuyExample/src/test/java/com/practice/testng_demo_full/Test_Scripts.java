package com.practice.testng_demo_full;

import org.testng.annotations.*;

import java.util.Arrays;
import java.util.HashMap;
import java.util.stream.Stream;

import static java.lang.System.out;
import static java.lang.Thread.currentThread;

@Listeners(Listener.class)
public class Test_Scripts {

    @BeforeSuite
    public void bfSuite() {out.println("bfSuite");}
    @BeforeTest
    public void bfTest() {out.println("bfTest");}
    @BeforeClass
    public void bfClass() {out.println("bfClass");}
    @BeforeMethod
    public void bfMethod() {out.println("bfMethod");}
    @Test (dataProvider = "SingleStringProvider", dataProviderClass = DataUtils.class)
    public void testLoginGoogle(String data) {
        out.println("testLoginGoogle");
        out.println(data);
    }
    @Test (dataProvider = "newMap", dataProviderClass = DataUtils.class)
    public void testLoginFacebook(HashMap<String, String> data) {
        out.println("testLoginFacebook");
        out.println(data);
    }
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
