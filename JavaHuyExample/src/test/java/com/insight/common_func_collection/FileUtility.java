package com.insight.common_func_collection;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class FileUtility {

    public static List<String> readCSVFileToList(String fileNamePath) {
        // Read File to list
        List<String> result;
        try (Stream<String> lines = Files.lines(Paths.get(fileNamePath))) {
            result = lines.collect(Collectors.toList());
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        System.out.println("result: " + result);
        return result;
        // List to String with newline symbol
        //        StringBuilder sb = new StringBuilder();
        //        result.forEach(s -> sb.append(s).append("\\n"));
        //        System.out.println("sb: " + sb);
    }

    public static void writeListToFile(List<String> data, String fileNamePath) {
        // Write list to file
        System.out.println("Write to file " + fileNamePath);
        Path path = Paths.get(fileNamePath);
        try {
            if (Files.exists(path)) {
                Files.delete(path);
            }
            Files.write(path, data, StandardCharsets.UTF_8, StandardOpenOption.CREATE);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
