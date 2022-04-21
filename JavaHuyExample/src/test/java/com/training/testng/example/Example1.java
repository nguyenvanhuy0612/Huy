package com.training.testng.example;

import java.util.Arrays;
import java.util.function.BiConsumer;
import java.util.function.Consumer;

public class Example1
{
	public static void main(String[] args)
	{
		int $ = 6;
		String[] __team$ = new String[]
		{ "a.Thien", "Linh", "Truong", "a.Duong", "Hoang", "Huy" };
		BiConsumer<Integer, String[]> welcome = (i, s) -> {
			System.out.println(String.format("Welcome %s to group",
			                                 i >= s.length ? s[s.length - 1] : (i < 0 ? s[0] : s[i])));
		};
		do
		{
			welcome.accept($, __team$);
			--$;
		} while ($ >= 0);
	}
}
