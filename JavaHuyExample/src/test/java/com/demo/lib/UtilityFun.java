package com.demo.lib;

import org.testng.ITestResult;

import java.io.FileInputStream;
import java.util.HashMap;
import java.util.Properties;

public class UtilityFun {

    public UtilityFun() {
    }

    public void wait(int sec) {
        try {

            Thread.sleep(sec * 1000L);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public void sleep(long millis) {
        try {

            Thread.sleep(millis);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }


    /**
     * @param sKey
     * @return
     */
    public String readPropertyValue(String sKey) {
        return this.readPropertyValue(sKey, EnvSetup.USER_PROPERTY_FILE_PATH);
    }


    /**
     * Read sKey in sPropertyFileName and return String sValue
     *
     * @param sKey
     * @param sPropertyFileName
     * @return
     */
    public String readPropertyValue(String sKey, String sPropertyFileName) {
        String sValue = null;
        try (FileInputStream fs = new FileInputStream(sPropertyFileName)) {
            Properties properties = new Properties();
            properties.load(fs);
            sValue = properties.getProperty(sKey);
        } catch (Exception e) {
            System.out.printf("Exception occurred in method %s, with sKey=%s sPropertyFileName=%s%n",
                    Thread.currentThread().getStackTrace()[1].getMethodName(), sKey, sPropertyFileName);
        }
        return sValue;
    }

    public HashMap<String, String> getTestDetails(ITestResult result) {
        return new HashMap<>();
    }
}
