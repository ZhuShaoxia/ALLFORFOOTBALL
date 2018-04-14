package com.ccsu.common.utils;

import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.ccsu.core.user.domain.User;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import sun.misc.BASE64Encoder;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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

    public static final DateTimeFormatter DEFAULT_DATETIME_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    public static final DateTimeFormatter DEFAULT_DATE_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    public static final DateTimeFormatter DEFAULT_TIME_FORMATTER = DateTimeFormatter.ofPattern("HH:mm:ss");

    private static final Log LOGGER = LogFactory.getLog(CommonUtils.class);

    /**
     * MD5字符串加密
     * 长度24位
     *
     * @param password
     * @return
     */
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
        return LocalDateTime.now().format(DEFAULT_DATETIME_FORMATTER).toString();
    }

    /**
     * 获取当前系统日期
     *
     * @return
     */
    public static String getCurrentDate() {
        return LocalDateTime.now().format(DEFAULT_DATE_FORMATTER).toString();
    }

    /**
     * 获取当前系统时间
     *
     * @return
     */
    public static String getCurrentTime() {
        return LocalDateTime.now().format(DEFAULT_TIME_FORMATTER).toString();
    }


    /***
     * 生成六位位随机数
     * 用于短信验证码
     * @return
     */
    private static String getSMSCode() {
        StringBuilder code = new StringBuilder();
        for (int i = 0; i < 6; i++) {
            int c = (int) (Math.random() * 10);
            code.append(c);
        }
        return code.toString();
    }

    /**
     * 发送六位位短信验证码
     *
     * @param user
     * @return
     * @throws Exception
     */
    public static String sendSMSCode(User user) throws Exception {
        if (user.getPhone() == null) {
            throw new NullPointerException("待发送手机号为空,发送失败");
        }
        String code = getSMSCode();
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
     * 根据生日计算年龄
     *
     * @param birthday
     * @return
     */
    public static Integer calculateAge(String birthday) {
        if (birthday == null && "".equals(birthday)) {
            throw new RuntimeException("输入参数值为空");
        }
        Integer age = null;
        int currentYear = Integer.parseInt(getCurrentDate().substring(0, 4));
        int year = Integer.parseInt(birthday.substring(0, 4));
        age = currentYear - year + 1;
        return age;
    }


    public static void main(String[] args) {
        String a = CommonUtils.getCurrentDate().substring(0, 4);
        System.out.println(a);
    }
}
