package com.servlet;

import java.io.IOException;
import java.util.Properties;
import java.util.Date;

import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javax.mail.internet.InternetAddress;

public class EasyServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	public static String myEmailAccount = "228191042@qq.com";
	public static String myEmailPassword = "ksnfifggkrkbbigb";
	public static String myEmailSMTPHost = "smtp.qq.com";
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String action = request.getParameter("action");
		if("sendMail".equals(action)){
			this.sendMail(request,response);
		}
	}
	
	public void sendMail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String email = request.getParameter("email1");
		String username = request.getParameter("username1");
		System.out.println("email1="+email);
		System.out.println("username1="+username);
		HttpSession session1 = request.getSession();
		session1.setAttribute("username", username);
		
	    Properties props = new Properties();
	    props.setProperty("mail.transport.protocol", "smtp");
	    props.setProperty("mail.smtp.host", myEmailSMTPHost);
	    props.setProperty("mail.smtp.auth", "true");
	       
	    final String smtpPort = "465";
	    props.setProperty("mail.smtp.port", smtpPort);
	    props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	    props.setProperty("mail.smtp.socketFactory.fallback", "false");
	    props.setProperty("mail.smtp.socketFactory.port", smtpPort);
	    Session session = Session.getInstance(props);
	    session.setDebug(true);
	    MimeMessage message;
		try {
			message = createMimeMessage(session1, session, myEmailAccount, email);
			Transport transport = session.getTransport();
			transport.connect(myEmailSMTPHost, myEmailAccount, myEmailPassword);
			transport.sendMessage(message, message.getAllRecipients());
			transport.close();
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	   

	}
	
	
	
	public static MimeMessage createMimeMessage(HttpSession session1, Session session, String sendMail, String receiveMail) throws Exception {		
		
		String users = (String)session1.getAttribute("username");
		System.out.println("users="+users);
		MimeMessage message = new MimeMessage(session);
		message.setFrom(new InternetAddress(sendMail, "����", "UTF-8"));
	    message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(receiveMail, "��߸", "UTF-8"));
	    message.setSubject("ע�ἤ��", "UTF-8");
	    message.setContent("<a href=\"http://localhost:8080/gm/UserServlet?action=update&username="+ users +"\">��������</a>", "text/html;charset=UTF-8");
	    message.setSentDate(new Date());
	    message.saveChanges();
	    return message;
	}
	
	
	

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		this.doGet(request, response);

	}

}
