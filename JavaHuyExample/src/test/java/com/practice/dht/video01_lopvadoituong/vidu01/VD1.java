package com.practice.dht.video01_lopvadoituong.vidu01;

public class VD1 {

    public VD1(String s) {
        System.out.println("Truyen vao mot String gia tri null: " + s);
    }

    public static void change(int[] a, int y) {
        y = 999;
        a[0] = 999;
    }

    public static void insideChange(int[] a) {
        int[] b = {9, 10, 11};
        a = b;
    }

    public static void main(String[] args) {
        /**
         * Parameter 'String' cung co the truyen gia tri 'null'
         */
        VD1 v1 = new VD1(null);

        /**
         * Java luôn dùng truyền trị (pass-by-value) để truyền các đối số
         * vào phương thức
         */
        int x = 10;
        int[] arr = {1, 2, 3};
        change(arr, x);
        System.out.println("x = " + x);
        System.out.println("arr[0] = " + arr[0]);

        int[] arr2 = {8, 9, 10};
        insideChange(arr2);
        System.out.println("arr2[0] = " + arr2[0]);

    }


}
