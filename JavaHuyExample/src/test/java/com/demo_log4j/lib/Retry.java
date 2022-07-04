package com.demo_log4j.lib;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.testng.IRetryAnalyzer;
import org.testng.ITestResult;

import java.util.concurrent.ConcurrentHashMap;

public class Retry implements IRetryAnalyzer {
    private final Logger log = LogManager.getLogger(this.getClass().getName());
    private static final ConcurrentHashMap<String, Integer> retCount = new ConcurrentHashMap<>();
    UtilityFun objUtil = new UtilityFun();

    @Override
    public boolean retry(ITestResult result) {

        EnvSetup.testData = objUtil.getTestDetails(result);
        String TCName = EnvSetup.testData.get("Testcase_ID");

        if (retCount.containsKey(TCName)) {
            int count = retCount.get(TCName);
            log.info("TC : " + TCName + ", current tc count : " + count);
            int maxRetryCount = 0;
            if (count < maxRetryCount) {
                log.info("TC : " + TCName + ", tc count less than max retry count, current count : " + count);
                retCount.put(TCName, ++count);
                return true;
            } else {
                log.info("TC : " + TCName + ", tc count greater than max rety count, current count : " + count);
                return false;
            }
        } else {
            log.info("TC : " + TCName + ", first invocation call, current count : 1");
            retCount.put(TCName, 1);
            return true;
        }
    }
}
