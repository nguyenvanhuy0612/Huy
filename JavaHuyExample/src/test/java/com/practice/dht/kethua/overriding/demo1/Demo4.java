package com.practice.dht.kethua.overriding.demo1;

public class Demo4 {
	public static void main(String[] args) {
		A4 a4 = new B4();
		a4.show();
		A4.show();
		B4.show();
	}
}
/**
 * 
 * @author Admin
 *
 */
class A4 {
	public static void show() {
		System.out.println("A");
	}
}
/**
 * 
 * @author Admin
 *
 */
class B4 extends A4 {
	public static void show() {
		System.out.println("B");
	}
}