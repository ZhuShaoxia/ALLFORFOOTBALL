package com.ccsu.common.utils;

import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.ccsu.core.user.domain.User;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import javax.mail.MessagingException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/3
 * @Time: 08:31
 * Description:工具类
 */
public class CommonUtils {

    private static final DateTimeFormatter DEFAULT_DATETIME_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    private static final DateTimeFormatter DEFAULT_DATE_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    private static final DateTimeFormatter DEFAULT_TIME_FORMATTER = DateTimeFormatter.ofPattern("HH:mm:ss");

    private static final Log LOGGER = LogFactory.getLog(CommonUtils.class);

    /**
     * MD5字符串加密
     * 长度24位
     *
     * @param str
     * @return
     *
     * commons-codec 用来编码和解码的，包括Base64，URL，DES、SHA1、MD5、Soundx等等
     * DigestUtils.md5(str); 底层代码还是采用的MessageDigest
     *
     *
     */
    public static String MD5Encode(String str) {
        MessageDigest md5 = null;
        try {
            md5 = MessageDigest.getInstance("MD5");
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        BASE64Encoder base64en = new BASE64Encoder();
        try {
            str = base64en.encode(md5.digest(str.getBytes("utf-8")));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return str;
    }

    /**
     * 生成32位不重复UUID
     *
     * @return
     */
    public static String UUIDGenerate() {
        return UUID.randomUUID().toString().replaceAll("-", "");
    }

    /**
     * 获取当前系统时间
     *
     * @return
     */
    public static String getCurrentDateTime() {
        return LocalDateTime.now().format(DEFAULT_DATETIME_FORMATTER);
    }

    /**
     * 获取当前系统日期
     *
     * @return
     */
    public static String getCurrentDate() {
        return LocalDateTime.now().format(DEFAULT_DATE_FORMATTER);
    }

    /**
     * 获取当期系统日期指定+day
     *
     * @param day
     * @return
     */
    public static String getCurrentDatePlusDay(Long day) {
        return LocalDateTime.now().plusDays(day).format(DEFAULT_DATE_FORMATTER);
    }

    /**
     * 获取当前系统时间
     *
     * @return
     */
    public static String getCurrentTime() {
        return LocalDateTime.now().format(DEFAULT_TIME_FORMATTER);
    }


    /***
     * 生成六位位随机数
     * 用于短信验证码、邮箱验证码
     * @return
     */
    private static String generateCheckCode() {
        StringBuilder code = new StringBuilder();
        for (int i = 0; i < 6; i++) {
            //int c = (int) (Math.random() * 10);
            int c  = new Random().nextInt(10);
            code.append(c);
        }
        return code.toString();
    }

    /**
     * 发送六位短信验证码
     *
     * @param user
     * @return
     * @throws Exception
     */
    public static String sendSMSCode(User user) throws Exception {
        if (user.getPhone() == null) {
            throw new NullPointerException("待发送手机号为空,发送失败");
        }
        String code = generateCheckCode();
        SendSmsResponse response = AaliSMSUtil.sendSms(user, code);
        LOGGER.debug("*************短信接口返回的数据 START*************");
        LOGGER.debug("Code=" + response.getCode());
        LOGGER.debug("Message=" + response.getMessage());
        LOGGER.debug("RequestId=" + response.getRequestId());
        LOGGER.debug("BizId=" + response.getBizId());
        LOGGER.debug("*************短信接口返回的数据 END*************");
        return code;
    }

    /**
     * 发送六位邮箱验证码
     * @param user
     * @return
     * @throws MessagingException
     */
    public static String sendMailCode(User user) throws MessagingException, UnsupportedEncodingException {
        String code = generateCheckCode();
        MailUtil.createEmail(user,code);
        return code;
    }

    /**
     * 根据生日计算年龄
     *
     * @param birthday
     * @return
     */
    public static Integer calculateAge(String birthday) {
        if (birthday == null || "".equals(birthday)) {
            throw new RuntimeException("输入参数值为空");
        }
        Integer age = null;
        int currentYear = Integer.parseInt(getCurrentDate().substring(0, 4));
        int year = Integer.parseInt(birthday.substring(0, 4));
        age = currentYear - year + 1;
        return age;
    }

    /**
     * base64转图片 并写入数据库
     *
     * @param imgStr
     * @return
     */
    public static String generateImg(String imgStr) {
        if (imgStr == null) {
            return null;
        }
        if (imgStr.contains("/uploadImg")) {
            return imgStr;
        }
        int indexOf = imgStr.indexOf(",");
        imgStr = imgStr.substring(indexOf + 1);
        String imgUrl = UUIDGenerate();
        BASE64Decoder decoder = new BASE64Decoder();
        OutputStream out;
        String realPath = "/Users/zhuxiaolei/IdeaProjects/ALLFORFOOTBALLUPLOAD/" + imgUrl + ".jpg";

        try {
            byte[] b = decoder.decodeBuffer(imgStr);
            for (int i = 0; i < b.length; ++i) {
                if (b[i] < 0) {
                    b[i] += 256;
                }
            }
            out = new FileOutputStream(realPath);
            out.write(b);
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        imgUrl = "/uploadImg/" + imgUrl + ".jpg";
        return imgUrl;
    }

    public static void main(String[] args) {
        Long timestamp = new Date().getTime();
        System.out.println(timestamp);
        Long timestamp2 = new Date().getTime();

        System.out.println(timestamp2);
        DateFormat dateFormat = new SimpleDateFormat("yyyy:MM:dd HH:mm:ss");
        String format = dateFormat.format(new Date(timestamp));
        System.out.println(format);
    }

}
