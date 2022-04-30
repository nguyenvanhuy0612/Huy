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
        String content = new String(Files.readAllBytes(Paths.get(sourceFilePath + "CGRStrategyCommonNamesPHONE2.xml")));
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

    public void locatorProcess(String element) {
        String leftBaseLoc = "//div[@id='left-component']";
        String midBaseLoc = "//div[@id='destinationTree']";
        String rightBaseLoc = "//div[@id='inner-right-component']";

        String nodePropertiesLoc = "//div[@id='propertiesBody']";
        String nodePropertiesRowLoc = "//div[@id='propertiesBody']//div[@class='tableRow']";

        for (int i = 0; i < driver.findElements(By.xpath(nodePropertiesRowLoc)).size(); i++) {

        }


        //div[@id='destinationTree']//a[contains(@id, 'AvayaPIMContactStrategy')]
        String contactStrategyLoc = midBaseLoc + "//a[contains(@id, 'AvayaPIMContactStrategy')]";

        String menuLoc = "//ul[contains(@class, 'jstree-default-contextmenu')]";
        String addNodeLoc = menuLoc + "//a[contains(text(), 'Add Node')]";
    }


    public List<MutableTriple<String, String, WebElement>> getPropertyElement() {
        //key, type, element
        List<MutableTriple<String, String, WebElement>> propertyElementList = new ArrayList<>();

        String nodePropertiesLoc = "//div[@id='propertiesBody']";
        String nodePropertiesRowLoc = "//div[@id='propertiesBody']//div[@class='tableRow']";

        for (int i = 0; i < driver.findElements(By.xpath(nodePropertiesRowLoc)).size(); i++) {
            String currColumnLoc = nodePropertiesRowLoc + "[" + i + "]/div[contains(@class, 'tableColumn')]";
            String key = driver.findElement(By.xpath(currColumnLoc + "[1]")).getAttribute("data-property-section");
            WebElement element = driver.findElement(By.xpath(currColumnLoc + "[2]//*[contains(@data-property, '@')]"));
            String type = element.getTagName();
            propertyElementList.add(MutableTriple.of(key, type, element));
        }
        return propertyElementList;
    }

    public void nodeProcess(Node n) {
        List<Node> nodeList = new ArrayList<>();
        nodeList.add(n);
        Node nextNode = n.getNextSibling();
        while (nextNode != null) {
            nodeList.add(nextNode);
            nextNode = nextNode.getNextSibling();
        }
        for (Node node : nodeList) {
            if (node.getNodeType() == Node.ELEMENT_NODE) {
                Element eElement = (Element) node;
                List<MutablePair<String, String>> attrList = new ArrayList<>();
                String nodeName = eElement.getTagName();
                // drag and drop for node name
                System.out.println("nodeName: " + nodeName);
                NamedNodeMap attributes = eElement.getAttributes();
                if (attributes.getLength() == 0) {
                    System.out.println("nodeName -> TEXT: " + node.getTextContent());
                    attrList.add(MutablePair.of(eElement.getTagName(), node.getTextContent()));

                }
                for (int j = 0; j < attributes.getLength(); j++) {
                    Attr attr = (Attr) attributes.item(j);
                    String attrName = attr.getName();
                    String attrValue = attr.getValue();
                    System.out.println("attrName: " + attrName);
                    System.out.println("attrValue: " + attrValue);
                    attrList.add(MutablePair.of(attr.getName(), attr.getValue()));
                }
                // process attribute for node name

                System.out.println("=====================================================");
                if (node.hasChildNodes()) {
                    nodeProcess(node.getFirstChild());
                }
            }

        }
    }
}





















