package com.ccsu.afterleaveschool.file.thinkJava;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/9/9
 * @Time: 18:39
 * Description:Java编程思想P540
 */
public class FilterInputStreamTest {
    /**
     * 缓冲输入文件
     *
     * @param filename
     * @return
     * @throws IOException
     */
    public static String read(String filename) throws IOException {
        BufferedReader in = new BufferedReader(new FileReader(new File(filename)));
        String s;
        StringBuilder stringBuilder = new StringBuilder();
        while ((s = in.readLine()) != null) {
            stringBuilder.append(s + "\n");
        }
        in.close();
        return stringBuilder.toString();
    }

    public static String readLine(String fileName) throws IOException {
        BufferedReader br = new BufferedReader(new FileReader(new File(fileName)));
        List<String> content = new LinkedList<String>();
        String s;
        while ((s = br.readLine()) != null) {
            content.add(s);
        }
        br.close();
        int size = content.size();
        for (int i = size - 1; i >= 0; i--) {
            System.out.println(content.get(i));
        }
        return null;
    }


    public static void main(String[] args) throws IOException {
        String fileName = "/Users/zhuxiaolei/error.log";
        //测试read方法
        //try {
        //    String s = FilterInputStreamTest.read(fileName);
        //    System.out.println(s);
        //} catch (IOException e) {
        //    e.printStackTrace();
        //}

        //测试readLine方法
        //readLine(fileName);
    }


}
