package com.demo.lib;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import java.lang.reflect.Type;

public class GsonUtil {
    private static final Gson gson = new GsonBuilder().serializeNulls().create();

    public static <T> T getObject(String objectInString, Class<T> classObj) {
        return gson.fromJson(objectInString, classObj);
    }

    public static <T> T getObject(String objectInString, Type t) {
        return gson.fromJson(objectInString, t);
    }

    public static String getJson(Object object) {
        return gson.toJson(object);
    }

    public static String getJson(Object object, java.lang.reflect.Type classType) {
        return gson.toJson(object, classType);
    }
}
