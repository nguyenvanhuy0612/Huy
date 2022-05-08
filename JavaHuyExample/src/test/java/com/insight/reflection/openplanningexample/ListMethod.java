package com.insight.reflection.openplanningexample;

import java.lang.reflect.Method;
import java.util.Arrays;

public class ListMethod {

    // Protected method
    protected void info() {

    }

    public static void testMethod1() {

    }

    public void testMethod2() {

    }

    public static void main(String[] args) {

        // Lấy ra danh sách các method public của class này
        // Bao gồm các các method thừa kế từ class cha, hoặc các interface.
        Method[] methods = ListMethod.class.getMethods();

        for (Method method : methods) {
            System.out.println("Method " + method.getName());
        }
        System.out.println();
        Class clazz = ListMethod.class;

        Arrays.asList(clazz.getMethods()).forEach(method -> {
            System.out.println("Method: " + method);
            System.out.println("Method getName: " + method.getName());
            System.out.println("Method getAnnotatedReturnType: " + method.getAnnotatedReturnType());
            System.out.println("Method getDefaultValue: " + method.getDefaultValue());
            System.out.println("Method getExceptionTypes: " + Arrays.toString(method.getExceptionTypes()));
            System.out.println("Method getModifiers: " + method.getModifiers());
            System.out.println("Method getParameters: " + Arrays.toString(method.getParameters()));
            System.out.println("Method getTypeParameters: " + Arrays.toString(method.getTypeParameters()));
            System.out.println("Method getParameterCount: " + method.getParameterCount());
            System.out.println("Method getParameterTypes: " + Arrays.toString(method.getParameterTypes()));
            System.out.println("============================================================================");
        });

    }
}