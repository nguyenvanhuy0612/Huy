package com.test;

public class Test9_Reflection {

    public static void main(String[] args) throws ClassNotFoundException {
        ClassReflection1 classReflection1 = new ClassReflection1();
        ClassReflection2 classReflection2 = new ClassReflection2();
        ClassReflection3 classReflection3 = new ClassReflection3();
        new Test9_Reflection().test1();
    }

    public void test1() throws ClassNotFoundException {
        Class c = "foo".getClass();
//        Class c1 = System.console().getClass();
//        enum E {A, B}
//        Class c2 = A.getClass();
        Class c3 = boolean.class;
        Class c4 = int[][][] .class;
        Class c5 = java.io.PrintStream.class;

        Class c6 = Class.forName("com.test.Test9_Reflection");

        System.out.println();
    }
}

class ClassReflection1 {
    String name;

    public void show(String name) {
        System.out.println(this.name == null ? name : this.name);
    }
}

class ClassReflection2 {
    String name;

    public void show(String name) {
        System.out.println(this.name == null ? name : this.name);
    }
}

class ClassReflection3 {
    String name;

    public void show(String name) {
        System.out.println(this.name == null ? name : this.name);
    }
}