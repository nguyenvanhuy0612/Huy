package com.practice.bdd_junit_demo.steps;

import io.cucumber.datatable.DataTable;
import io.cucumber.java.ParameterType;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
    public void loadDataFirst(DataTable dataTable) {
        out.println("loadDataFirst");
        out.println(dataTable);
    }

    @When("Load data second")
    public void loadDataSecond(List<List<String>> table) {
        out.println("loadDataSecond");
        out.println(table);
    }

    //@And("Load data (?:third|List Map)")
    @And("^Load data third|^Load data List Map")
    public void loadDataThird(List<Map<String, String>> table) {
        out.println("loadDataThird");
        out.println(table);
    }

    @And("^Load data fourth|^Load data Map")
    public void loadDataFourth(Map<String, String> table) {
        out.println("loadDataFourth");
        out.println(table);
    }

    @And("Load data fifth")
    public void loadDataFifth(Map<String, List<String>> table) {
        out.println("loadDataFifth");
        out.println(table);
    }

    @And("Load data sixth")
    public void loadDataSixth(Map<String, Map<String, String>> table) {
        out.println("loadDataSixth");
        out.println(table);
    }

    @And("Load data for list String")
    public void loadDataForListString(List<String> table) {
        out.println("loadDataForListString");
        out.println(table);
    }

    @Given("Load DataTable exception")
    public void loadDataTableException(DataTable dataTable) {
        out.println("loadDataTableException");
    }
}
