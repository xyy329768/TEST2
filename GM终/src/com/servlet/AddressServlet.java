package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.service.impl.AddressServiceImpl;
import com.service.impl.CategoryServiceImpl;
import com.service.impl.OrderServiceImpl;
import com.service.impl.ProductServiceImpl;
import com.service.inter.AddressService;
import com.service.inter.CategoryService;
import com.service.inter.OrderService;
import com.service.inter.ProductService;
import com.vo.Address;
import com.vo.Category;
import com.vo.Product;
import com.vo.User;

public class AddressServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//分发请求   给其传判别符  根据字符来判断调用什么方法
		String action=request.getParameter("action");
		if("add".equals(action)){
			this.add(request, response);
		}if("getAddress".equals(action)){
			this.getAddress(request, response);
		}
		if("runNext".equals(action)){
			this.runNext(request, response);
		}if("delete".equals(action)){
			this.delete(request, response);
		}if("update".equals(action)){
			this.update(request, response);
		}
		
		
	}
/*
	private void getAddressPage(HttpServletRequest request,HttpServletResponse response)
			throws ServletException, IOException{
		
		String target = "";

		//一.填充数据
		//二.调用业务逻辑
		//判断是否登录
	//跳到 结算页
			
			//查询购物车里的东西 在结算页  再显示一遍  为了确认
			List<Product> list = (List<Product>)service.getAttribute("shoppingCart");
			//三.转发视图
			request.setAttribute("list", list);
			
			target = "/WEB-INF/jsp/user/订单信息.jsp";
		
		//三.转发视图
		request.getRequestDispatcher(target).forward(request, response);
	}*/

	
	
	public void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	
		String target="";
		
		PrintWriter out = response.getWriter();
		
		//填充数据
		
		String aname=request.getParameter("aname");
		String aprovince=request.getParameter("aprovince");
		String acity=request.getParameter("acity");
		String adetailed=request.getParameter("adetailed");
		String aphone=request.getParameter("aphone");
	
		//System.out.println( "收货人"+ aname + "省" + aprovince +"市"+ acity + "详细地址"+adetailed +"手机号"+ aphone );
		//调用业务逻辑
		Address address=new Address();
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		address.setUserid(user.getUserid());
		address.setAname(aname);
		address.setAprovince(aprovince);
		address.setAcity(acity);
		address.setAdetailed(adetailed);
		address.setAphone(aphone);
		
		System.out.println("adress"+ address);
							
		AddressService service=new AddressServiceImpl();
		
		try {
			service.addAddress(address);
			
			request.setAttribute("msg", "添加地址成功");
		} catch (Exception e) {		
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
		}
		
		this.runNext(request, response);
	}

	
	/*public void checkOrder(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String target = "";
		System.out.println("跳转成功 得到list list1");
		//一.填充数据
		//二.调用业务逻辑
		//判断是否登录
		HttpSession session = request.getSession(true);
		AddressService service=new AddressServiceImpl();
		User user = (User)session.getAttribute("user");
		if(user==null){
			//跳到登陆页面
			target = "login.jsp";
			request.setAttribute("toWhere", "jiesuan");
		}else{

			//跳到 结算页
			
			//查询购物车里的东西 在结算页  再显示一遍  为了确认
			List<Product> list = (List<Product>)session.getAttribute("shoppingCart");
			try {
				List<Address> list1 =service.getAllAddress();
				//三.转发视图
				request.setAttribute("list", list);
				request.setAttribute("list1", list1);
				System.out.println(list1);
				target = "/WEB-INF/jsp/user/订单信息.jsp";
			} catch (Exception e) {
				System.out.println("查询所有地址失败或转发视图失败");
				e.printStackTrace();
			}
			
		}
		//三.转发视图
		request.getRequestDispatcher(target).forward(request, response);
	}*/
	
	
	public void runNext(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String target = "";
		
		//一.填充数据
		//二.调用业务逻辑
		
		HttpSession session = request.getSession(true);
		AddressService service=new AddressServiceImpl();
		
		User user = (User)session.getAttribute("user");

			//跳到 结算页
			
			//查询购物车里的东西 在结算页  再显示一遍  为了确认
			List<Product> list = (List<Product>)session.getAttribute("shoppingCart");
			try {
				List<Address> list1 =service.getAddressByUserid(user.getUserid());
				//三.转发视图
				request.setAttribute("list", list);
				request.setAttribute("list1", list1);
				System.out.println(list1);
				target = "/WEB-INF/jsp/user/订单信息.jsp";
			} catch (Exception e) {
				System.out.println("查询所有地址失败或转发视图失败");
				e.printStackTrace();
			}
			
		
		//三.转发视图
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	
	public void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String target = "";	
		String aid = request.getParameter("aid");
		System.out.println(aid);
		AddressService service = new AddressServiceImpl();
		
		try {
			
			service.deleteAddressById(aid);
			
			this.runNext(request, response);
		} catch (Exception e) {
			request.setAttribute("msg", "删除地址失败");
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp"  ;
			request.getRequestDispatcher(target).forward(request, response);
		}		
	
	}

	
	public void getAddress(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		String target = "";	
		String aid = request.getParameter("aid");
		System.out.println(aid);
		AddressService service = new AddressServiceImpl();
		try {
			Address addressud =service.getAddressById(aid);
			request.setAttribute("addressud", addressud);
			this.runNext(request, response);
		} catch (Exception e) {
			request.setAttribute("msg", "查询单个商品失败");
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
			
		}
		request.getRequestDispatcher(target).forward(request, response);
	
	}
	
	
	public void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String target="";
		
		PrintWriter out = response.getWriter();
		
		//填充数据
		String changeaid = request.getParameter("changeaid");
		
		String aname=request.getParameter("aname");
		String aprovince=request.getParameter("aprovince");
		String acity=request.getParameter("acity");
		String adetailed=request.getParameter("adetailed");
		String aphone=request.getParameter("aphone");
	
		//System.out.println( "收货人"+ aname + "省" + aprovince +"市"+ acity + "详细地址"+adetailed +"手机号"+ aphone );
		//调用业务逻辑
		Address address=new Address();
		
		
		address.setAid(Integer.parseInt(changeaid));
		address.setAname(aname);
		address.setAprovince(aprovince);
		address.setAcity(acity);
		address.setAdetailed(adetailed);
		address.setAphone(aphone);
		
		System.out.println("adress"+ address);
							
		AddressService service=new AddressServiceImpl();
		
		try {
			service.updateAddress(address);
			
			request.setAttribute("msg", "修改地址成功");
		} catch (Exception e) {		
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
		}
		
		this.runNext(request, response);
	}
	
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
