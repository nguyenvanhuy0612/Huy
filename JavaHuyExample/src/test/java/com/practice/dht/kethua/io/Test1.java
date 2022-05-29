package com.practice.dht.kethua.io;

import java.io.File;
import java.util.Properties;

public class Test1 {

    public static void main(String[] args){
        try {
            Properties p = System.getProperties();
            String filenameFull = System.getProperty("user.dir") + "\\src\\test\\java\\" +
                    System.getProperty("sun.java.command").substring(0, System.getProperty("sun.java.command").lastIndexOf('.')).replaceAll("\\.", "\\\\") +
                    "\\filename.txt";
            File myObj = new File(filenameFull);
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
}
