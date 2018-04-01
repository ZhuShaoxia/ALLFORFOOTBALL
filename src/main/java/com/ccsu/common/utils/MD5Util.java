package com.ccsu.common.utils;

import sun.misc.BASE64Encoder;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/3/1
 * @Time: 11:13
 * Description:MD5加密
 */
public class MD5Util {
    public static void main(String[] args) throws Exception {
        String password = "123";
        MessageDigest md5 = MessageDigest.getInstance("MD5");
        BASE64Encoder base64en = new BASE64Encoder();
        password = base64en.encode(md5.digest(password.getBytes("utf-8")));
        System.out.println(password);
    }

    public static String MD5Encode(String password) {
        MessageDigest md5 = null;
        try {
            md5 = MessageDigest.getInstance("MD5");
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        BASE64Encoder base64en = new BASE64Encoder();
        try {
            password = base64en.encode(md5.digest(password.getBytes("utf-8")));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return password;
    }
}

