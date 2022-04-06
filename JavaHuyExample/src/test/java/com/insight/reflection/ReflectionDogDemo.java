package com.insight.reflection;

import java.lang.reflect.Method;

public class ReflectionDogDemo {
    public static void main(String[] args) throws Exception {
        String dogClassName = "com.insight.reflection.Dog";
        Class<?> clazz = Class.forName(dogClassName); // convert string classname to class
        Object dog = clazz.getDeclaredConstructor().newInstance(); // invoke empty constructor


        String methodName = "";

        // with single parameter, return void
        methodName = "setName";
        Method setNameMethod = dog.getClass().getMethod(methodName, String.class);
        setNameMethod.invoke(dog, "Mishka"); // pass arg

        // without parameters, return string
        methodName = "getName";
        Method getNameMethod = dog.getClass().getMethod(methodName);
        String name = (String) getNameMethod.invoke(dog); // explicit cast

        // with multiple parameters
        methodName = "printDog";
        Class<?>[] paramTypes = {String.class, int.class};
        Method printDogMethod = dog.getClass().getMethod(methodName, paramTypes);
        printDogMethod.invoke(dog, name, 3); // pass args


        //========================================
        // if use object, direct invoke method
        // https://stackoverflow.com/questions/160970/how-do-i-invoke-a-java-method-when-given-the-method-name-as-a-string
        /*
        //get method
        method = obj.getClass().getMethod(methodName, param1.class, param2.class, ..);
        // execute method
        method.invoke(obj, arg1, arg2,...);
        */
        Object dog2 = new Dog("milu", 2);

        methodName = "printDog";
        paramTypes = new Class[]{String.class, int.class};

        printDogMethod = dog2.getClass().getMethod(methodName);
        printDogMethod.invoke(dog2);


        System.out.println();

    }
}
