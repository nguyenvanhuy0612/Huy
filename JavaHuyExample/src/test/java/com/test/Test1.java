package com.test;

import com.google.gson.Gson;
import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.Select;
import org.testng.annotations.Test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Test1 {

    @Test
    public void test1() {

        Long x = Long.valueOf("1333");
        long y = Long.valueOf(x);
        System.out.println(y);
        List<String> list = new ArrayList<>();
        list.add("123");
        list.add("45");
        list.add("23");
        list.add("856");

        System.out.println(list.toString());

        String jsonString = "{'employee.name':'Bob','employee.salary':10000}";
        Gson gson = new Gson();
        HashMap<String, String> map = (HashMap<String, String>) gson.fromJson(jsonString, Map.class);
        if (!map.getOrDefault("employee.name", "").isEmpty()){
            map.get("employee.name");
        }
        WebDriverManager.chromedriver().setup();
        WebDriver driver = new ChromeDriver();

        Select select = new Select(driver.findElement(By.xpath("//html")));
        select.selectByValue("huy");



//        System.out.println();
//        List<Long> x = new ArrayList<>();
//
//
//        String xt = x.toString();
//        System.out.println(xt);
    }

}
