package com.enjoyMJ.modules.common.utils;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.*;
import java.util.Date;
import java.util.Properties;

/**
 * Created by joseph on 2017/6/28.
 */
public class MailUtil {


    public static void main(String[] args) throws IOException, MessagingException {
        //创建一封邮件
        Properties properties = new Properties();

        Session session = Session.getDefaultInstance(properties);
        Message message = new MimeMessage(session);
/*
         * 也可以根据已有的eml邮件文件创建 MimeMessage 对象
         * MimeMessage message = new MimeMessage(session, new FileInputStream("MyEmail.eml"));
         */
        //2 :发件人
        message.setFrom(new InternetAddress("chinajva集团", "enjoyMJ", "UTF-8"));

        //3 :收件人

        message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress("jealvipython@163.com", "joseph", "UTF-8"));

//        //    To: 增加收件人（可选）
//        message.addRecipient(MimeMessage.RecipientType.TO, new InternetAddress("dd@receive.com", "USER_DD", "UTF-8"));
//        //    Cc: 抄送（可选）
//        message.setRecipient(MimeMessage.RecipientType.CC, new InternetAddress("ee@receive.com", "USER_EE", "UTF-8"));
//        //    Bcc: 密送（可选）
//        message.setRecipient(MimeMessage.RecipientType.BCC, new InternetAddress("ff@receive.com", "USER_FF", "UTF-8"));


        //邮件主题
        message.setSubject("测试邮箱");
        //邮件 正文
        message.setContent("这是正文", "UTF-8");
        //发送时间
        message.setSentDate(new Date());

        //保存前面的设置
        message.saveChanges();


        //保存该邮件到本地

        OutputStream outputStream = new FileOutputStream("MyEmail.eml");

        message.writeTo(outputStream);
        outputStream.flush();
        outputStream.close();
    }
}
