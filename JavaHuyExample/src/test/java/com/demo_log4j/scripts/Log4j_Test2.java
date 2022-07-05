package com.demo_log4j.scripts;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class Log4j_Test2 {
    public static void main(String[] args) {
        String file = "C:\\Users\\Admin\\Documents\\Huy\\JavaHuyExample\\src\\test\\java\\com\\demo_log4j\\data\\config\\log4j2_config4.xml";
        System.setProperty("log4j2.configurationFile", file);
        Logger log = LogManager.getLogger(Log4j_Test2.class.getName());
        log.info("Abc");
    }
}
