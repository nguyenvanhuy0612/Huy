package com.practice.dht.kethua.io;

import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

public class Test2 {
    public static void main(String[] args) throws IOException {
        // create reader object
        FileReader reader = new FileReader("db.properties");
        // crate properties object
        Properties properties = new Properties();
        properties.load(reader);
        // show file info
        System.out.println(properties.getProperty("user"));
        System.out.println(properties.getProperty("password"));
    }
}
