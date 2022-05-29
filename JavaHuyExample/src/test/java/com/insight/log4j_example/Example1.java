package com.insight.log4j_example;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class Example1 {

    private static final Logger logger = LogManager.getLogger("Example1");

    public static void main(String[] args) {
        System.out.println("Example1");
        logger.info("Example1");
    }

}
