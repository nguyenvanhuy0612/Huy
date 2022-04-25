package com.test;

import com.opencsv.CSVWriter;
import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.StandardOpenOption;
import java.time.Duration;
import java.util.*;
import java.util.stream.Collectors;

public class Test5 {

    WebDriver driver;

    public void setup() {
        WebDriverManager.chromedriver().setup();
        ChromeOptions options = new ChromeOptions();
        options.addExtensions(new File("C:\\Users\\Admin\\Documents\\HuyTestNGLocal\\Jupyter\\extension_SelectorsHub_4_3_8_0.crx"));
        driver = new ChromeDriver(options);
        driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(30));
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(60));
        JavascriptExecutor js = (JavascriptExecutor) driver;
        Actions actionProvider = new Actions(driver);
    }

    public void collect(String filename) {
        List<String> row = new ArrayList<>();
        String productLoc = "//div[@class='group-product']";
        List<WebElement> products = driver.findElements(By.xpath(productLoc));
        for (int i = 1; i <= products.size(); i++) {
            String groupName = driver.findElement(By.xpath(productLoc + "[" + i + "]/div[@class='group-name']/h3")).getText();
            row.add(groupName);
            System.out.println(row);
            writeToFile(filename, row);
            row.clear();
            String tableRowLoc = productLoc + "[" + i + "]/div[@class='table-row']";
            for (int j = 1; j <= driver.findElements(By.xpath(tableRowLoc)).size(); j++) {
                row.addAll(driver.findElements(By.xpath(tableRowLoc + "[" + j + "]/div//a")).stream().map(WebElement::getText).collect(Collectors.toList()));
                row.addAll(driver.findElements(By.xpath(tableRowLoc + "[" + j + "]/div//h4[not(./a)]")).stream().map(WebElement::getText).collect(Collectors.toList()));
                System.out.println(row);
                writeToFile(filename, row);
                row.clear();
            }
        }
    }


    public Object getData() {
        HashMap<String, String>[] hashMaps = new HashMap[]{};
        hashMaps[0] = new HashMap<>(Collections.singletonMap("k1", "v1"));
        HashMap<Integer, List<String>> listHashMap = new HashMap<>();
        if (listHashMap.isEmpty())
            return listHashMap;
        return hashMaps;
    }

    public void writeToFile(String filename, List<String> data) {
        try {
            Writer writer = new FileWriter(filename, StandardCharsets.UTF_8, true);
            CSVWriter csvOutput = new CSVWriter(writer);
            csvOutput.writeNext(data.toArray(new String[0]));
            csvOutput.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void main2(String[] args) {
        List<String> data = new ArrayList<>();

        data.add("aa");
        data.add("ab");
        data.add("ac");
        data.add("dd");

        new Test5().writeToFile("file.csv", data);
        new Test5().writeToFile("file.csv", Arrays.asList("1", "2", "3"));
        new Test5().writeToFile("file.csv", Arrays.asList("4", "5", "7"));

    }

    public static void main(String[] args) {
        Test5 t = new Test5();

        t.setup();
        t.driver.get("https://tinhocngoisao.com/bang-gia-ban");

        t.collect("file.csv");

    }
}
