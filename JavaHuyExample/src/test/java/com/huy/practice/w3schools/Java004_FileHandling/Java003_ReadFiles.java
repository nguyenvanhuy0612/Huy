package com.huy.practice.w3schools.Java004_FileHandling;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class Java003_ReadFiles {

    public void readAFile() {
        try {
            File myObj = new File("filename.txt");
            Scanner myReader = new Scanner(myObj);
            while (myReader.hasNextLine()) {
                String data = myReader.nextLine();
                System.out.println(data);
            }
            myReader.close();
        } catch (FileNotFoundException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }
    }

    public void getFileInformation() {
        File myObj = new File("filename.txt");
        if (myObj.exists()) {
            System.out.println("File name: " + myObj.getName());
            System.out.println("Absolute path: " + myObj.getAbsolutePath());
            System.out.println("Writeable: " + myObj.canWrite());
            System.out.println("Readable " + myObj.canRead());
            System.out.println("File size in bytes " + myObj.length());
        } else {
            System.out.println("The file does not exist.");
        }
    }

    public static void main(String[] args) {
        Java003_ReadFiles j3 = new Java003_ReadFiles();

        j3.readAFile();

        j3.getFileInformation();
    }
}
