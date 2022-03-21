package com.temp;

import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.MutableCapabilities;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.firefox.FirefoxOptions;
import org.openqa.selenium.firefox.FirefoxProfile;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.testng.annotations.Test;

import java.time.Duration;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.concurrent.atomic.AtomicReference;

class DatabaseSettings{
}
class TestData{
    int i;
}

public class Test2 {

    @Test
    public void test5() {
        WebDriverManager.firefoxdriver().setup();
        FirefoxOptions options = new FirefoxOptions();
        options.addPreference("media.navigator.permission.disabled", true);
        WebDriver driver = new FirefoxDriver(options);
        driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(30));
        driver.manage().timeouts().pageLoadTimeout(Duration.ofSeconds(30));
        driver.get("https://eus2-02.integration.ws-nonprod.avayacloud.com/services/ApplicationCenter/?tenantId=WLVCGV&tenantUrl=dev-8.ixcc-sandbox.avayacloud.com/auth/realms/WLVCGV");


        System.out.println();
    }

    @Test
    public void test4() {
        Hashtable<String, String> data = new Hashtable<>();
        data.put("a", "1");
        data.put("b", "2");
        data.put("c", "3");

        HashMap<String, String> newData = new HashMap<>();

        newData.put("a", "4");
        newData.put("b", "5");
        newData.put("c", "6");


        data.putAll(newData);

        System.out.println();
    }


    @Test
    public void test3() {
        TestData t1 = new TestData();
        t1.i = 10;

        TestData t0 = t1;

        TestData t2 = new TestData();
        t2.i = 20;

        t0 = t2;

        System.out.println(t1.i);


    }


    @Test
    public void test2() {
        AtomicReference<TestData> ref = new AtomicReference<>();
        TestData t1 = new TestData();
        ref.set(t1);
        TestData t0 = ref.get();
    }



    @Test
    public void test1() {
        HashMap<String, Integer> lists = getABC();
        System.out.println("lists.size() = " + lists.size());
        System.out.println("get contact_unattempt");
        int contact_unattempt = lists.get("contact_unattempt");
        System.out.println("contact_unattempt = " + contact_unattempt);
    }

    private HashMap<String, Integer> getABC() {
        HashMap<String, Integer> contactData = new HashMap<>();
        contactData.put("contact_unattempt", 123);
        contactData.put("contact_total", 456);
        contactData.put("contact_contactlist", 789);
        return contactData;
    }
}
