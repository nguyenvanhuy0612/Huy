package com.temp;

//import io.github.bonigarcia.wdm.WebDriverManager;

import org.openqa.selenium.Platform;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.edge.EdgeDriver;
import org.openqa.selenium.ie.InternetExplorerDriver;
import org.openqa.selenium.ie.InternetExplorerDriverService;
import org.openqa.selenium.ie.InternetExplorerOptions;
import org.openqa.selenium.remote.CapabilityType;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.testng.annotations.Test;

import java.time.Duration;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import static java.util.Map.entry;

public class EdgeTest {

    WebDriver driver;

    @Test
    public void test4() {

    }

    @Test
    public void test3() throws InterruptedException {
        final String SRC = System.getProperty("user.dir");
        final String pathIEDriverServer = SRC + "\\utilities\\IEDriverServer.exe";

        System.setProperty("webdriver.edge.driver", SRC + "\\utilities\\msedgedriver.exe");
        System.setProperty("webdriver.ie.driver", pathIEDriverServer);
//        InternetExplorerDriverService.createDefaultService();


        InternetExplorerOptions ieOptions = new InternetExplorerOptions();
//        ieOptions.setCapability("se:ieOptions", Map.ofEntries(
//                entry(InternetExplorerDriver.INTRODUCE_FLAKINESS_BY_IGNORING_SECURITY_DOMAINS, true),
//                entry(InternetExplorerDriver.IGNORE_ZOOM_SETTING, true),
//                entry("browserstack.ie.enablePopups", true),
//                entry("ie.edgechromium", true),
//                entry("ie.edgepath", "C:\\Program Files (x86)\\Microsoft\\Edge\\Application\\msedge.exe"),
//                entry("allow-blocked-content", false)
//        ));
        ieOptions.setCapability(InternetExplorerDriver.INTRODUCE_FLAKINESS_BY_IGNORING_SECURITY_DOMAINS, true);
        ieOptions.setCapability(InternetExplorerDriver.IGNORE_ZOOM_SETTING, true);
        ieOptions.setCapability("ie.edgechromium", true);
        ieOptions.setCapability("ie.edgepath", "C:\\Program Files (x86)\\Microsoft\\Edge\\Application\\msedge.exe");
        ieOptions.setCapability("initialBrowserUrl", "https://google.com");
        ieOptions.setCapability("browserstack.ie.enablePopups", true);
        ieOptions.setCapability("allow-blocked-content", true);


        WebDriver driver = new InternetExplorerDriver(ieOptions);
        driver.manage().window().maximize();
        driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(30));


        driver.get("https://youtube.com");

        Thread.sleep(5000);

        driver.quit();
    }

    @Test
    public void test2_2() {
        final String SRC = System.getProperty("user.dir");
        final String pathIEDriverServer = SRC + "\\utilities\\IEDriverServerx64.exe";
        System.setProperty("webdriver.ie.driver", pathIEDriverServer);
        InternetExplorerOptions ieOptions = new InternetExplorerOptions();
        ieOptions.introduceFlakinessByIgnoringSecurityDomains();
        ieOptions.ignoreZoomSettings();
//        ieOptions.attachToEdgeChrome();
//        ieOptions.withEdgeExecutablePath("C:\\Program Files (x86)\\Microsoft\\Edge\\Application\\msedge.exe");
        driver = new InternetExplorerDriver();
        driver.get("https://google.com");
        try {
            Thread.sleep(10000);
        } catch (Exception ignored) {
        }
        driver.close();
    }


    @Test
    public void test2() throws InterruptedException {
        final String SRC = System.getProperty("user.dir");
        System.setProperty("webdriver.edge.driver", SRC + "\\utilities\\msedgedriver.exe");
        driver = new EdgeDriver();
        driver.get("https://google.com");
        Thread.sleep(5000);
        driver.close();
    }

    @Test
    public void test1() {
//        WebDriverManager.edgedriver().setup();
        driver = new EdgeDriver();
        driver.get("https://google.com");

    }

}
