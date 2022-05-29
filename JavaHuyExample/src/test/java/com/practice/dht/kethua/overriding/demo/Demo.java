package com.practice.dht.kethua.overriding.demo;

public class Demo {
	public static void main(String[] args) {
		A a = new C();
		a.show();

		System.out.println("==========================");

		A aa = new C1();
		aa.show();

		System.out.println("==========================");

		BB bb = new BB();
		bb.show();
	}

}

class A {
	public void show() {
		System.out.println("A");
	}
}

class B extends A {
	public void show() {
		super.show();
		System.out.println("B");
	}
}

class C extends B {
	public void show() {
		System.out.println("C");
		super.show();
	}
}

class C1 extends B {
	public void show1() {
		System.out.println("C1");
		super.show();
	}
}

/**
 * 
 * @author Admin
 *
 */
class AA {
	private void show() {
		System.out.println("AA");
	}
}

class BB extends AA {
	public void show() {
		/**
		 * Bao loi super.show();
		 */
		System.out.println("BB");
	}
}