package com.ccsu.afterleaveschool.resolveXml;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/7/10
 * @Time: 22:44
 * Description:解析XML文件
 */
public class ResolveXML {

    public static void main(String[] args) {
        File file = new File("/Users/zhuxiaolei/Desktop/classXml/jbo_awe.xml");
        try {
            ResolveXML.splitXML(file);
        } catch (DocumentException | IOException e) {
            e.printStackTrace();
        }
    }

    public static void testFile() {
        SAXReader saxReader = new SAXReader();
        try {
            Document read = saxReader.read("/Users/zhuxiaolei/IdeaProjects/ALLFORFOOTBALL/src/main/webapp/WEB-INF/web.xml");
            Element rootElement = read.getRootElement();
            List<Element> elements = rootElement.elements();
            for (Element e1 : elements) {
                String elementName = e1.getName();
                if ("error-page".equals(elementName)) {
                    System.out.println(e1.element("location").getText());
                }
                e1.add(e1);
            }
        } catch (DocumentException e) {
            e.printStackTrace();
        }
    }

    public static void DOMcreate() throws Exception {
        Document document = DocumentHelper.createDocument();
        Element rootElement = document.addElement("web-app");
        rootElement.addAttribute("version", "1.0");

//        Element errorPageElement = rootElement.addElement("error-page");
//        Element errorCode = errorPageElement.addElement("error-code");
//        errorCode.setText("404");
//        Element location = errorPageElement.addElement("location");
//        location.setText("/error");
//        errorPageElement.appendAttributes(errorCode);
//        errorPageElement.appendAttributes(location);
//        rootElement.appendAttributes(errorPageElement);
        generateXml(document, "/Users/zhuxiaolei/Desktop/test.xml");
    }

    public static void splitXML(File file) throws DocumentException, IOException {
        SAXReader saxReader = new SAXReader();
        Document readDoc;
        if (file.isDirectory()) {
            return;
        }
        readDoc = saxReader.read(file);
        Element rootElement = readDoc.getRootElement();//源jbo rootElement
        Element aPackage = rootElement.element("package");//源package aPackage
        List<Element> aClasses = aPackage.elements("class");//源class  aClass
        for (Element aClass : aClasses) {
            Document newDoc = DocumentHelper.createDocument();
            Element jboElement = newDoc.addElement("jbo");//新 设置根节点jbo
            Element packageElement = jboElement.addElement("package");//新 设置节点jbo-package
            packageElement.setAttributes(aPackage.attributes());//新 设置节点属性jbo-package
            Element classElement = packageElement.addElement("class");//新 设置节点jbo-package-class
            classElement.setAttributes(aClass.attributes());//新 设置节点属性jbo-package-class
            Element attributesElem = aClass.element("attributes");//源attributes
            if (attributesElem != null) {
                Element attributesElement = classElement.addElement("attributes");//新 设置节点jbo-package-class-attributes
                List<Element> attributesElems = attributesElem.elements();
                for (Element attrElem : attributesElems) {
                    Element attributeElement = attributesElement.addElement("attribute");//新 设置节点jbo-package-class-attributes-attribute
                    attributeElement.setAttributes(attrElem.attributes());//新 设置节点属性jbo-package-class-attributes-attribute
                }
            }
            Element managerElem = aClass.element("manager");
            if (managerElem != null) {
                Element managerPropertiesElem = managerElem.element("managerProperties");//源managerProperties
                if (managerPropertiesElem != null) {
                    Element managerPropertiesElement = classElement.addElement("manager").addElement("managerProperties");//新 设置节点jbo-package-class-manager-mangerProperties
                    List<Element> managerPropertiesElems = managerPropertiesElem.elements();
                    for (Element manageElm : managerPropertiesElems) {
                        Element propertyElement = managerPropertiesElement.addElement("property");//新 设置节点jbo-package-class-manager-mangerProperties-property
                        propertyElement.setAttributes(manageElm.attributes());//新 设置节点属性jbo-package-class-manager-mangerProperties-property
                    }
                }
            }
            String fileName = "jbo_" + aClass.attributeValue("name") + ".xml";
            String filePath = "/Users/zhuxiaolei/Desktop/classXml/" + fileName;
            generateXml(newDoc, filePath);

        }
    }

    public static void generateXml(Document document, String filePath) throws IOException {
        File file = new File(filePath);
        XMLWriter xmlWriter = new XMLWriter(new FileOutputStream(file), OutputFormat.createPrettyPrint());
        xmlWriter.setEscapeText(false);//字符是否转义,默认true
        xmlWriter.write(document);
    }

}
