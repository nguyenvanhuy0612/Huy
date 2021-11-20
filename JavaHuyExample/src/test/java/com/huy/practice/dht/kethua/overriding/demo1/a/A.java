package com.huy.practice.dht.kethua.overriding.demo1.a;

public class A {
	protected static int count = 0;

	void inc() {
		count++;
	}

	public static void main(String[] args) {
		A a = new com.huy.practice.dht.kethua.overriding.demo1.b.B();
		a.inc();
		System.out.println(A.count);
	}
}
