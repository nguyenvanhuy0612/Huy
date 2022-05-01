package com.test;

import org.apache.commons.lang3.tuple.MutablePair;
import org.apache.commons.lang3.tuple.MutableTriple;
import org.apache.commons.lang3.tuple.Pair;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.testng.annotations.Test;
import org.w3c.dom.*;
import org.xml.sax.InputSource;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.StringReader;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.*;
import java.util.function.Consumer;

public class Test7_XML {
    WebDriver driver;

    @Test
    public void testXml() throws Exception {
        String sourceFilePath = "D:\\AutoPOM2\\POM\\src\\test\\java\\com\\data\\strategy\\";
        String content = new String(Files.readAllBytes(Paths.get(sourceFilePath + "WSE_Progressive_Agent_Script_error_strategy.xml")));
        content = content.substring(content.indexOf("<Handler"), content.indexOf("</tns:AvayaPIMContactStrategy>"))
                .trim();
        InputSource inputSource = new InputSource();
        inputSource.setCharacterStream(new StringReader(content));
        // Instantiate the Factory
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        // optional, but recommended
        // process XML securely, avoid attacks like XML External Entities (XXE)
        //dbf.setFeature(XMLConstants.FEATURE_SECURE_PROCESSING, true);
        // parse XML file
        DocumentBuilder db = dbf.newDocumentBuilder();
        Document doc = db.parse(inputSource);
        // optional, but recommended
        // http://stackoverflow.com/questions/13786607/normalization-in-dom-parsing-with-java-how-does-it-work
        doc.getDocumentElement().normalize();
        System.out.println("Root Element :" + doc.getDocumentElement().getNodeName());
        // get <staff>
        NodeList nListHandler = doc.getElementsByTagName("Handler");
        System.out.println("nListHandler.getLength(): " + nListHandler.getLength());
        for (int i = 0; i < nListHandler.getLength(); i++) {
            Node nHandler = nListHandler.item(i);
            if (nHandler.getNodeType() == Node.ELEMENT_NODE) {
                nodeProcess(nHandler);
            }
        }
    }


    public List<MutableTriple<String, WebElement, String>> getPropertyElement() {
        //key, type, element
        List<MutableTriple<String, WebElement, String>> propertyElementList = new ArrayList<>();

        String nodePropertiesLoc = "//div[@id='propertiesBody']";
        String nodePropertiesRowLoc = "//div[@class='nodeProperties']//div[@class='tableRow']";

        for (WebElement tableRow : driver.findElements(By.xpath(nodePropertiesRowLoc))) {
            WebElement currColumnElem = tableRow.findElement(By.xpath("./div[contains(@class, 'tableColumn')][1]"));
            String key = currColumnElem.getAttribute("data-property-section");
            //String eLocAtSign = currColumnLoc + "[2]//*[contains(@data-property, '@')]";
            WebElement element = tableRow.findElement(By.xpath("./div[contains(@class, 'tableColumn')][2]//*[contains(translate(@data-property, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), '"
                    + key.replaceAll("@", "").toLowerCase() + "')]"));
            String type = element.getTagName();
            propertyElementList.add(MutableTriple.of(key, element, type));
        }
        return propertyElementList;
    }

    public List getNodeElement(String nodeName) {
        List nodeElementList = new ArrayList<>();
        String nodeFamilyLoc = "//div[@id='destinationTree']";
        By nodeNameLoc = By.xpath(nodeFamilyLoc + )
        WebElement


        return nodeElementList;
    }
    public void nodeProcess(Node nHandler) {
        List<Node> nodeList = new ArrayList<>();
        nodeList.add(nHandler);
        Node nextNode = nHandler.getNextSibling();
        while (nextNode != null) {
            nodeList.add(nextNode);
            nextNode = nextNode.getNextSibling();
        }
        Node parentNode = nodeList.get(0);
        String parentNodeName = parentNode.getNodeName();

        for (Node node : nodeList) {
            if (node.getNodeType() == Node.ELEMENT_NODE) {
                Element eElement = (Element) node;
                HashMap<String, String> attrMap = new HashMap<>();
                String nodeName = eElement.getTagName();
                nodeName = nodeName.equals("action") ? "call" : nodeName;
                nodeName = nodeName.equals("ContactAttribute") ? "address" : nodeName;
                // drag and drop for node name
                // PROCESS NODE

                NamedNodeMap attributes = eElement.getAttributes();
                if (attributes.getLength() == 0) {
                    System.out.println("nodeName: " + nodeName);
                    attrMap.put(nodeName, node.getTextContent());
                } else {
                    System.out.println("nodeName: " + nodeName);
                }
                for (int j = 0; j < attributes.getLength(); j++) {
                    Attr attr = (Attr) attributes.item(j);
                    attrMap.put(attr.getName(), attr.getValue());
                }
                System.out.println(attrMap);
                // process attribute for node name
                //  PROCESS PROPERTIES
                getPropertyElement().forEach(stringWebElementStringMutableTriple -> {
                    System.out.println(stringWebElementStringMutableTriple.toString());
                });
                System.out.println("=====================================================");
                if (node.hasChildNodes()) {
                    nodeProcess(node.getFirstChild());
                }
            }
        }
    }
}





















