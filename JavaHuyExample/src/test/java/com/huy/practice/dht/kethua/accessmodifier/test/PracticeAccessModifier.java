package com.huy.practice.dht.kethua.accessmodifier.test;

public class PracticeAccessModifier {
	public static void main(String[] args) {

		Test1 t1 = new Test1();
		System.out.println(t1.defaultVar);
		System.out.println(t1.protectVar);
		System.out.println(t1.publicVar);
		System.out.println(t1.getPrivateVar());
		System.out.println("===========================");

		B b = new B();

		b.show();

		b.show("");

		System.out.println("===========================");

		A a = new B();

		a.show();
		
		

		/**
		 * Lỗi khi run a.show("");
		 */

		/*
		 * a.show("");
		 * 
		 * Exception in thread "main" java.lang.Error: Unresolved compilation problem:
		 * The method show(String) from the type A is not visible
		 * 
		 * at com.huy.practice.dht.kethua.accessmodifier.test.Test2.main(Test2.java:25)
		 */

	}
}

class A {
	public String aPublicVar = "aPublicVar";
	protected String aProtectedVar = "aProtectedVar";
	private String aPrivateVar = "aPrivateVar";
	String aDefaultVar = "aDefaultVar";

	protected void show() {
		System.out.println("A");
	}

	private void show(String c) {
		System.out.println("B");
	}
	
	public String getAName() {
		return this.getClass().getName();
	}
}

class B extends A {
	public String bPublicVar = "bPublicVar";
	protected String bProtectedVar = "bProtectedVar";
	private String bPrivateVar = "bPrivateVar";
	String bDefaultVar = "bDefaultVar";

	public void show(String c) {
		System.out.println("C");
		show();
	}
	
	public String getBName() {
		return this.getClass().getName();
	}
}