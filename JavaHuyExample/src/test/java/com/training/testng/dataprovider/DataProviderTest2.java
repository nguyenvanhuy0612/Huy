package com.training.testng.dataprovider;

import com.training.testng.dataprovider.lib.UtilityFun;
import org.testng.annotations.Test;

import java.util.HashMap;

public class DataProviderTest2
{
	@Test(dataProviderClass = UtilityFun.class, dataProvider = "Test_DataProvider3")
	public void test11(HashMap<String, String> data)
	{
		System.out.println(data);
	}
}
