package com.enjoyMJ.modules.common.utils;


import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;

/**
 * Created by joseph on 2017/6/28.
 */
public class MailSendUtil {


    private static String mailLoginName = "josephPython@163.com";
    private static String mailLoginPassword = "qweqwe123";

    public static String myEmailSMTPHost = "smtp.163.com";


    private static String receiveMailAccount = "jealvipython@163.com";


    public static void main(String[] args) throws Exception {


        Properties properties = new Properties();   //参数配置
        properties.setProperty("mail.transport.protocol", "smtp");//协议
        properties.setProperty("mail.smtp.host", myEmailSMTPHost);//smtp邮件 地址
        properties.setProperty("mail.smtp.auth", "true");//是否认证 (不写报553  authentication is required)

        // PS: 某些邮箱服务器要求 SMTP 连接需要使用 SSL 安全认证 (为了提高安全性, 邮箱支持SSL连接, 也可以自己开启),
        //     如果无法连接邮件服务器, 仔细查看控制台打印的 log, 如果有有类似 “连接失败, 要求 SSL 安全连接” 等错误,
        //     打开下面 /* ... */ 之间的注释代码, 开启 SSL 安全连接。
        /*
        // SMTP 服务器的端口 (非 SSL 连接的端口一般默认为 25, 可以不添加, 如果开启了 SSL 连接,
        //                  需要改为对应邮箱的 SMTP 服务器的端口, 具体可查看对应邮箱服务的帮助,
        //                  QQ邮箱的SMTP(SLL)端口为465或587, 其他邮箱自行去查看)
        final String smtpPort = "465";
        props.setProperty("mail.smtp.port", smtpPort);
        props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.setProperty("mail.smtp.socketFactory.fallback", "false");
        props.setProperty("mail.smtp.socketFactory.port", smtpPort);
        */


        // 2. 根据配置创建会话对象, 用于和邮件服务器交互
        Session session = Session.getDefaultInstance(properties);
        session.setDebug(true); // 设置为debug模式, 可以查看详细的发送 log
        MimeMessage message = createMimeMessage(session, mailLoginName, receiveMailAccount);


        Transport transport = session.getTransport();
        // 5. 使用 邮箱账号 和 密码 连接邮件服务器, 这里认证的邮箱必须与 message 中的发件人邮箱一致, 否则报错
        //
        //    PS_01: 成败的判断关键在此一句, 如果连接服务器失败, 都会在控制台输出相应失败原因的 log,
        //           仔细查看失败原因, 有些邮箱服务器会返回错误码或查看错误类型的链接, 根据给出的错误
        //           类型到对应邮件服务器的帮助网站上查看具体失败原因。
        //
        //    PS_02: 连接失败的原因通常为以下几点, 仔细检查代码:
        //           (1) 邮箱没有开启 SMTP 服务;
        //           (2) 邮箱密码错误, 例如某些邮箱开启了独立密码;
        //           (3) 邮箱服务器要求必须要使用 SSL 安全连接;
        //           (4) 请求过于频繁或其他原因, 被邮件服务器拒绝服务;
        //           (5) 如果以上几点都确定无误, 到邮件服务器网站查找帮助。
        //
        //    PS_03: 仔细看log, 认真看log, 看懂log, 错误原因都在log已说明。

        transport.connect(mailLoginName, mailLoginPassword);


        transport.sendMessage(message, message.getAllRecipients());

        transport.close();
    }


    public static MimeMessage createMimeMessage(Session session, String mailLoginName, String receiveMailAccount) throws Exception {

String a ="Your Apple ID information has been updated.\n";
        //1:创建一封邮件
        MimeMessage message = new MimeMessage(session);


        //2:From:发件人
        message.setFrom(new InternetAddress(mailLoginName,a, "UTF-8"));

        //3:To:收件人 (util中有工具类, 可以抄送,密送 多送等)
        message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(receiveMailAccount, a, "UTF-8"));


        //4: 主题
        message.setSubject(a);
        String content="尊.敬.的.祁峰.女.士您.好,我是梅.浩集.团网的C.E.O梅小浩,我们了解到您最近在北.京找工作, 介于您的设计水平和经验, 我们梅浩集.团诚挚邀请您加我们的集.团, 就任首席UI设.计师一.职";

        content ="为什么总是不正确";
        //5:设置正文
        message.setContent(content, "text/html;charset=UTF-8");
        message.setSentDate(new Date());
        message.saveChanges();
        return message;

    }
}
