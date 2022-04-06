package com.insight.reflection;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

public class ReflectionEmployeeDemo {

    public static void main(String[] args) throws ClassNotFoundException {

        Class<?> clazz = Class.forName("com.insight.reflection.Employee");

        Constructor<?>[] constructors = clazz.getConstructors();

        for (Constructor<?> constructor : constructors) {
            System.out.println(constructor);
        }

        for (Field field : clazz.getDeclaredFields()) {
            System.out.println("field.getType() = " + field.getType());
        }

        for (Method method :clazz.getMethods()) {
            System.out.println(method);
        }
    }
}
