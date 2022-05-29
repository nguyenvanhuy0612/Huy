package com.demo.lib;


import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.testng.annotations.Test;

public class InitLog4j {

    protected Logger log1 = LogManager.getLogger(this.getClass().getName());
    protected static Logger log = LogManager.getLogger(InitLog4j.class.getName());
    private static final Logger logger = LogManager.getLogger("InitLog4j");


}
