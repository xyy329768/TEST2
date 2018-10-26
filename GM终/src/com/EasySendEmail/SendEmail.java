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
		 // 2. From: ������
        //    ���� InternetAddress �����������ֱ�Ϊ: ����, ��ʾ���ǳ�(ֻ������ʾ, û���ر��Ҫ��), �ǳƵ��ַ�������
        //    ����Ҫ����ʱ, �����������ʵ��Ч�����䡣
		 message.setFrom(new InternetAddress("228191042@qq.com", "л���", "UTF-8"));
		// 3. To: �ռ���
	        message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress("zz960605@126.com", "����С��", "UTF-8"));
	        // 4. Subject: �ʼ�����
	        message.setSubject("���������", "UTF-8");
	        // 5. Content: �ʼ����ģ�����ʹ��html��ǩ��
	        message.setContent("��߸", "text/html;charset=UTF-8");
	     // 6. ������ʾ�ķ���ʱ��
	        message.setSentDate(new Date());
	        // 7. ����ǰ�������
	        message.saveChanges();
	        
	        
	     // 8. �����ʼ����浽����
	        OutputStream out = new FileOutputStream("MyEmail.eml");
	        message.writeTo(out);
	        out.flush();
	        out.close();
	        
	        
	        

	}
}
