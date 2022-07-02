package com.practice.test;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.insight.common_func_collection.EnvSetup;
import com.insight.common_func_collection.FileUtility;
import com.insight.common_func_collection.XMLUtility;

public class XML_Test_Strategy {

    public static void main(String[] args) {
        String file = EnvSetup.USERDIR + "/src/test/java/com/practice/test/CC_SimpleCalltest.xml";
        String fileContent = FileUtility.readFileAsString(file);
        fileContent = fileContent.substring(fileContent.indexOf("<?"), fileContent.length() - 1);

        JsonElement jsonElement = XMLUtility.xmlToJson(fileContent);
        JsonObject jsonObject = jsonElement.getAsJsonObject();

        System.out.println();
    }
}
