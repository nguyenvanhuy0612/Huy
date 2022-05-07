package com.test;

import java.io.StringReader;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.time.Duration;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.function.Function;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.commons.lang3.tuple.MutablePair;
import org.apache.commons.lang3.tuple.MutableTriple;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.testng.annotations.Test;
import org.w3c.dom.Attr;
import org.w3c.dom.Document;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;


public class Test8_XML
{
    static HashMap<String, Integer> numNodeMap;

    static HashMap<String, Integer> numParentNodeMap;

    static HashMap<String, Object> currentNodeData;


    public HashMap<String, Object> getXMLNode(Node node)
    {
        Function<String, String> nConvert = name -> {
            if (name.equals("action"))
            {
                return "call";
            } else if (name.equals("#document"))
            {
                return "campaignstrategy";
            }
            return name;
        };
        Function<String, String> attValueConvert = name -> {
            if (name.equals("phoneNumber1"))
            {
                return "Phone 1";
            }
            return name;
        };
        Function<String, String> attKeyConvert = name -> {
			/*if (name.equals("phoneNumber1"))
			{
				return "Phone 1";
			}*/
            return name;
        };
        HashMap<String, Object> data = new HashMap<>();
        List<MutablePair<String, String>> attList = new ArrayList<>();
        data.put("attList", attList);
        String nodeName = node.getNodeName();
        String parentNode = node.getParentNode().getNodeName();
        if (node.hasAttributes())
        {
            NamedNodeMap attributes = node.getAttributes();
            for (int j = 0; j < attributes.getLength(); j++)
            {
                Attr attr = (Attr) attributes.item(j);
                String value = attValueConvert.apply(attr.getValue());
                if (nodeName.equalsIgnoreCase("result"))
                {
                    value = value.replaceAll("_", " ");
                }
                attList.add(MutablePair.of(attr.getName(), value));
            }
        } else if (nodeName.equals("ContactAttribute"))
        {
            nodeName = node.getParentNode().getNodeName();
            parentNode = node.getParentNode().getParentNode().getNodeName();
            attList.add(MutablePair.of(node.getNodeName(), attValueConvert.apply(node.getTextContent())));
        }
        data.put("nodeName", nConvert.apply(nodeName));
        data.put("parentNode", nConvert.apply(parentNode));
        return data;
    }


    public void processNodeList(NodeList nList)
    {
        for (int i = 0; i < nList.getLength(); i++)
        {
            Node node = nList.item(i);
            if (node.getNodeType() != Node.ELEMENT_NODE)
            {
                continue;
            }
            currentNodeData = getXMLNode(node);
            if (node.getNodeName().equals("address"))
            {
                HashMap<String, Object> temp = getXMLNode(node.getChildNodes().item(1));
                List<MutablePair<String, String>> attList = (List<MutablePair<String, String>>) temp.get("attList");
                List<MutablePair<String, String>> currAttList = (List<MutablePair<String, String>>) currentNodeData.get("attList");
                attList.addAll(currAttList);
                currentNodeData.put("attList", attList);
                System.out.println(currentNodeData);
                System.out.println("PROCESS NODE");
                System.out.println("PROCESS PROPERTIES");
                nodeProcess(currentNodeData);
                //List<MutableTriple<String, String, WebElement>> propertyElement = getPropertyElement();
                //
            } else
            {
                System.out.println(currentNodeData);
                System.out.println("PROCESS NODE");
                System.out.println("PROCESS PROPERTIES");
                nodeProcess(currentNodeData);
                //List<MutableTriple<String, String, WebElement>> propertyElement = getPropertyElement();
                //
                if (node.hasChildNodes())
                {
                    processNodeList(node.getChildNodes());
                }
            }
        }
    }


    @Test
    public void testXML_new1() throws Exception
    {
        String sourceFilePath = "D:\\AutoPOM2\\POM\\src\\test\\java\\com\\data\\strategy\\";
        String content = new String(Files.readAllBytes(Paths.get(sourceFilePath + "test.xml")));
        content = content.substring(content.indexOf("<Handler"), content.indexOf("</tns:AvayaPIMContactStrategy>"))
                .trim();
        InputSource inputSource = new InputSource();
        inputSource.setCharacterStream(new StringReader(content));
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        DocumentBuilder db = dbf.newDocumentBuilder();
        Document doc = db.parse(inputSource);
        doc.getDocumentElement().normalize();
        numNodeMap = new HashMap<>();
        numParentNodeMap = new HashMap<>();
        processNodeList(doc.getChildNodes());
    }


    public void nodeProcess(HashMap<String, Object> data){}
/*    {
        // data: {nodeName=Handler, attList=[(foundError,false), (state,initial)], parentNode=Handler}
        String nodeName = data.get("nodeName").toString().toLowerCase();
        String parentNode = data.get("parentNode").toString().toLowerCase();
        //
        numNodeMap.put(nodeName, numNodeMap.getOrDefault(nodeName, 0) + 1);
        numParentNodeMap.put(parentNode, numNodeMap.getOrDefault(parentNode, 0) + 1);
        //
        Function<String, String> nameToLoc = name -> {
            String baseLoc = "//div[@id='destinationTree']";
            String loc = baseLoc
                    + "//span[contains(translate(., 'ABCDEFGHIJKLMNOPQRSTUVWXYZ ', 'abcdefghijklmnopqrstuvwxyz'), '"
                    + name + "')]";
            if (name.equals("result"))
            {
                loc = baseLoc
                        + "//span[contains(translate(., 'ABCDEFGHIJKLMNOPQRSTUVWXYZ ', 'abcdefghijklmnopqrstuvwxyz'), 'result') and not(contains(., 'Processors'))]";
            }
            if (name.equals("restrict"))
            {
                loc = baseLoc
                        + "//span[contains(translate(., 'ABCDEFGHIJKLMNOPQRSTUVWXYZ ', 'abcdefghijklmnopqrstuvwxyz'), 'result') and not(contains(., 'Restrictions'))]";
            }
            return loc;
        };
        //parent
        String nodeParentLoc = nameToLoc.apply(parentNode);
        //nodeParentLoc = "(" + nodeParentLoc + ")[" + numParentNodeMap.get(parentNode) + "]";
        //node
        String nodeNameLoc = nameToLoc.apply(nodeName);
        nodeNameLoc = "(" + nodeNameLoc + ")[" + numNodeMap.get(nodeName) + "]";
        //
        System.out.println(nodeParentLoc);
        System.out.println(nodeNameLoc);
        //
        WebElement pNodeE = POMCommonFunctionObj.presentElement(By.xpath(nodeParentLoc), 10);
        WebElement nodeE = POMCommonFunctionObj.presentElement(By.xpath(nodeNameLoc), 10);
        int pNodeY = pNodeE.getLocation().getY();
        Actions actions = new Actions(EnvSetup.WEBDRIVER);
        String menuLoc = "//ul[contains(@class, 'jstree-contextmenu')][contains(@class, 'jstree-default-contextmenu')]";
        if (nodeE == null || nodeE.getLocation().getY() < pNodeY)
        {
            // add node
            pNodeE.click();
            actions.moveToElement(pNodeE).pause(Duration.ofMillis(500)).contextClick(pNodeE)
                    .pause(Duration.ofMillis(500)).perform();
            utilObj.wait(2);
            WebElement addNode = EnvSetup.WEBDRIVER.findElement(By.xpath(menuLoc + "/li[./a[contains(., 'Add')]]"));
            actions.moveToElement(addNode).pause(Duration.ofMillis(500)).perform();
            //ul[contains(@class, 'jstree-contextmenu')][contains(@class, 'jstree-default-contextmenu')]/li[./a[contains(., 'Add')]]/ul/li[.//*[contains(translate(., 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), 'restr')]]
            String addNodeLoc = menuLoc
                    + "/li[./a[contains(., 'Add')]]/ul/li[.//*[contains(translate(., 'ABCDEFGHIJKLMNOPQRSTUVWXYZ',"
                    + " 'abcdefghijklmnopqrstuvwxyz'), '" + nodeName + "')]]";
            WebElement node = EnvSetup.WEBDRIVER.findElement(By.xpath(addNodeLoc));
            utilObj.wait(2);
            actions.moveToElement(node).pause(Duration.ofMillis(500)).click().perform();
            utilObj.wait(2);
        }
        nodeE = POMCommonFunctionObj.presentElement(By.xpath(nodeNameLoc), 10);
        nodeE.click();
        //
        List<MutablePair<String, String>> attList = (List<MutablePair<String, String>>) data.get("attList");
        String nodePropertiesRowLoc = "//div[@class='nodeProperties']//div[@class='tableRow']";
        for (WebElement tableRow : EnvSetup.WEBDRIVER.findElements(By.xpath(nodePropertiesRowLoc)))
        {
            WebElement currColumnElem = tableRow.findElement(By.xpath("./div[contains(@class, 'tableColumn')][1]"));
            String key = currColumnElem.getAttribute("data-property-section").replaceAll("@", "").trim();
            //String eLocAtSign = currColumnLoc + "[2]//*[contains(@data-property, '@')]";
            WebElement element = tableRow.findElement(By.xpath("./div[contains(@class, 'tableColumn')][2]//*[contains(translate(@data-property, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), '"
                    + key.toLowerCase() + "')]"));
            String type = element.getTagName();
            attList.forEach(p -> {
                String k = p.getLeft();
                String v = p.getRight();
                if (key.equalsIgnoreCase(k) && type.equals("input"))
                {
                    element.clear();
                    element.sendKeys(v);
                } else if (key.equalsIgnoreCase(k) && type.equals("select"))
                {
                    if (key.equalsIgnoreCase("allocationType"))
                    {
                        POMCommonFunctionObj.selectDropDownOptionByValue(element, v);
                    } else
                    {
                        POMCommonFunctionObj.selectDropDownOption(element, v);
                    }
                }
            });
        }
    }*/
}
