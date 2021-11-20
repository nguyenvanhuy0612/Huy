package com.huy.practice.w3schools.Java004_FileHandling;

import java.io.File;

public class Java004_DeleteFiles {

    public void deleteAFile() {
        File myObj = new File("filename.txt");
        if (myObj.delete()) {
            System.out.println("Deleted the file: " + myObj.getName());
        } else {
            System.out.println("Failed to delete the file.");
        }
    }

    public void deleteAFolder() {
        File myObj = new File("C:\\Users\\MyName\\Test");
        if (myObj.delete()) {
            System.out.println("Deleted the folder: " + myObj.getName());
        } else {
            System.out.println("Failed to delete the folder.");
        }
    }

}
