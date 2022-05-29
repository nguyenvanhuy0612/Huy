package com.practice.w3schools.java003_Classes.java019_HashMap;

import java.util.HashMap;

public class Example1 {
	public static void main(String[] args) {
		// Create a HashMap object called capitalCities
		HashMap<String, String> capitalCities = new HashMap<String, String>();

		// Add keys and values (Country, City)
		capitalCities.put("England", "London");
		capitalCities.put("Germany", "Berlin");
		capitalCities.put("Norway", "Oslo");
		capitalCities.put("USA", "Washington DC");
		System.out.println("==================0");
		System.out.println(capitalCities);

		// Access an Item
		System.out.println(capitalCities.get("England"));

		// Remove an Item
		capitalCities.remove("England");

		System.out.println("==================1");
		// To remove all items, use the clear() method:
		HashMap<String, String> c1 = new HashMap<String, String>(capitalCities);
		System.out.println(c1);
		c1.clear();
		System.out.println(c1.size());

		// HashMap Size
		System.out.println(capitalCities.size());

		System.out.println("==================2");
		// Loop Through a HashMap
		// Print keys
		for (String i : capitalCities.keySet()) {
			System.out.println(i);
		}
		// Print values
		for (String i : capitalCities.values()) {
			System.out.println(i);
		}

		// Print keys and values
		for (String i : capitalCities.keySet()) {
			System.out.println("key: " + i + " | value: " + capitalCities.get(i));
		}
	}
}
