package com.EasySendEmail;

import java.util.Date;
import java.util.Properties;

import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class main {

	// �����˵� ���� �� ���루�滻Ϊ�Լ�����������룩
    // PS: ĳЩ���������Ϊ���������䱾������İ�ȫ�ԣ��� SMTP �ͻ��������˶������루�е������Ϊ����Ȩ�롱��, 
    //     ���ڿ����˶������������, ����������������ʹ������������루��Ȩ�룩��
    public static String myEmailAccount = "228191042@qq.com";
    public static String myEmailPassword = "ksnfifggkrkbbigb";
	
    // ����������� SMTP ��������ַ, ����׼ȷ, ��ͬ�ʼ���������ַ��ͬ, һ��(ֻ��һ��, ���Ǿ���)��ʽΪ: smtp.xxx.com
    // ����163����� SMTP ��������ַΪ: smtp.163.com
    public static String myEmailSMTPHost = "smtp.qq.com";
    
    // �ռ������䣨�滻Ϊ�Լ�֪������Ч���䣩
    public static String receiveMailAccount = "zz960605@126.com";
    
   public static void main(String[] args) throws Exception {
	
	   // 1. ������������, ���������ʼ��������Ĳ�������
       Properties props = new Properties();                    // ��������
       props.setProperty("mail.transport.protocol", "smtp");   // ʹ�õ�Э�飨JavaMail�淶Ҫ��
       props.setProperty("mail.smtp.host", myEmailSMTPHost);   // �����˵������ SMTP ��������ַ
       props.setProperty("mail.smtp.auth", "true");  // ��Ҫ������֤
       
       final String smtpPort = "465";
       props.setProperty("mail.smtp.port", smtpPort);
       props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
       props.setProperty("mail.smtp.socketFactory.fallback", "false");
       props.setProperty("mail.smtp.socketFactory.port", smtpPort);
       
       
       // 2. �������ô����Ự����, ���ں��ʼ�����������
       Session session = Session.getInstance(props);
       session.setDebug(true);                                 // ����Ϊdebugģʽ, ���Բ鿴��ϸ�ķ��� log
    // 3. ����һ���ʼ�
       MimeMessage message = createMimeMessage(session, myEmailAccount, receiveMailAccount);
       // 4. ���� Session ��ȡ�ʼ��������
       Transport transport = session.getTransport();
    // 5. ʹ�� �����˺� �� ���� �����ʼ�������, ������֤����������� message �еķ���������һ��, ���򱨴�
       
       transport.connect(myEmailSMTPHost, myEmailAccount, myEmailPassword);
       
       
       // 6. �����ʼ�, �������е��ռ���ַ, message.getAllRecipients() ��ȡ�������ڴ����ʼ�����ʱ��ӵ������ռ���, ������, ������
       transport.sendMessage(message, message.getAllRecipients());

       // 7. �ر�����
       transport.close();
       
}
   
   
   
   public static MimeMessage createMimeMessage(Session session, String sendMail, String receiveMail) throws Exception {
       // 1. ����һ���ʼ�
       MimeMessage message = new MimeMessage(session);

       // 2. From: �����ˣ��ǳ��й�����ɣ����ⱻ�ʼ�����������Ϊ���ķ������������ʧ�ܣ����޸��ǳƣ�
       message.setFrom(new InternetAddress(sendMail, "����", "UTF-8"));

       // 3. To: �ռ��ˣ��������Ӷ���ռ��ˡ����͡����ͣ�
       message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(receiveMail, "��߸", "UTF-8"));

       // 4. Subject: �ʼ����⣨�����й�����ɣ����ⱻ�ʼ�����������Ϊ���ķ������������ʧ�ܣ����޸ı��⣩
       message.setSubject("��������ַ����ص�", "UTF-8");

       // 5. Content: �ʼ����ģ�����ʹ��html��ǩ���������й�����ɣ����ⱻ�ʼ�����������Ϊ���ķ������������ʧ�ܣ����޸ķ������ݣ�
       message.setContent("��߸ף�����������˺��Ѿ�����ɷ���ʹ��", "text/html;charset=UTF-8");

       // 6. ���÷���ʱ��
       message.setSentDate(new Date());

       // 7. ��������
       message.saveChanges();

       return message;
   }
   
   
   
   
   
   
   
   
    
    
}
