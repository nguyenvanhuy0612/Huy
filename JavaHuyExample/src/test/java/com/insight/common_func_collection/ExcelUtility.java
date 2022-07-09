package com.insight.common_func_collection;

import org.apache.poi.ss.usermodel.*;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

public class ExcelUtility {

    public static HashMap<String, List<HashMap<String, String>>> readExcelFile(String sExcelFileNamePath) {
        System.out.println("Entering method " + Thread.currentThread().getStackTrace()[1].getMethodName());
        HashMap<String, List<HashMap<String, String>>> results = new HashMap<>();
        try {
            //File file = new File(sExcelFileNamePath);
            //FileInputStream fis = new FileInputStream(file);
            Workbook wb = WorkbookFactory.create(new File(sExcelFileNamePath));
            DataFormatter dataFormatter = new DataFormatter();
            FormulaEvaluator formulaEvaluator = wb.getCreationHelper().createFormulaEvaluator();
            formulaEvaluator.evaluateAll();
            for (int i = 0; i < wb.getNumberOfSheets(); i++) {
                // sheet
                List<HashMap<String, String>> curSheetData = new ArrayList<>();
                List<String> headerRowList = new ArrayList<>();

                Sheet sheet = wb.getSheetAt(i);

                int firstRowNum = sheet.getFirstRowNum();
                int lastRowNum = sheet.getLastRowNum();
                Row headerRow = sheet.getRow(firstRowNum);
                for (int j = headerRow.getFirstCellNum(); j <= headerRow.getLastCellNum(); j++) {
                    Cell hCell = headerRow.getCell(j);
                    String hCellValue = dataFormatter.formatCellValue(hCell, formulaEvaluator);
                    if (hCellValue.isEmpty())
                        break;
                    headerRowList.add(hCellValue);
                }

                for (int j = firstRowNum + 1; j <= lastRowNum; j++) {
                    Row curRow = sheet.getRow(j);

                    short firstCellNum = curRow.getFirstCellNum();
                    short lastCellNum = curRow.getLastCellNum();

                    if (curRow.getCell(firstCellNum, Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).toString().isEmpty()) {
                        continue;
                    }

                    HashMap<String, String> curRowMap = new HashMap<>();
                    for (int k = firstCellNum; k < headerRowList.size(); k++) {
                        Cell rowCell = curRow.getCell(k);
                        String cellValue = dataFormatter.formatCellValue(rowCell, formulaEvaluator);
                        curRowMap.put(headerRowList.get(k - firstCellNum), cellValue);
                        //curRowMap.put(headerRowList.get(k - firstCellNum), curRow.getCell(k, Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).toString());
                    }
                    curSheetData.add(curRowMap);
                }
                results.put(sheet.getSheetName(), curSheetData);
                //System.out.println(results);
//                for (int j = topRow; j < lastRow; j++) {
//                    Row row = sheet.getRow(j);
//                    List<String> rowList = new ArrayList<>();
//                    row.forEach(cell -> {
//                        CellType cellType = cell.getCellType();
//                        switch (cellType) {
//                            case _NONE:
//                                rowList.add("NONE");
//                                break;
//                            case BLANK:
//                                rowList.add("BLANK");
//                                break;
//                            case ERROR:
//                                rowList.add("ERROR");
//                                break;
//                            case STRING:
//                                rowList.add(cell.getStringCellValue());
//                                break;
//                            case BOOLEAN:
//                                rowList.add(String.valueOf(cell.getBooleanCellValue()));
//                                break;
//                            case FORMULA:
//                                rowList.add("FORMULA");
//                                break;
//                            case NUMERIC:
//                                rowList.add(String.valueOf(cell.getNumericCellValue()));
//                                break;
//                            default:
//                                rowList.add("");
//                        }
//                    });
//                    if (j == topRow) {
//                        headerList.addAll(rowList);
//                    } else {
//                        HashMap<String, String> rowMap = new HashMap<>();
//                        for (int k = 0; k < headerList.size(); k++) {
//                            rowMap.put(headerList.get(k), rowList.get(k));
//                        }
//                        curSheetData.add(rowMap);
//                    }
//
//                }
//                System.out.println();
//                for (Row row : sheet) {
//                    // row
//                    HashMap<String, String> curRowData = new HashMap<>();
//                    List<String> curRowList = new ArrayList<>();
//
//                    row.cellIterator().forEachRemaining(cell -> curRowList.add(cell.toString()));
//                    if (row.getRowNum() == 0) {
//                        // header
//                        headerList.addAll(curRowList);
//                        continue;
//                    }
//                    for (int j = 0; j < headerList.size(); j++) {
//                        curRowData.put(headerList.get(j), curRowList.get(j));
//                    }
//                    curSheetData.add(curRowData);
//                }
//                results.put(sheet.getSheetName(), curSheetData);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return results;
    }

    public static HashMap<String, String> readExcelFile(String sExcelFileNamePath, String sSheetName, String sTestCaseName) {
        System.out.println("sExcelFileNamePath: " + sExcelFileNamePath);
        System.out.println("sSheetName: " + sSheetName);
        System.out.println("sTestCaseName: " + sTestCaseName);
        HashMap<String, String> data = new HashMap<>();
        try {
            Workbook wb = WorkbookFactory.create(new File(sExcelFileNamePath));
            DataFormatter dataFormatter = new DataFormatter();
            FormulaEvaluator formulaEvaluator = wb.getCreationHelper().createFormulaEvaluator();
            formulaEvaluator.evaluateAll();
            // sheet
            List<String> headerRowList = new ArrayList<>();
            Sheet sheet = wb.getSheet(sSheetName);

            int firstRowNum = sheet.getFirstRowNum();
            int lastRowNum = sheet.getLastRowNum();
            Row headerRow = sheet.getRow(firstRowNum);
            for (int j = headerRow.getFirstCellNum(); j <= headerRow.getLastCellNum(); j++) {
                Cell hCell = headerRow.getCell(j);
                String hCellValue = dataFormatter.formatCellValue(hCell, formulaEvaluator);
                if (hCellValue.isEmpty())
                    break;
                headerRowList.add(hCellValue);
            }

            for (int j = firstRowNum + 1; j <= lastRowNum; j++) {
                Row curRow = sheet.getRow(j);
                short firstCellNum = curRow.getFirstCellNum();
                short lastCellNum = curRow.getLastCellNum();
                if (curRow.getCell(firstCellNum).toString().equalsIgnoreCase(sTestCaseName)) {
                    for (int k = firstCellNum; k < headerRowList.size(); k++) {
                        Cell rowCell = curRow.getCell(k);
                        String cellValue = dataFormatter.formatCellValue(rowCell, formulaEvaluator);
                        data.put(headerRowList.get(k - firstCellNum), cellValue);
                    }
                    break;
                }
            }
            System.out.println(data);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return data;
    }
}
