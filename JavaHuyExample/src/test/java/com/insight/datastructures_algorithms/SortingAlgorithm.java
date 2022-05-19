package com.insight.datastructures_algorithms;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class SortingAlgorithm {

    public static void printArray(int no, int[] a) {
        System.out.printf("%d:", no);
        /*List<Integer> list =  Arrays.stream(a).boxed().collect(Collectors.toList());
        list.forEach(integer -> System.out.printf(" %d", integer));*/
        for (int i : a) {
            System.out.printf(" %d", i);
        }
        System.out.println();
    }

    public static void bubbleSort(int[] a) {
        System.out.println("Entering method " + Thread.currentThread().getStackTrace()[1].getMethodName());
        int n = a.length;
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n - i - 1; j++) {
                if (a[j] > a[j + 1]) {
                    int t = a[j];
                    a[j] = a[j + 1];
                    a[j + 1] = t;
                }
            }
            printArray(i, a);
        }
        System.out.println();
    }

    public static void bubbleSortImprove(int[] a) {
        System.out.println("Entering method " + Thread.currentThread().getStackTrace()[1].getMethodName());
        int n = a.length;
        for (int i = 0; i < n; i++) {
            boolean isSorted = true;
            for (int j = 0; j < n - i - 1; j++) {
                if (a[j] > a[j + 1]) {
                    isSorted = false;
                    int t = a[j];
                    a[j] = a[j + 1];
                    a[j + 1] = t;
                }
            }
            printArray(i, a);
            if (isSorted) {
                break;
            }
        }
        System.out.println();
    }

    public static void insertionSort(int[] a) {
        System.out.println("Entering method " + Thread.currentThread().getStackTrace()[1].getMethodName());
        int n = a.length;
        for (int i = 1; i < n; i++) {
            // insert a[i] to arrays 0 -> i-1
            // 5, 3, 2, 7, 8, 1, 2
            int j = i - 1;
            while (j >= 0 && a[j] > a[j + 1]) {
                int t = a[j + 1];
                a[j + 1] = a[j];
                a[j] = t;
                j--;
            }
            printArray(i, a);
        }
        System.out.println();
    }

    public static void main(String[] args) {
        int[] a = {5, 3, 2, 7, 8, 1, 2};
        int[] b = {1, 2, 3, 4, 5, 7, 6};
        int[] c = {1, 2, 3, 4, 8, 7, 6};
//        bubbleSort(a);
//        bubbleSort(b);
//        bubbleSortImprove(b);
//        bubbleSortImprove(c);
        insertionSort(a);
        insertionSort(c);
    }
}
