package com.test;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

public class FileCompare {
    public static void main(String[] args) throws IOException {
        String file1 = "src/test/resources/temp/txtJson.json";
        String file2 = "src/test/resources/temp/txtJson2.json";
        boolean compareFile = FileUtils.contentEquals(new File(file1), new File(file2));
        System.out.println(compareFile);
        Files.deleteIfExists(Paths.get(file2));
        FileUtils.copyFile(new File(file1), new File(file2));
    }
}
