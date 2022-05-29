package com.practice.dht.kethua.accessmodifier.test;

public class Test1 {
	String defaultVar = "defaultVar";
	protected String protectVar = "protectVar";
	public String publicVar = "publicVar";
	private String privateVar = "privateVar";
	
	
	
	
	public String getDefaultVar() {
		return defaultVar;
	}
	public void setDefaultVar(String defaultVar) {
		this.defaultVar = defaultVar;
	}
	public String getProtectVar() {
		return protectVar;
	}
	public void setProtectVar(String protectVar) {
		this.protectVar = protectVar;
	}
	public String getPublicVar() {
		return publicVar;
	}
	public void setPublicVar(String publicVar) {
		this.publicVar = publicVar;
	}
	public String getPrivateVar() {
		return privateVar;
	}
	public void setPrivateVar(String privateVar) {
		this.privateVar = privateVar;
	}
}
