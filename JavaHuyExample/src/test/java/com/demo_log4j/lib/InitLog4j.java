package com.demo_log4j.lib;


import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class InitLog4j {

    protected Logger log1 = LogManager.getLogger(this.getClass().getName());
    protected static Logger log = LogManager.getLogger(InitLog4j.class.getName());
    private static final Logger logger = LogManager.getLogger("InitLog4j");


}
