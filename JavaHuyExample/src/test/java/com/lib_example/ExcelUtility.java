package com.lib_example;


import java.io.FileInputStream;
import java.io.IOException;
import java.util.Iterator;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class ExcelUtility {

    private static final String HEADER_VALUES = "HEADER_VALUES";

    public static void main(String args[]) {

        try {
            String fileName = "C:/Users/NITHA/Desktop/Task.xlsx";
            // Create the input stream from the xlsx/xls file
            FileInputStream fis = new FileInputStream(fileName);

            // Create Workbook instance for xlsx/xls file input stream
            Workbook workbook = null;
            if (fileName.toLowerCase().endsWith("xlsx")) {
                workbook = new XSSFWorkbook(fis);
            } else if (fileName.toLowerCase().endsWith("xls")) {
                workbook = new HSSFWorkbook(fis);
            }

            // Get the nth sheet from the workbook
            Sheet sheet = workbook.getSheet(HEADER_VALUES);

            retrieveSheetInformation(sheet);

            // close file input stream
            fis.close();

        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private static void retrieveSheetInformation(Sheet sheet) {
        // every sheet has rows, iterate over them
        Iterator<Row> rowIterator = sheet.iterator();
        while (rowIterator.hasNext()) {

            // Get the row object
            Row row = rowIterator.next();

            // Every row has columns, get the column iterator and
            // iterate over them
            Iterator<Cell> cellIterator = row.cellIterator();
            StringBuffer sb = new StringBuffer();

            while (cellIterator.hasNext()) {
                // Get the Cell object
                Cell cell = cellIterator.next();

                // check the cell type and process accordingly
//                switch (cell.getCellType()) {
//                    case CellType.STRING: {
//                        sb.append(cell.getStringCellValue()).append(" $ ");
//                        break;
//                    }
//                    case CellType.NUMERIC:
//                        sb.append(cell.getNumericCellValue()).append("  ");
//                }
            } // end of cell iterator

            System.out.println(sb.toString());

        } // end of rows iterator
    }
}