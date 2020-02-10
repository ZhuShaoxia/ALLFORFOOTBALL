package com.ccsu.afterleaveschool.file;

import com.ccsu.common.utils.StringUtils;

import java.io.*;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/9/2
 * @Time: 11:05
 * Description:
 */
public class testLoopOutAllFileName {

    /**
     * 递归循环输出文件名
     *
     * @param fileName
     */
    public static void loopOutAllFileName(String fileName) {
        if (StringUtils.isEmpty(fileName)) {
            return;
        }
        File file = new File(fileName);
        File[] files = null;
        if (file.isDirectory()) {
            files = file.listFiles();
        }
        if (files == null) {
            return;
        }
        for (File f : files) {
            if (f.isFile() && !f.isHidden()) {
                System.out.println(f.getName());
            } else if (f.isDirectory()) {
                System.out.println("==============文件==============");
                loopOutAllFileName(f.getPath());
            } else {
                System.out.println("文件读入失败");
            }
        }
    }

    public static void test(String fileName) {
        InputStream inputStream = null;
        try {
            inputStream = new FileInputStream(fileName);
        } catch (FileNotFoundException e) {
            System.out.println("====" + e.getMessage());
            e.printStackTrace();
        } finally {
            if (inputStream != null) {
                try {
                    inputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public static void main(String[] args) {
        String fileName = "/Users/zhuxiaolei/Desktop/commonn/1.zjtlcb";
        testLoopOutAllFileName.loopOutAllFileName(fileName);
    }
}
