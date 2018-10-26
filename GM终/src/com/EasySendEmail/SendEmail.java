package com.EasySendEmail;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail {

	public static void main(String[] args) throws MessagingException, IOException {

		Properties props = new Properties();
		Session session = Session.getInstance(props);
		MimeMessage message = new MimeMessage(session);
		 // 2. From: 发件人
        //    其中 InternetAddress 的三个参数分别为: 邮箱, 显示的昵称(只用于显示, 没有特别的要求), 昵称的字符集编码
        //    真正要发送时, 邮箱必须是真实有效的邮箱。
		 message.setFrom(new InternetAddress("228191042@qq.com", "谢大哥", "UTF-8"));
		// 3. To: 收件人
	        message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress("zz960605@126.com", "我是小弟", "UTF-8"));
	        // 4. Subject: 邮件主题
	        message.setSubject("霹雳风火轮", "UTF-8");
	        // 5. Content: 邮件正文（可以使用html标签）
	        message.setContent("哪吒", "text/html;charset=UTF-8");
	     // 6. 设置显示的发件时间
	        message.setSentDate(new Date());
	        // 7. 保存前面的设置
	        message.saveChanges();
	        
	        
	     // 8. 将该邮件保存到本地
	        OutputStream out = new FileOutputStream("MyEmail.eml");
	        message.writeTo(out);
	        out.flush();
	        out.close();
	        
	        
	        

	}
}
