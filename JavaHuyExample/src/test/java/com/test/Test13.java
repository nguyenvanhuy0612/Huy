package com.test;

import org.testng.annotations.Test;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import javax.xml.XMLConstants;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class Test13 {

    public List<String> readFile(String filePath) {
        // Read File to list
        List<String> result;
        try (Stream<String> lines = Files.lines(Paths.get(filePath))) {
            result = lines.collect(Collectors.toList());
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        System.out.println("result: " + result);

        // List to String with newline symbol
        StringBuilder sb = new StringBuilder();
        result.forEach(s -> sb.append(s).append("\\n"));
        System.out.println("sb: " + sb);
        return result;
    }

    public List<String> getName(List<String> file) {
        List<String> result = new ArrayList<>();
        int index = Arrays.asList(file.get(0).split(",")).indexOf("Test Summary");
        for (String rows : file) {
            result.add(Arrays.asList(rows.split(",")).get(index));
        }
        if (result.size() > 1)
            result.remove(0);
        return result;
    }

    @Test
    public void xmlTest() {
        String path = System.getProperty("user.dir") + "/src/test/java/com/test/data/";
        String fileName = path + "UWFWorkSpacesAgent.xml";
        String fileName2 = path + "UWFWorkSpacesCallBack.xml";
        String csvFile = path + "file_export.csv";
        String outFile = path + "file.xml";
        String outFile2 = path + "file2.xml";

        List<String> nameList = getName(readFile(csvFile));

        xmlFilter(fileName2, outFile2, nameList);

    }

    private void xmlFilter(String fileName, String outFile, List<String> nameList) {
        try {
            // Instantiate the Factory
            DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();

            // optional, but recommended
            // process XML securely, avoid attacks like XML External Entities (XXE)
            dbf.setFeature(XMLConstants.FEATURE_SECURE_PROCESSING, true);

            // parse XML file
            DocumentBuilder db = dbf.newDocumentBuilder();
            Document doc = db.parse(new File(fileName));
            Document wDoc = db.newDocument();
            Element rootElement = wDoc.createElement("suite");
            rootElement.setAttribute("parallel", "false");
            rootElement.setAttribute("name", "Collect");
            wDoc.appendChild(rootElement);

            // optional, but recommended
            // http://stackoverflow.com/questions/13786607/normalization-in-dom-parsing-with-java-how-does-it-work
            doc.getDocumentElement().normalize();

            System.out.println("Root Element :" + doc.getDocumentElement().getNodeName());
            System.out.println("======================================================================================");


            /*
            Node — The base datatype of the DOM.
            Element — Represents an individual element in the DOM.
            Attr — Represents an attribute of an element.
            Text — The actual content of an Element or Attr.
            Document — Represents the entire XML document. A Document object is often referred to as a DOM tree.
             */
            NodeList nodeList = doc.getElementsByTagName("test");
            for (int i = 0; i < nodeList.getLength(); i++) {
                Node node = nodeList.item(i);
                if (node.getNodeType() == Node.ELEMENT_NODE) {
                    Element element = (Element) node;
                    String nodeAttName = element.getAttribute("name");
//                    System.out.println("nodeAttName: " + nodeAttName);
                    //System.out.println(node.getNodeName() + ", name = " + element.getAttribute("name"));
//                    if (!nameList.contains(nodeAttName)) {
//                        System.out.println("Remove: " + nodeAttName);
//                        node.getParentNode().removeChild(node);
//                    }else {
//                        Node imported_node = wDoc.importNode(node, true);
//                        Element eElement = (Element) imported_node;
//                        rootElement.insertBefore(eElement,null);
//                    }
                    if (nameList.contains(nodeAttName)) {
                        Node nNode = wDoc.importNode(node, true);
                        Element eElement = (Element) nNode;
                        rootElement.insertBefore(eElement, null);
                    }
                }
            }


            // write DOM to XML file
            Transformer tr = TransformerFactory.newInstance().newTransformer();
            tr.setOutputProperty(OutputKeys.INDENT, "yes");
            tr.transform(new DOMSource(wDoc), new StreamResult(new File(outFile)));
//            tr.transform(new DOMSource(wDoc), new StreamResult(new File(outFile + "w")));

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
