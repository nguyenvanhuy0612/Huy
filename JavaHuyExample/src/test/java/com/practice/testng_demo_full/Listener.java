package com.practice.testng_demo_full;

import org.testng.*;
import org.testng.xml.XmlSuite;

import java.util.List;
import java.util.Map;

public class Listener implements ISuiteListener, ITestListener, IReporter {
    private static final ThreadLocal<ISuite> ACCESS = new ThreadLocal<>();

    public Listener() {
    }

    public static ISuite getAccess() {
        System.out.println(Listener.class.getName() + " getAccess()");
        return ACCESS.get();
    }

    /////////////////////////// ISuiteListener ///////////////////////////
    @Override
    public void onStart(ISuite suite) {
        System.out.println(this.getClass().getName() + " onStart(ISuite suite)");
        ACCESS.set(suite);
        //System.out.println(this.getClass().getName() + " " + suite.getName());
    }

    @Override
    public void onFinish(ISuite suite) {
        System.out.println(this.getClass().getName() + " onFinish(ISuite suite)");
        ISuiteListener.super.onFinish(suite);
        //System.out.println(this.getClass().getName() + " " + suite.getName());
    }

    /////////////////////////// ITestListener ///////////////////////////
    @Override
    public void onTestStart(ITestResult result) {
        System.out.println(this.getClass().getName() + " onTestStart(ITestResult result)");
        ITestListener.super.onTestStart(result);
        //System.out.println(this.getClass().getName() + " " + result.getName());
    }

    @Override
    public void onTestSuccess(ITestResult result) {
        System.out.println(this.getClass().getName() + " onTestSuccess(ITestResult result)");
        ITestListener.super.onTestSuccess(result);
        //System.out.println(this.getClass().getName() + " " + result.getName());
    }

    @Override
    public void onTestFailure(ITestResult result) {
        System.out.println(this.getClass().getName() + " onTestFailure(ITestResult result)");
        ITestListener.super.onTestFailure(result);
        //System.out.println(this.getClass().getName() + " " + result.getName());
    }

    @Override
    public void onTestSkipped(ITestResult result) {
        System.out.println(this.getClass().getName() + " onTestSkipped(ITestResult result)");
        ITestListener.super.onTestSkipped(result);
        //System.out.println(this.getClass().getName() + " " + result.getName());
    }

    @Override
    public void onTestFailedButWithinSuccessPercentage(ITestResult result) {
        System.out.println(this.getClass().getName() + " onTestFailedButWithinSuccessPercentage(ITestResult result)");
        ITestListener.super.onTestFailedButWithinSuccessPercentage(result);
        //System.out.println(this.getClass().getName() + " " + result.getName());
    }

    @Override
    public void onTestFailedWithTimeout(ITestResult result) {
        System.out.println(this.getClass().getName() + " onTestFailedWithTimeout(ITestResult result)");
        ITestListener.super.onTestFailedWithTimeout(result);
        //System.out.println(this.getClass().getName() + " " + result.getName());
    }

    @Override
    public void onStart(ITestContext context) {
        System.out.println(this.getClass().getName() + " onStart(ITestContext context)");
        ITestListener.super.onStart(context);
        //System.out.println(this.getClass().getName() + " " + context.getName());
    }

    @Override
    public void onFinish(ITestContext context) {
        System.out.println(this.getClass().getName() + " onFinish(ITestContext context)");
        ITestListener.super.onFinish(context);
        //System.out.println(this.getClass().getName() + " " + context.getName());
    }

    @Override
    public void generateReport(List<XmlSuite> xmlSuites, List<ISuite> suites, String outputDirectory) {

        //Iterating over each suite included in the test
        for (ISuite suite : suites) {
            //Following code gets the suite name
            String suiteName = suite.getName();
            //Getting the results for the said suite
            Map<String, ISuiteResult> suiteResults = suite.getResults();
            for (ISuiteResult sr : suiteResults.values()) {
                ITestContext tc = sr.getTestContext();
                System.out.println("Passed tests for suite '" + suiteName + "' is:" + tc.getPassedTests().getAllResults().size());
                System.out.println("Failed tests for suite '" + suiteName + "' is:" + tc.getFailedTests().getAllResults().size());
                System.out.println("Skipped tests for suite '" + suiteName + "' is:" + tc.getSkippedTests().getAllResults().size());
            }
        }
    }
}
