package com.practice.demo_log4j.scripts;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class Example_Script_Test {
    static Logger log = LogManager.getLogger(Example_Script_Test.class);

    public static void main(String[] args) {
        Log4j_Test2.main(new String[]{});
        log = LogManager.getLogger(Example_Script_Test.class);
        log.info("AAAAAAAA");
    }
}
