package com.insight.google_guava;

import com.google.common.collect.RangeMap;
import com.google.common.collect.TreeRangeMap;
import com.google.common.io.Files;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.stream.Collectors;

public class Example {

    public static void main(String[] args) throws IOException {
        List<String> lines = Files.readLines(new File("src/test/resources/staff.xml"), StandardCharsets.UTF_8)
                .stream().map(String::trim).collect(Collectors.toList());
        System.out.println(lines);
    }

    public static void main1(String[] args) {
        RangeMap<String, String> rangeMap = TreeRangeMap.create();

    }

}
