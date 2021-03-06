package com.practice.log4j_demo.scripts;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Log4j2_SLF4J_Test {
    private static final Logger logger = LoggerFactory.getLogger(Log4j2_SLF4J_Test.class);

    public static void main(final String[] args)
    {
        logger.debug("Debug Message Logged !!!");
        logger.info("Info Message Logged !!!");
        logger.error("Error Message Logged !!!", new NullPointerException("NullError"));
    }
}
