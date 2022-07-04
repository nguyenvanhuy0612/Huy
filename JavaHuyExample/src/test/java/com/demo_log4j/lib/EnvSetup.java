package com.demo_log4j.lib;

import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import java.time.Duration;
import java.util.HashMap;

public class EnvSetup {
    // EnvSetup - Func
    private final UtilityFun utilityFunc = new UtilityFun();

    // Browser details
    public static String BROWSER_NAME;

    public static String DEFAULT_BROWSER_NAME;

    public static String DRIVER_PATH;

    public static WebDriver WEBDRIVER;
    public static WebDriver driver;
    public static int implicitWaitSec;

    // Project path
    public static String USER_PROPERTY_FILE_PATH;

    // Suite path
    public static String SUITE_PATH = System.getProperty("user.dir") + "/";

    // Test Data path
    public static String TEST_DATA_PATH = SUITE_PATH + "src/test/java/com/data/";

    // Utilities Path
    public static String UTILITIES_PATH = SUITE_PATH + "utilities/";

    // Log4j property file location
    public static String LOGGER_PROPERTY_FILE = SUITE_PATH + "src/test/java/com/data/configs/log4j.properties";

    // Screen Shot path details
    public static String SNAP_FOLDER_PATH = SUITE_PATH + "target/surefire-reports/html/";

    // Log Folder Path
    public static String LOG_FOLDER_PATH = SUITE_PATH + "/log/";

    // Test data
    public static HashMap<String, String> testData;


    static {
        testData = new HashMap<>();
    }

    public EnvSetup() {
        USER_PROPERTY_FILE_PATH = SUITE_PATH + "src/test/java/com/data/configs/"
                + utilityFunc.readPropertyValue("PROPERTY_FILE",
                SUITE_PATH + "src/test/java/com/data/configs/default.properties");
        BROWSER_NAME = utilityFunc.readPropertyValue("Browser").isEmpty() ? "FIREFOX" : utilityFunc.readPropertyValue("Browser");
        DEFAULT_BROWSER_NAME = BROWSER_NAME;
        System.out.println("Environment variables initialized...");
    }

    public static WebDriver initDriver() {
        WebDriverManager.chromedriver().setup();
        ChromeOptions chromeOptions = new ChromeOptions();
        chromeOptions.addArguments("--no-sandbox");
        //chromeOptions.addArguments("--headless");
        chromeOptions.addArguments("disable-gpu");
        WebDriver driver = new ChromeDriver(chromeOptions); //chrome
        driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(30));
        driver.manage().timeouts().pageLoadTimeout(Duration.ofSeconds(30));
        driver.manage().window().maximize();
        return driver;
    }
}
