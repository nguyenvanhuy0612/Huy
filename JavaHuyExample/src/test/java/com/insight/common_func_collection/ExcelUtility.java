package com.insight.common_func_collection;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.*;

public class ExcelUtility {

    public static void writeListToFile(String[][] data, String fileNamePath, String sheetName) {
        try {
            Workbook workbook = WorkbookFactory.create(true);
            Sheet sheet = workbook.createSheet(sheetName);
            for (int i = 0; i < data.length; i++) {
                Row row = sheet.createRow(i);
                String[] rData = data[i];
                for (int j = 0; j < rData.length; j++) {
                    row.createCell(j, CellType.STRING).setCellValue(rData[j]);
//                    String cData = rData[j];
//                    if (cData instanceof String)
//                        row.createCell(j, CellType.STRING).setCellValue(cData.toString());
//                    else if (cData instanceof Integer)
//                        row.createCell(j, CellType.NUMERIC).setCellValue((Integer) cData);
//                    else if (cData instanceof Double)
//                        row.createCell(j, CellType.NUMERIC).setCellValue((Double) cData);
//                    else if (cData instanceof Float)
//                        row.createCell(j, CellType.NUMERIC).setCellValue((Float) cData);
                }
            }
            FileOutputStream output = new FileOutputStream(fileNamePath);
            workbook.write(output);
            output.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void writeToFile(String fileNamePath) {
        try {
            Workbook workbook = WorkbookFactory.create(true);
            //
            XSSFWorkbook workbook1 = new XSSFWorkbook();
            Sheet spreadsheet = workbook.createSheet("Student Data");

            Map<String, Object[]> studentData = new TreeMap<>();
            studentData.put("1", new Object[]{"Roll No", "NAME", "Year"});
            studentData.put("2", new Object[]{"128", "Aditya", "2nd year"});
            studentData.put("3", new Object[]{"129", "Narayana", "2nd year"});
            studentData.put("4", new Object[]{"130", "Mohan", "2nd year"});
            studentData.put("5", new Object[]{"131", "Radha", "2nd year"});
            studentData.put("6", new Object[]{"132", "Gopal", "2nd year"});
            List<String> keyid = new ArrayList<>(studentData.keySet());

            for (int i = 0; i < studentData.size(); i++) {
                Row row = spreadsheet.createRow(i);
                Object[] cellArr = studentData.get(keyid.get(i));

                for (int j = 0; j < cellArr.length; j++) {
                    Cell cell = row.createCell(j, CellType.STRING);
                    cell.setCellValue(cellArr[j].toString());
                }
            }
            FileOutputStream fileOutputStream = new FileOutputStream(fileNamePath);
            workbook.write(fileOutputStream);
            fileOutputStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

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
                    Row row = sheet.getRow(j);

                    short firstCellNum = row.getFirstCellNum();
                    short lastCellNum = row.getLastCellNum();

                    if (row.getCell(firstCellNum, Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).toString().isEmpty()) {
                        continue;
                    }

                    HashMap<String, String> curRowMap = new HashMap<>();
                    for (int k = firstCellNum; k < headerRowList.size(); k++) {
                        Cell cell = row.getCell(k);
                        String cellValue = dataFormatter.formatCellValue(cell, formulaEvaluator);
                        curRowMap.put(headerRowList.get(k - firstCellNum), cellValue);
                        //curRowMap.put(headerRowList.get(k - firstCellNum), row.getCell(k, Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).toString());
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
                Row row = sheet.getRow(j);
                short firstCellNum = row.getFirstCellNum();
                short lastCellNum = row.getLastCellNum();
                if (row.getCell(firstCellNum).toString().equalsIgnoreCase(sTestCaseName)) {
                    for (int k = firstCellNum; k < headerRowList.size(); k++) {
                        Cell cell = row.getCell(k);
                        String cellValue = dataFormatter.formatCellValue(cell, formulaEvaluator);
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
