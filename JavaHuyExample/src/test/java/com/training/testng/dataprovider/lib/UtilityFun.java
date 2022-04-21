package com.training.testng.dataprovider.lib;

import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.testng.annotations.DataProvider;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class UtilityFun
{
	@DataProvider(name = "Test_DataProvider")
	public static Object[][] dpMethod()
	{
		return new Object[][] {};
	}

	@DataProvider(name = "Test_DataProvider2")
	public static Iterator<Object[]> dpMethod2()
	{

		return null;
	}

	@DataProvider(name = "Test_DataProvider3")
	public static Object[][] dataSupplier3()
	{
		Object[][] data = new Object[1][1];
		HashMap<String, String> excelData = new HashMap<>();
		excelData.put("a", "b");
		data[0][0] = excelData;
		return data;
	}


	@DataProvider(name = "data")
	public static Object[][] dataSupplier() throws IOException
	{
		File file = new File("D:\\POM\\src\\test\\java\\com\\data\\testcasedata\\WorkspaceCCaaS.xlsx");
		FileInputStream fis = new FileInputStream(file);
		XSSFWorkbook wb = new XSSFWorkbook(fis);
		XSSFSheet sheet = wb.getSheetAt(0);
		wb.close();
		int lastRowNum = sheet.getLastRowNum();
		int lastCellNum = sheet.getRow(0).getLastCellNum();
		Object[][] obj = new Object[lastRowNum][1];
		for (int i = 0; i < lastRowNum; i++)
		{
			Map<Object, Object> datamap = new HashMap<>();
			for (int j = 0; j < lastCellNum; j++)
			{
				datamap.put(sheet.getRow(0).getCell(j), sheet.getRow(i + 1).getCell(j));
			}
			obj[i][0] = datamap;
		}
		return obj;
	}
}
