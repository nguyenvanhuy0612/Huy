package com.demo_log4j.scripts;

import com.demo_log4j.lib.InitLog4j2;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.core.LoggerContext;

import java.io.File;

public class Log4j_Test2 {
    static Logger log = LogManager.getLogger(Log4j_Test2.class.getName());

    public static void main(String[] args) {

//        String fileNamePath = System.getProperty("user.dir") + "\\src\\test\\java\\com\\demo_log4j\\data\\config\\log4j2_config4.xml";
//        File file = new File(fileNamePath);
//        LoggerContext context = (LoggerContext) LogManager.getContext(false);
//        context.setConfigLocation(file.toURI());
//
//
//        System.setProperty("log4j2.configurationFile", fileNamePath);

        new InitLog4j2();

        log.info("Abc");
    }
}
