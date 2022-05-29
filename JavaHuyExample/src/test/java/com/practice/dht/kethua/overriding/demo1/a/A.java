package com.practice.dht.kethua.overriding.demo1.a;

import com.practice.dht.kethua.overriding.demo1.b.B;

public class A {
	protected static int count = 0;

	void inc() {
		count++;
	}

	public static void main(String[] args) {
		A a = new B();
		a.inc();
		System.out.println(A.count);
	}
}
