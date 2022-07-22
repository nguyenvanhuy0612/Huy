package com.practice.log4j_demo.lib;


import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.core.LoggerContext;

import java.io.File;

public class InitLog4j2 {

    protected Logger log1 = LogManager.getLogger(this.getClass().getName());
    protected static Logger log = LogManager.getLogger(InitLog4j2.class.getName());
    private static final Logger logger = LogManager.getLogger("InitLog4j");

    public InitLog4j2() {
        //System.out.println("Entering method: " + Thread.currentThread().getStackTrace()[1].getMethodName());
        String fileNamePath = System.getProperty("user.dir") + "\\src\\test\\java\\com\\practice\\log4j_demo\\data\\config\\log4j2_config4.xml";
        File file = new File(fileNamePath);
        LoggerContext context = (LoggerContext) LogManager.getContext(false);
        // TODO: Set config file
        context.setConfigLocation(file.toURI());
        //System.setProperty("log4j2.configurationFile", file.toURI().toString());
        //LogManager.getLogger(InitLog4j2.class).info("InitLog4j2");
    }

    public static void config() {
        String fileNamePath = System.getProperty("user.dir") + "\\src\\test\\java\\com\\practice\\log4j_demo\\data\\config\\log4j2_config4.xml";
        File file = new File(fileNamePath);
        LoggerContext context = (LoggerContext) LogManager.getContext(false);
        context.setConfigLocation(file.toURI());
    }

    public static void reconfig() {
        LoggerContext context = (LoggerContext) LogManager.getContext(false);
        context.reconfigure();
    }
}