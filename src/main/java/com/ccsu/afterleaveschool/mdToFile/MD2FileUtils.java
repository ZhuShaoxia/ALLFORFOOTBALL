package com.ccsu.afterleaveschool.mdToFile;

import com.youbenzi.md2.export.FileFactory;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.UnsupportedEncodingException;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2020/2/16
 * @Time: 20:35
 * Description: md 文件导出工具类
 */
public class MD2FileUtils {

    public static void main(String[] args) throws FileNotFoundException, UnsupportedEncodingException {
        String filePath = "/Users/zhuxiaolei/Desktop/123.md";
        String outPutPath = "/Users/zhuxiaolei/Desktop/123.docx";
        String outPutPath1 = "/Users/zhuxiaolei/Desktop/123.pdf";
        String outPutPath2 = "/Users/zhuxiaolei/Desktop/123.html";
        //String html = MDUtil.markdown2Html(filePath);
        //System.out.println(html);

        FileFactory.produce(new File(filePath),outPutPath);
        FileFactory.produce(new File(filePath),outPutPath1);
        FileFactory.produce(new File(filePath),outPutPath2);
    }
}
