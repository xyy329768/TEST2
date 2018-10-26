package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import com.alibaba.fastjson.JSON;
import com.google.gson.Gson;
import com.util.CheckSumBuilder;

public class SendServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	//发送验证码的请求路径URL
    private static final String
            SERVER_URL="https://api.netease.im/sms/sendcode.action";
    //网易云信分配的账号，请替换你在管理后台应用下申请的Appkey
    private static final String 
            APP_KEY="1925b1a11c2c208a1189d348a38214ab";
    //网易云信分配的密钥，请替换你在管理后台应用下申请的appSecret
    private static final String APP_SECRET="b7dc459209ad";
    //随机数
    private static final String NONCE="123456";
    //短信模板ID
    private static final String TEMPLATEID="3109143";
    
    //验证码长度，范围4～10，默认为4
    private static final String CODELEN="6";

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String action=request.getParameter("action");
		
		if("send".equals(action)){
			this.sendMessage(request,response);
		}else if("judge".equals(action)){
			this.judgeMessage(request,response);
		}

	}
	
	public void sendMessage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		String phoneNumber=request.getParameter("n");
		System.out.println(phoneNumber);
		 
	    //手机号
		String MOBILE=phoneNumber;
		  
		DefaultHttpClient httpClient = new DefaultHttpClient();
        HttpPost httpPost = new HttpPost(SERVER_URL);
        String curTime = String.valueOf((new Date()).getTime() / 1000L);
        
       //  * 参考计算CheckSum的java代码，在上述文档的参数列表中，有CheckSum的计算文档示例
         
        String checkSum = CheckSumBuilder.getCheckSum(APP_SECRET, NONCE, curTime);

        // 设置请求的header
        httpPost.addHeader("AppKey", APP_KEY);
        httpPost.addHeader("Nonce", NONCE);
        httpPost.addHeader("CurTime", curTime);
        httpPost.addHeader("CheckSum", checkSum);
        httpPost.addHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

        // 设置请求的的参数，requestBody参数
        List<NameValuePair> nvps = new ArrayList<NameValuePair>();
        /*
         * 1.如果是模板短信，请注意参数mobile是有s的，详细参数配置请参考“发送模板短信文档”
         * 2.参数格式是jsonArray的格式，例如 "['13888888888','13666666666']"
         * 3.params是根据你模板里面有几个参数，那里面的参数也是jsonArray格式
         */
        
       nvps.add(new BasicNameValuePair("templateid", TEMPLATEID));
        nvps.add(new BasicNameValuePair("mobile", MOBILE));
        nvps.add(new BasicNameValuePair("codeLen", CODELEN));

        httpPost.setEntity(new UrlEncodedFormEntity(nvps, "utf-8"));
        

        // 执行请求
      
        HttpResponse response2 = httpClient.execute(httpPost);
        String responseEntity=EntityUtils.toString(response2.getEntity(), "utf-8");

        String obj= JSON.parseObject(responseEntity).getString("obj");
        System.out.println("servlet="+obj);
        HttpSession session=request.getSession(true);
        session.setAttribute("obj",obj);

        
        PrintWriter out=response.getWriter();
        boolean flag=true;
        if (responseEntity.equals("{\"code\":200}")) {
        	flag= true;
        	}else{
        		   flag= false;
        	}
        Gson gson=new Gson();
		String categoryListjson=gson.toJson(flag);
		out.println(categoryListjson);
		out.flush();				
		out.close(); 

	}
	
	public void judgeMessage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String  smsCode=request.getParameter("smsCode1");
		
		System.out.println("smsCode="+smsCode);
		
		HttpSession session=request.getSession(true);
		String obj=(String) session.getAttribute("obj");
		System.out.println("obj="+obj);
		PrintWriter out=response.getWriter();
	    boolean flag=true;
	    if(obj.equals(smsCode)){
	    	flag=true;
	    }else{
	    	flag=false;
	    }
	    Gson gson=new Gson();
	    String categoryListjson=gson.toJson(flag);
		out.println(categoryListjson);
		out.flush();				
		out.close();

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		this.doGet(request, response);

	}

}
