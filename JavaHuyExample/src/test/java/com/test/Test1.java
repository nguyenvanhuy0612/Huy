package com.test;

import com.google.gson.Gson;
import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.ui.Select;
import org.testng.annotations.Test;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.time.Duration;
import java.util.*;

public class Test1 {

    public static void main(String[] args) throws IOException {
        Properties properties = System.getProperties();
        Files.deleteIfExists(Paths.get("huy.txt"));
    }

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

        System.out.println(list);

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

        WebElement source = driver.findElement(By.xpath("//div"));
        WebElement target = driver.findElement(By.xpath("//div//td"));

        Actions actions = new Actions(driver);

        actions.moveToElement(source)
                .pause(Duration.ofSeconds(1))
                .clickAndHold(source)
                .pause(Duration.ofSeconds(1))
                .moveByOffset(1, 0)
                .moveToElement(target)
                .moveByOffset(1, 0)
                .pause(Duration.ofSeconds(1))
                .release().perform();




//        System.out.println();
//        List<Long> x = new ArrayList<>();
//
//
//        String xt = x.toString();
//        System.out.println(xt);
    }

}
