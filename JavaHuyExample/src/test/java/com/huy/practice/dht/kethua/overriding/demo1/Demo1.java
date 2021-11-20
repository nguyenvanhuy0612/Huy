package com.huy.practice.dht.kethua.overriding.demo1;

public class Demo1 {

	public static void main(String[] args) {
		A a = new A();
		a.show();
		System.out.println("=======================0");
		B b = new B();
		b.show();
		System.out.println("=======================1");
		B1 b1 = new B1();
		b1.show();
		System.out.println("=======================2");
		B2 b2 = new B2();
		b2.show();
		System.out.println("=======================3");
		B3 b3 = new B3();
	}
}

class A3 {
	public A3() {
		System.out.println("A");
	}

	public A3(String c) {
		this();
		System.out.println(c);
	}
}

class B3 extends A3 {
	public B3() {
		super("T");
		System.out.println("B");
	}
}

/**
 * 
 * @author Admin
 *
 */
class A2 {
	protected final void show() {
		System.out.println("A");
	}
}

class B2 extends A2 {
	public void show(String text) {
		System.out.println(text);
	}
}

/**
 * 
 * @author Admin
 *
 */
class A {
	private String getName() {
		return "A";
	}

	public void show() {
		System.out.println(this.getName());
	}
}

class B extends A {
	public String getName() {
		return "B";
	}
}

/**
 * 
 * @author Admin
 *
 */
class A1 {
	protected String getName() {
		return "A";
	}

	public void show() {
		System.out.println(this.getName());
	}
}

class B1 extends A1 {
	public String getName() {
		return "B";
	}
}