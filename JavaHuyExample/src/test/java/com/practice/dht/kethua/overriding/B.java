package com.practice.dht.kethua.overriding;

public class B extends A{
	
	public static void print() {
		System.out.println("printB");
	}
	public static void main(String[] args) {
		B b = new B();
		b.print();
	}
}
