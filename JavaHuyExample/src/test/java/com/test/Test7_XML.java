package com.test;

import org.apache.commons.lang3.tuple.MutablePair;
import org.apache.commons.lang3.tuple.MutableTriple;
import org.apache.commons.lang3.tuple.Pair;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.testng.annotations.Test;
import org.w3c.dom.*;
import org.xml.sax.InputSource;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.StringReader;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.time.Duration;
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

    public WebElement getNodeElement(String nodeName, String parentNodeName) {
        String nodeFamilyLoc = "//div[@id='destinationTree']";
        //div[@id='destinationTree']//span[contains(translate(., 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), 'address')]
        By nodeNameLoc = By.xpath(nodeFamilyLoc + "//span[contains(translate(., 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), '" + nodeName.toLowerCase() + "')]");
        By parentNodeNameLoc = By.xpath(nodeFamilyLoc + "//span[contains(translate(., 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), '" + parentNodeName.toLowerCase() + "')]");
        // check present of parent node
        WebElement pNodeE = presentOf(parentNodeNameLoc, 10);
        // get parent node Y location
        int pNodeY = pNodeE.getLocation().getY();
        // check present of node, if present, get Y and compare with parent Y: parent Y <= node Y
        // if not found or match node, click to parent node and click add node
        WebElement nodeE = presentOf(nodeNameLoc, 10);
        Actions actions = new Actions(driver);
        String menuLoc = "//ul[contains(@class, 'jstree-contextmenu')][contains(@class, 'jstree-default-contextmenu')]";
        if (nodeE == null || nodeE.getLocation().getY() < pNodeY) {
            // add node
            pNodeE.click();
            actions.moveToElement(pNodeE)
                    .pause(Duration.ofMillis(500))
                    .contextClick(pNodeE)
                    .pause(Duration.ofMillis(500))
                    .perform();
            sleep(2);
            WebElement addNode = driver.findElement(By.xpath(menuLoc + "/li[./a[contains(., 'Add')]]"));
            //ul[contains(@class, 'jstree-contextmenu')][contains(@class, 'jstree-default-contextmenu')]/li[./a[contains(., 'Add')]]/ul/li[.//*[contains(translate(., 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), 'restr')]]
            String addNodeLoc = menuLoc + "/li[./a[contains(., 'Add')]]/ul/li[.//*[contains(translate(., 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'," +
                    " 'abcdefghijklmnopqrstuvwxyz'), '" + nodeName.toLowerCase() + "')]]";
            actions.moveToElement(addNode)
                    .pause(Duration.ofMillis(500))
                    .perform();
            WebElement node = driver.findElement(By.xpath(addNodeLoc));
            sleep(2);
            actions.moveToElement(node)
                    .pause(Duration.ofMillis(500))
                    .click()
                    .perform();
            sleep(2);
        }
        nodeE = presentOf(nodeNameLoc, 10);
        nodeE.click();
        return nodeE;
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
                getNodeElement(nodeName, parentNodeName);
                parentNodeName = nodeName;
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

    public WebElement presentOf(By by, int sec) {
        try {
            driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(sec));
            return driver.findElement(by);
        } catch (Exception e) {
            return null;
        } finally {
            driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(60));
        }
    }

    public WebElement presentOf(WebElement element, int sec) {
        try {
            driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(sec));
            element.isDisplayed();
            return element;
        } catch (Exception e) {
            return null;
        } finally {
            driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(60));
        }
    }

    public void sleep(double sec) {
        try {
            Thread.sleep((long) (sec * 1000));
        } catch (Exception e) {
        }
    }
}





















