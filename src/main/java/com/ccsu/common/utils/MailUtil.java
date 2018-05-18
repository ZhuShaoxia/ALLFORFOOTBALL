package com.ccsu.common.utils;

import com.ccsu.core.user.domain.User;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import java.io.UnsupportedEncodingException;
import java.util.Properties;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/5/16
 * @Time: 09:32
 * Description: 邮箱发送工具类 参考博客：https://blog.csdn.net/xietansheng/article/details/51673073
 */
public class MailUtil {
    /**
     * 发件人服务器地址
     */
    private static final String EMAIL_SMTP_HOST = "smtp.163.com";
    /**
     * 发件人用户名
     */
    private static final String EMAIL_FROM_USERNAME = "zxl950514";
    /**
     * 发件人邮箱账号
     */
    private static final String EMAIL_FROM_ACCOUNT = "zxl950514@163.com";
    /**
     * 发件人邮箱密码
     */
    private static final String EMAIL_FROM_PASSWORD = "qazZAQ123";

    public static void createEmail(User user,String code) throws MessagingException, UnsupportedEncodingException {
        String receiveEmail = user.getEmail();
        if (receiveEmail == null) {
            throw new NullPointerException("收件人邮箱账号为空");
        }
        String nickname = user.getNickname();
        if (nickname == null) {
            throw new NullPointerException("用户逆臣为空,请检查");
        }
        //1.创建参数配置 用于连接邮箱服务器的参数配置
        Properties properties = new Properties();
        properties.setProperty("mail.transport.protocol", "smtp");   // 使用的协议（JavaMail规范要求）
        properties.setProperty("mail.smtp.host", EMAIL_SMTP_HOST);   // 发件人的邮箱的 SMTP 服务器地址
        properties.setProperty("mail.smtp.auth", "true");            // 需要请求认证
        //2.创建验证器
        Authenticator auth = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(EMAIL_FROM_USERNAME, EMAIL_FROM_PASSWORD);
            }
        };
        //3.创建会话对象 用于与邮件服务器交互
        Session session = Session.getInstance(properties, auth);
        //4.创建Message 相当于是邮件内容
        Message message = new MimeMessage(session);
        //4.1发送者
        message.setFrom(new InternetAddress(EMAIL_FROM_ACCOUNT));
        //4.2设置发送方式与接收者
        message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(receiveEmail));
        message.setSubject(MimeUtility.encodeText("懂球儿-邮箱账号绑定", "UTF-8", "B"));
        String msg="尊敬的【懂球儿】用户"+user.getNickname()+"您好:验证码为"+code+"。请尽快验证,完成邮箱账号绑定或更改！若不是本人操作,请忽视此邮件。";
        message.setContent(msg, "text/html;charset=utf-8");
        // 5.创建 Transport用于将邮件发送
        Transport.send(message);
    }

}
