package com.demo_log4j.scripts;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.io.File;

public class Log4J2_Test {

    //private static final Logger logger = LogManager.getLogger(Log4J2_Test.class.getName());

    public static void main(String[] args) {
        String configPath = System.getProperty("user.dir") + "/src/test/java/com/demo_log4j/data/config/log4j2_config3.properties";
        File configPathFile = new File(configPath);
        System.out.println("configPath: " + configPath);
        System.setProperty("log4j2.configurationFile", configPathFile.toURI().toString());
        System.setProperty("log4j2.debug", "true");

        Logger log = LogManager.getLogger(Log4J2_Test.class.getName());
        log.info("Log info test");
        log.debug("Log debug test");
    }

    public static void main1(String[] args) {
        String configPath = System.getProperty("user.dir") + "/src/test/java/com/demo/data/config/log4j2_2.properties";

//        String configPath2 = "com/demo/data/config/log4j2.xml";
//        System.out.println(configPath2);
//        File file = new File(configPath);
//        System.out.println(file.toURI());
//        System.out.println(configPath);
//        System.setProperty("log4j.configurationFile", configPath);
//        System.setProperty("log4j.configurationFile", configPath);
        System.out.println(configPath);
        System.setProperty("log4j2.configurationFile", configPath);
//        System.setProperty("log4j2.configurationFile", configPath2);

        System.setProperty("logFilename", "logs/myApp.log");
        System.setProperty("Suite_Logfile", "logs/myAppSuite.log");
        System.setProperty("test_name", "logs/myApptest_name.log");

        Logger logger = LogManager.getLogger(Log4J2_Test.class.getName());
        logger.info("Log info test");
        logger.debug("Log debug test");
    }
}
