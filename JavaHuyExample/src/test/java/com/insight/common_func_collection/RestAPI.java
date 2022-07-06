package com.insight.common_func_collection;

import static io.restassured.RestAssured.given;

import io.restassured.RestAssured;
import io.restassured.response.Response;

import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class RestAPI {

    public static String restMethod(String method, String url, String body) {
        String result = "";
        Response response = null;
        String username = "dtranvan";
        String password = "Tma07@2022";
        try {
            RestAssured.reset();
            if (method.toLowerCase().contentEquals("get")) {
                RestAssured.useRelaxedHTTPSValidation("TLSv1.2");
                response = given().contentType("application/json")
                        .header("X-Requested-With", "raj", "Authorization",
                                "Basic cm11anVtYWxlOlJlY292ZXJ5Mjg=")
                        .auth().preemptive().basic(username, password).params("limitTo", "6").get(url)
                        .then().extract().response();
            } else if (method.toLowerCase().contentEquals("post")) {
                RestAssured.useRelaxedHTTPSValidation("TLSv1.2");
                response = given().contentType("application/json")
                        .header("X-Requested-With", "raj", "Authorization",
                                "Basic cm11anVtYWxlOlJlY292ZXJ5Mjg=")
                        .auth().preemptive().basic(username, password).body(body).when().post(url).then()
                        .extract().response();
            } else if (method.toLowerCase().contentEquals("put")) {
                RestAssured.useRelaxedHTTPSValidation("TLSv1.2");
                response = given().contentType("application/json")
                        .header("X-Requested-With", "raj", "Authorization",
                                "Basic cm11anVtYWxlOlJlY292ZXJ5Mjg=")
                        .auth().preemptive().basic(username, password).body(body).when().put(url).then()
                        .extract().response();
            } else if (method.toLowerCase().contentEquals("delete")) {
                RestAssured.useRelaxedHTTPSValidation("TLSv1.2");
                response = given().contentType("application/json")
                        .header("X-Requested-With", "raj", "Authorization",
                                "Basic cm11anVtYWxlOlJlY292ZXJ5Mjg=")
                        .auth().preemptive().basic(username, password).when().delete(url).then().extract()
                        .response();
            }
        } catch (Exception e) {
        }
        if (response != null) {
            result = response.asString();
        }
        System.out.println(result);
        return result;
    }


    public static String transferKey(String keyid) {
        String method = "get";
        String url = "https://jira.forge.avaya.com/browse/" + keyid;
        String body = "";
        String res = restMethod(method, url, body);
        //System.out.println(res);
        Matcher match = Pattern.compile("<title>\\s{0,2}\\[(IXOUTREACH|OUTREACH)-\\d{3,8}\\].+<\\/title>").matcher(res);
        if (match.find())
            keyid = match.group();
        match = Pattern.compile("(IX)?OUTREACH-\\d{3,8}").matcher(keyid);
        if (match.find())
            keyid = match.group();
        System.out.println("===== FINAL: " + keyid);
        return keyid;
    }


    public static void main(String[] args) {
//        transferKey("OUTREACH-39677");
//        transferKey("OUTREACH-39764");

        restMethod("get", "https://google.com", "");
    }
}
