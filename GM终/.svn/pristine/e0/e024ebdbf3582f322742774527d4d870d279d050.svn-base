package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.page.PageInfo;
import com.service.impl.ProductServiceImpl;
import com.service.impl.User1ServiceImpl;
import com.service.inter.ProductService;
import com.service.inter.User1Service;
import com.vo.Product;
import com.vo.User1;

public class User1Servlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//分发请求
		String action = request.getParameter("action");
		if("getAll".equals(action)){
			this.getAll(request,response);
		}else if("getAllByPage".equals(action)){	
			this.getAllByPage(request,response);
		}else if("getPageByQuery".equals(action)) {
			this.getPageByQuery(request, response);
		}else if("getOneForUpdate".equals(action)){	
			this.getOneForUpdate(request,response);
		}else if("update".equals(action)){	
			this.update(request,response);
		}else if("delete".equals(action)){	
			this.delete(request,response);
		}else if("user1Active".equals(action)){
			this.user1Active(request, response);
		}
	} 
	
	public void getAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String target = "";
		//一.填充数据
		//二.调用业务逻辑
		User1Service service = new User1ServiceImpl();
		try {
			List<User1> list = service.getAllUsers();
	
			request.setAttribute("list", list);
			target="/WEB-INF/jsp/user/UserMain.jsp";
		} catch (Exception e) {
			e.printStackTrace(); 
			request.setAttribute("msg", "查询一级商品种类失败");
			target="/WEB-INF/msg.jsp";
		}
		//三.转发视图
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	public void getAllByPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String target = request.getParameter("target");
		//1.填充数据
		String requestPage = request.getParameter("requestPage");
		
		try {
			
			//查询一共多少条记录
			User1Service service = new User1ServiceImpl();
			
			int totalRecordCount = service.getTotalRecordCount();
			PageInfo pageInfo = new PageInfo(Integer.parseInt(requestPage));
			pageInfo.setTotalRecordCount(totalRecordCount);
			
			//2.调用业务逻辑
			User1Service service2 = new User1ServiceImpl();
			
			List<User1> list = service2.getAllByPage(pageInfo);
			request.setAttribute("list", list);
			request.setAttribute("pageInfo", pageInfo);
			target = "/WEB-INF/jsp/user/" + target + ".jsp";
		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
		}
		//3.转发视图
		request.getRequestDispatcher(target).forward(request, response);
		
	}
	
	public void getPageByQuery(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//1.填充数据
		String searchCondition = request.getParameter("searchCondition");
		String target = request.getParameter("target");
		String requestPage = request.getParameter("requestPage");
		if(requestPage==null){
			
			requestPage = "1";
		}
		
		User1 user1 = new User1();
		
		if(searchCondition!=null&&!searchCondition.equals("")){
			user1.setUserName(searchCondition);
			user1.setPhoneNumber(searchCondition);
			user1.setEmail(searchCondition);
		}else{
			user1.setUserName("");
			user1.setPhoneNumber("");
			user1.setEmail("");
			
		}
		
		try {
			//查询一共多少条记录
			User1Service service = new User1ServiceImpl();
			
			int totalRecordCount = service.getTotalRecordCount(user1);
			PageInfo pageInfo = new PageInfo(Integer.parseInt(requestPage));
			pageInfo.setTotalRecordCount(totalRecordCount);
			//2.调用业务逻辑
			User1Service service2 = new User1ServiceImpl();

			List<User1> list = service2.getPageByQuery(user1, pageInfo);
			request.setAttribute("list", list);
			request.setAttribute("searchCondition", searchCondition);
			request.setAttribute("pageInfo", pageInfo);
			target = "/WEB-INF/jsp/user/" + target +  ".jsp";

		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
		}
		//3.转发视图
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	public void getOneForUpdate(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String target = "";
		//1.填充数据
		String userId = request.getParameter("userId");
		//2.调用业务逻辑
		User1Service service = new User1ServiceImpl();
		
		try {
			User1 user1 = service.getUser1ById(userId);
			request.setAttribute("user1", user1);
			target = "/WEB-INF/jsp/user/updateUser1.jsp";
		} catch (Exception e) {
			
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
			target= "/WEB-INF/msg.jsp";
		}
		//3.转发视图
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	public void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String target = "";
		//1.填充数据
		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String nickName = request.getParameter("nickName");
		String phoneNumber = request.getParameter("phoneNumber");
		String email = request.getParameter("email");
		User1 user1 = new User1();
		user1.setUserId(Integer.parseInt(userId));
		user1.setUserName(userName);
		user1.setPassword(password);
		user1.setNickName(nickName);
		user1.setPhoneNumber(phoneNumber);
		user1.setEmail(email);
		//2.调用业务逻辑
		User1Service service = new User1ServiceImpl();
		try {
			service.updateUser1(user1);
			request.setAttribute("msg", "修改用户成功!");
			this.getPageByQuery(request, response);
		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
			//3.转发视图
			request.getRequestDispatcher(target).forward(request,response);
		}
		
	}
	
	public void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String target = "";
		//1.填充数据
		String userId = request.getParameter("userId");
		
		//2.调用业务逻辑
		User1Service service = new User1ServiceImpl();
		try {
			service.deleteUser1ById(userId);
			request.setAttribute("msg", "删除成功!");
			this.getAllByPage(request, response);
		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());
			target = "/WEB-INF/msg.jsp";
			e.printStackTrace();
			//3.转发视图
			request.getRequestDispatcher(target).forward(request, response);
		}
		
	}
	
	//用户激活
	private void user1Active(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String target = "";
		String userId = request.getParameter("userId");
		String isActive = request.getParameter("isActive");
		User1 user1 = new User1();
		user1.setUserId(Integer.parseInt(userId));
		user1.setIsActive(Integer.parseInt(isActive));
		User1Service service = new User1ServiceImpl();
		
		try {
			//System.out.println(service.updateUser1(user1));
			service.user1Active(user1);
			request.setAttribute("msg", "用户激活成功!");
			
			this.getPageByQuery(request, response);
		} catch (Exception e) {
			request.setAttribute("msg", "用户激活失败!");
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
			request.getRequestDispatcher(target).forward(request, response);
			
		}
		
	}	

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
