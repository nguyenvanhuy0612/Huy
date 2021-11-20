package com.huy.practice.w3schools.Java004_FileHandling;

import java.io.File;
import java.io.FileWriter;

public class Java002_CreateAndWriteToFiles {
    /**
     * Create a File
     */
    public void createAFile() {
        try {
            //File myObj = new File("C:\\Users\\MyName\\filename.txt");
            File myObj = new File("filename.txt");
            if (myObj.createNewFile()) {
                System.out.println("File created: " + myObj.getName());
            } else {
                System.out.println("File already exists.");
            }
        } catch (Exception e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }
    }

    /**
     * Write To a File
     */
    public void writeToAFile() {
        try {
            FileWriter myWriter = new FileWriter("filename.txt");
            myWriter.write("Files in Java might be tricky, but it is fun enough!");
            myWriter.close();
            System.out.println("Successfully wrote to the file.");
        } catch (Exception e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        Java002_CreateAndWriteToFiles j2 = new Java002_CreateAndWriteToFiles();

        j2.createAFile();

        j2.writeToAFile();

    }
}
