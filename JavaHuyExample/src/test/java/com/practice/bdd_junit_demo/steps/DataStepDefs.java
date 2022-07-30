package com.practice.bdd_junit_demo.steps;

import io.cucumber.java.ParameterType;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;

import java.util.HashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static java.lang.System.out;

public class DataStepDefs {

    @ParameterType("(?i)DataFile: ?[\\w-\\.]*.*Data: ?[\\w-\\.]*")
    public HashMap<String, String> DataMap(String context) {
        // This type apply for only workspace
        // for ex: Get test DataFile: WorkspaceFile1 with Data: TestCase1
        HashMap<String, String> dataMap = new HashMap<>();
        try {
            String dataFile = "", data = "";
            //Matcher matcher = Pattern.compile("DataFile: ?[\\w-.]*", Pattern.CASE_INSENSITIVE).matcher(context);
            Matcher matcher = Pattern.compile("(?i)DataFile: ?[\\w-.]*").matcher(context);
            if (matcher.find())
                dataFile = matcher.group().replaceFirst("(?i)DataFile: ?", "").trim();
            //matcher = Pattern.compile("Data: ?[\\w-.]*", Pattern.CASE_INSENSITIVE).matcher(context);
            matcher = Pattern.compile("(?i)Data: ?[\\w-.]*").matcher(context);
            if (matcher.find())
                data = matcher.group().replaceFirst("(?i)Data: ?", "").trim();
            dataMap.put(dataFile, data);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dataMap;
    }

    @Given("Get test {DataMap}")
    public void getTestData(HashMap<String, String> testData) {
        out.println("getTestData");
        out.println(testData);
    }

    @Given("Init data")
    public void initData() {
        out.println("initData");
    }

    @Given("Load data for test first")
    public void loadDataFirst() {
        out.println("loadDataFirst");
    }

    @When("Load data second")
    public void loadDataSecond() {
        out.println("loadDataSecond");
    }

    @And("Load data third")
    public void loadDataThird() {
        out.println("loadDataThird");
    }

    @And("Load data fourth")
    public void loadDataFourth() {
        out.println("loadDataFourth");
    }

    @And("Load data fifth")
    public void loadDataFifth() {
        out.println("loadDataFifth");
    }

    @And("Load data sixth")
    public void loadDataSixth() {
        out.println("loadDataSixth");
    }
}
