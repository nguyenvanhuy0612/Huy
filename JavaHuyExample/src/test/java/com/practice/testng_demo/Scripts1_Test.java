package com.practice.testng_demo;

import com.practice.log4j_demo.lib.InitLog4j2;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.testng.annotations.BeforeSuite;
import org.testng.annotations.Listeners;
import org.testng.annotations.Test;

@Listeners({Listener.class})
public class Scripts1_Test {
    public static Logger log = LogManager.getLogger(Scripts1_Test.class);

    @BeforeSuite
    public void initLog() {
        System.setProperty("log_filename", "Test");
        InitLog4j2.config();
    }

    @Test
    public void test1() {
        log.info(Thread.currentThread().getStackTrace()[1].getMethodName());
    }

    @Test
    public void test2() {
        log.info(Thread.currentThread().getStackTrace()[1].getMethodName());
    }

    @Test
    public void test3() {
        log.info(Thread.currentThread().getStackTrace()[1].getMethodName());
    }

    @Test
    public void test4() {
        log.info(Thread.currentThread().getStackTrace()[1].getMethodName());
    }

    @Test
    public void test5() {
        log.info(Thread.currentThread().getStackTrace()[1].getMethodName());
    }

    @Test
    public void test6() {
        log.info(Thread.currentThread().getStackTrace()[1].getMethodName());
    }

    @Test
    public void test7() {
        log.info(Thread.currentThread().getStackTrace()[1].getMethodName());
    }
}
