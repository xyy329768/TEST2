package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.page.PageInfo;
import com.service.impl.OrderServiceImpl;
import com.service.impl.User1ServiceImpl;
import com.service.inter.OrderService;
import com.service.inter.User1Service;
import com.vo.Order;
import com.vo.User;

public class myOrderServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if("getAllMyOrderByPage".equals(action)){
			this.getAllMyOrderByPage(request,response);
		}else if("delete".equals(action)){
			this.delete(request,response);
		}
	}

	private void getAllMyOrderByPage(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
		
		String target = "";
		String requestPage = request.getParameter("requestPage");
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		int userid = user.getUserid();
		try {
			//查询多少条记录
			OrderService service1 = new OrderServiceImpl();
			
			int totalRecordCount = service1.getTotalRecordCountByUserid(user);
			System.out.println("totalRecordCount="+totalRecordCount);
			PageInfo pageInfo = new PageInfo(Integer.parseInt(requestPage),8);
			pageInfo.setTotalRecordCount(totalRecordCount);
			
		
			OrderService service = new OrderServiceImpl();
			List<Order> list =service.getMyOrderByPage(user,pageInfo);
			//System.out.println(list);
	
			request.setAttribute("list", list);
			request.setAttribute("pageInfo", pageInfo);
			target = "/WEB-INF/jsp/user/myOrder.jsp";
		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
		}
		request.getRequestDispatcher(target).forward(request, response);
		
	}
	
	public void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String target = "";
		//1.填充数据
		String oid = request.getParameter("oid");
		System.out.println(oid);
		//2.调用业务逻辑
		OrderService service = new OrderServiceImpl();
		OrderService service1 = new OrderServiceImpl();
		try {
			service.deleteOdetailByOid(oid);
			service1.deleteOrderByOid(oid);
			request.setAttribute("msg", "删除成功!");
			this.getAllMyOrderByPage(request, response);
		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());
			target = "/WEB-INF/msg.jsp";
			e.printStackTrace();
			//3.转发视图
			request.getRequestDispatcher(target).forward(request, response);
		}
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
