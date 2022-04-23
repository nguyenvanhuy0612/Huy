package com.test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class Test4 {
    public static void main(String[] args) {
        // copy
        int copiesCount = 0;
        Integer value = 10;
        List<Integer> copies = new ArrayList<>(Collections.nCopies(copiesCount, value));
        System.out.println(copies);
        List<Integer> copies2 = new ArrayList<>();
        copies2.addAll(copies);
        Integer[] integers = new Integer[]
                {1, 2, 3, 4, 5};
        copies.addAll(Arrays.asList(1, 2, 4, 5));
        search:
        for (Integer copy : copies) {
            if (copy == 4)
                break search;
        }
        // Java: break labeled
        int[][] arrayOfInts =
                {
                        {32, 87, 3, 589},
                        {12, 1076, 2000, 8},
                        {622, 127, 77, 955}};
        int searchfor = 12;
        int i;
        int j = 0;
        boolean foundIt = false;
        search:
        for (i = 0; i < arrayOfInts.length; i++) {
            for (j = 0; j < arrayOfInts[i].length; j++) {
                if (arrayOfInts[i][j] == searchfor) {
                    foundIt = true;
                    break search;
                }
            }
        }
        if (foundIt) {
            System.out.println("Found " + searchfor + " at " + i + ", " + j);
        } else {
            System.out.println(searchfor + " not in the array");
        }
    }
}
