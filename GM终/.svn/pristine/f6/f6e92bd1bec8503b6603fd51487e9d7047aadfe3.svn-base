package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.service.impl.CategoryServiceImpl;
import com.service.impl.UserServiceImpl;
import com.service.inter.CategoryService;
import com.service.inter.UserService;
import com.vo.Category;
import com.vo.User;

public class UserServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String action = request.getParameter("action");
		if("login".equals(action)){
			this.login(request,response);
		}else if("logout".equals(action)){
			this.logout(request,response);
		}else if("register".equals(action)){
			this.register(request,response);
		}else if("add".equals(action)){
			this.add(request,response);
		}else if("username".equals(action)){
			this.username(request,response);
		}else if("update".equals(action)){
			this.upDate(request,response);
		}
		
		
		
		
	}
	public void username(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String target = "";
		String username = request.getParameter("username1");
		UserService service = new UserServiceImpl();
		try {
			List<User> list = service.getAllUsersName();
			List<String> names = new ArrayList<String>();
			for(User u :list){
				names.add(u.getUsername());
			}
			for(String ns:names){
				if(ns.equals(username)){
					System.out.println("用户名已存在");
					PrintWriter out=response.getWriter();
					Gson gson=new Gson();
					String categoryListjson=gson.toJson("用户名已存在");
					out.println(categoryListjson);
					out.flush();				
					out.close();
				}
			}
			  
		} catch (Exception e) {
			target = "/WEB-INF/msg.jsp";
			request.setAttribute("msg","查询失败");
			e.printStackTrace();
			request.getRequestDispatcher(target).forward(request, response);
		}
		
		
	}		
public void upDate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String target = "";
		String username = request.getParameter("username");
		User user = new User();
		user.setUsername(username);
		UserService service = new UserServiceImpl();
		
		try {
			service.updateIsactive(user);
			
			target = "/WEB-INF/jsp/user/register123.jsp";
		} catch (Exception e) {
			request.setAttribute("msg", "修改失败");
			target = "/WEB-INF/msg.jsp";
			e.printStackTrace();
		}
		request.getRequestDispatcher(target).forward(request, response);
	}
	public void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("add");
		
		String target = "";
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String confirmPass = request.getParameter("confirmPass");
		String email = request.getParameter("email");
		String phoneNumber = request.getParameter("phoneNumber");
		
		if(username == null || username.trim().isEmpty()){
			 request.setAttribute("msg", "帐号不能为空");
			 target = "/WEB-INF/msg.jsp";
			 request.getRequestDispatcher(target).forward(request, response);
			 return;
		}
		if(password == null || password.trim().isEmpty()){
			request.setAttribute("msg", "密码不能为空");
			target = "/WEB-INF/msg.jsp";
			request.getRequestDispatcher(target).forward(request, response);
			return;
		}
		if(!password.equals(confirmPass)){
			request.setAttribute("msg", "两次输入的密码不同");
			target = "/WEB-INF/msg.jsp";
			request.getRequestDispatcher(target).forward(request, response);
			return;
		}
		if(email == null || email.trim().isEmpty()){
			request.setAttribute("msg", "邮箱不能为空");
			target = "/WEB-INF/msg.jsp";
			request.getRequestDispatcher(target).forward(request, response);
			return;
		}
		if(phoneNumber == null || phoneNumber.trim().isEmpty()){
			request.setAttribute("msg", "手机号不能为空");
			target = "/WEB-INF/msg.jsp";
			request.getRequestDispatcher(target).forward(request, response);
			return;
		}
		
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		user.setConfirmPass(confirmPass);
		user.setPhoneNumber(phoneNumber);
		user.setEmail(email);
		
		HttpSession session = request.getSession();
		UserService service = new UserServiceImpl();
		try {
			service.addUser(user);
			request.setAttribute("msg","注册成功");
			session.setAttribute("user",user);
			target = "/WEB-INF/jsp/user/registerLogo.jsp";
			
		} catch (Exception e) {
			request.setAttribute("msg", "注册失败");
			target = "/WEB-INF/msg.jsp";
			e.printStackTrace();
		}
		request.getRequestDispatcher(target).forward(request, response);
	}

	public void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String target = "";
		target = "/WEB-INF/jsp/user/register.jsp";
		
		request.getRequestDispatcher(target).forward(request, response);

	}
		
	
	public void login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		String target = "";
		
		//一.填充数据
		String where = request.getParameter("where");
		System.out.println("where="+where);
		if(where==null){
			where="index.jsp";
		}
		String username = request.getParameter("loginName");
		String password = request.getParameter("password");
		
		
		//二.调用业务逻辑 
		try {
			UserServiceImpl service1 = new UserServiceImpl();
			User user1 = service1.checkUser(username);
			System.out.println(user1);
			
			if(user1.getUsername()!=null){//用户名正确，用户存在
				Date date = user1.getLoginTime();
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String lastTime = sdf.format(date);
				System.out.println("lasttime="+lastTime);
				if(user1.getLockState()==1){//账户被锁定
					System.out.println("锁定的账号");
					
					if(service1.checkUnlockTime(lastTime)){//如果账户锁定时间超过一分钟，自动解锁
						System.out.println("账户自动解锁");
						UserServiceImpl service = new UserServiceImpl();
						User user = service.login(username, password);
						if(user!=null){//根据用户名和密码找到了该用户
							
							Integer isActive = user.getIsActive();
							if(isActive==1){
								//登录成功 跳到京东首页 firstPage
								
								//将用户登录时间修改为系统当前时间
								service.updateLoginTime(username);
								
								//登录成功，将登录次数重新设为0
								service.updateUserState(username, 0, 0);
								
								//查询商品种类 用来显示首页的菜单
								CategoryService categoryService = new CategoryServiceImpl();
								List<Category> list = categoryService.getAllCategorys();
								
								
								request.setAttribute("list", list);
								HttpSession session = request.getSession(true);
								session.setAttribute("user", user); //把user对象存到session中 以后每个页面中都可以取出来使用
								if(where.equals("订单信息.jsp")){
									System.out.println("888");
								
									target="AddressServlet?action=runNext";
								
								}else{
									System.out.println("999");
									target = "/jsp/user/"+where;
								}
							
								
							}else{
								//登录失败 跳回登录页面 显示 "用户尚未激活,请激活后再尝试登录"
								request.setAttribute("msg", "用户尚未激活，请激活后再尝试登录");
								target = "/jsp/user/login.jsp";
							}
						}else if(username.equals(user1.getUsername()) && !password.equals(user1.getPassword())){//用户名正确，密码错误
							System.out.println("*****账号或密码错误******");
								
								if(user1.getLoginCount() == 4){//如果登录次数=4
									//将用户登录时间修改为系统当前时间
									service.updateLoginTime(username);
									service.updateUserState(username, user1.getLoginCount()+1, user1.getLockState()+1);
									//登录失败 跳回登录页面 显示 "用户名或密码错误"
									request.setAttribute("msg", "用户名或密码不匹配，请重新输入");
									target = "/jsp/user/login.jsp";
									
								}else if(user1.getLoginCount()<4){//如果登录次数<4
									
										//将用户登录时间修改为系统当前时间
										service.updateLoginTime(username);
								
										service.updateUserState(username, user1.getLoginCount()+1, user1.getLockState());
										//登录失败 跳回登录页面 显示 "用户名或密码错误"
										request.setAttribute("msg", "用户名或密码不匹配，请重新输入");
										target = "/jsp/user/login.jsp";
										
								}else if(user1.getLoginCount()>4){
									//将用户登录时间修改为系统当前时间
									service.updateLoginTime(username);
									//将用户登录次数重新设置为1，账户解锁
									service.updateUserState(username, 1, 0);
									request.setAttribute("msg", "用户名或密码不匹配，请重新输入");
									target = "/jsp/user/login.jsp";
								}
							
						}else{
							//登录失败 跳回登录页面 显示 "用户名或密码错误"
							request.setAttribute("msg", "用户名或密码不匹配，请重新输入");
							target = "/jsp/user/login.jsp";
						}
						
					}else{
						//登录失败 跳回登录页面 显示 "账户处于锁定状态，暂时无法登录"
						System.out.println("锁定状态");
						request.setAttribute("msg", "账户处于锁定状态，暂时无法登录");
						target = "/jsp/user/login.jsp";
					}
				}else{//账户没有被锁定
					
					UserServiceImpl service = new UserServiceImpl();
					User user = service.login(username, password);
					if(user!=null){//根据用户名和密码找到了该用户
						
						Integer isActive = user.getIsActive();
						if(isActive==1){
							//System.out.println("***名字密码都正确，也激活***");
							//登录成功 跳到京东首页 firstPage
							
							//将用户登录时间修改为系统当前时间
							service.updateLoginTime(username);
							//System.out.println("*******瞧瞧******");
							//登录成功，将登录次数重新设为0
							service.updateUserState(username, 0, 0);
							
							//查询商品种类 用来显示首页的菜单
							CategoryService categoryService = new CategoryServiceImpl();
							List<Category> list = categoryService.getAllCategorys();
							
							
							request.setAttribute("list", list);
							HttpSession session = request.getSession(true);
							session.setAttribute("user", user); //把user对象存到session中 以后每个页面中都可以取出来使用
							//System.out.println("*****here*************");
							if(where.equals("订单信息.jsp")){
								System.out.println("888");
							
								target="AddressServlet?action=runNext";
							
							}else{
								System.out.println("999");
								target = "/jsp/user/"+where;
							}
							
						}else{
							//登录失败 跳回登录页面 显示 "用户尚未激活,请激活后再尝试登录"
							request.setAttribute("msg", "用户尚未激活，请激活后再尝试登录");
							target = "/jsp/user/login.jsp";
						}
					}else if(username.equals(user1.getUsername()) && !password.equals(user1.getPassword())){//用户名正确，密码错误
							
						
							if(user1.getLoginCount() == 4){//如果登录次数=4
								//将用户登录时间修改为系统当前时间
								service.updateLoginTime(username);
								service1.updateUserState(username, user1.getLoginCount()+1, user1.getLockState()+1);
								//登录失败 跳回登录页面 显示 "用户名或密码错误"
								request.setAttribute("msg", "用户名或密码不匹配，请重新输入");
								target = "/jsp/user/login.jsp";
								
							}else if(user1.getLoginCount()<4){//如果登录次数<4
								
									//将用户登录时间修改为系统当前时间
									service1.updateLoginTime(username);
							
									service1.updateUserState(username, user1.getLoginCount()+1, user1.getLockState());
									//登录失败 跳回登录页面 显示 "用户名或密码错误"
									request.setAttribute("msg", "用户名或密码不匹配，请重新输入");
									target = "/jsp/user/login.jsp";
									
							}
						
					}else{
						//登录失败 跳回登录页面 显示 "用户名或密码错误"
						request.setAttribute("msg", "用户名或密码不匹配，请重新输入");
						target = "/jsp/user/login.jsp";
					}
					
				}
			}else{
				//登录失败 跳回登录页面 显示 "用户名或密码错误"
				request.setAttribute("msg", "用户名或密码不匹配");
				target = "/jsp/user/login.jsp";
			}
			
		} catch (Exception e) {
			target = "/WEB-INF/msg.jsp";
			request.setAttribute("msg","登录失败 请回到登录页面重新登录");
			e.printStackTrace();
		}
		
		//三.转发视图
		request.getRequestDispatcher(target).forward(request, response);
	}

	public void logout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String target = "";
		//一.填充数据
		//二.调用业务逻辑
		//退出登录 注销session即可
		HttpSession session = request.getSession(true);
		session.invalidate();
		//三.转发视图
		target = "/jsp/user/login.jsp";
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
