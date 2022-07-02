package com.insight.common_func_collection;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

public class ExcelUtility {

    public static HashMap<String, String> readExcelFile(String sExcelFileNamePath, String sSheetName, String sTestCaseName) {
        System.out.println("sExcelFileNamePath: " + sExcelFileNamePath);
        System.out.println("sSheetName: " + sSheetName);
        System.out.println("sTestCaseName: " + sTestCaseName);
        HashMap<String, String> data = new HashMap<>();
        try {
            File file = new File(sExcelFileNamePath);
            FileInputStream fis = new FileInputStream(file);

            XSSFWorkbook wb = new XSSFWorkbook(fis);
            XSSFSheet sheet = wb.getSheet(sSheetName);
            Iterator<Row> itr = sheet.iterator();

            List<String> headerList = new ArrayList<>();
            List<String> rowList = new ArrayList<>();

            while (itr.hasNext()) {
                Row row = itr.next();
                List<String> curRowList = new ArrayList<>();
                row.cellIterator().forEachRemaining(cell -> curRowList.add(cell.toString()));
                if (row.getRowNum() == 0) {
                    // header
                    headerList.addAll(curRowList);
                    continue;
                }
                if (curRowList.get(0).contentEquals(sTestCaseName)) {
                    rowList.addAll(curRowList);
                    break;
                }
            }
            for (int i = 0; i < headerList.size(); i++) {
                data.put(headerList.get(i), rowList.get(i));
            }
            System.out.println(data);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return data;
    }
}
