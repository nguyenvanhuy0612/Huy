package com.insight.log4j2_example;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class Example1 {

    private static final Logger logger = LogManager.getLogger(Example1.class);
    private final Logger log = LogManager.getLogger(this.getClass().getName());

    public static void main(String[] args) {
        logger.info("Example1");
        logger.error("Error");
        new Example1().testLog();
    }

    private void testLog() {
        log.info("Test");
    }

}
