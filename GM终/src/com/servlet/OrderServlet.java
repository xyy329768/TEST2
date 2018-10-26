package com.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.page.PageInfo;
import com.service.impl.AddressServiceImpl;
import com.service.impl.CategoryServiceImpl;
import com.service.impl.OrderServiceImpl;
import com.service.impl.ProductServiceImpl;
import com.service.inter.AddressService;
import com.service.inter.CategoryService;
import com.service.inter.OrderService;
import com.vo.Address;
import com.vo.Category;
import com.vo.Odetail;
import com.vo.Order;
import com.vo.Product;
import com.vo.User;


public class OrderServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		
		if("getOrderByPage".equals(action)){
			this.getOrderByPage(request, response);
		}else if("getOdetailByPage".equals(action)){
			this.getOdetailByPage(request, response);
		}else if("getOdetailByQuery".equals(action)){
			this.getOdetailByQuery(request,response);
		}else if("getOrderByQuery".equals(action)){
			this.getOrderByQuery(request,response);
		}else if("placeOrder".equals(action)){
			this.placeOrder(request,response);
		}
	
	}
	
	

	public void placeOrder(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		String target="";
		String aid = request.getParameter("aid");
		System.out.println(aid);
		AddressService aService = new AddressServiceImpl();
		Address address =null;
		try {
			address=aService.getOneByOid(aid);
		} catch (Exception e1) {
			System.out.println("查询地址失败");
			e1.printStackTrace();
		}
		
		HttpSession session = request.getSession();
		List<Product> shoppingCart = (List<Product>) session
				.getAttribute("shoppingCart");
		User user = (User) session.getAttribute("user");
		int userId = user.getUserid();
		
		double orderTotalPrice = computeOrderTotalPrice(shoppingCart);
		Order order = new Order();
		long currentTime = System.currentTimeMillis();
		
		order.setOid(userId + "" + currentTime);
		order.setOprice(orderTotalPrice);
		order.setUserid(userId);
		order.setAname(address.getAname());
		order.setStatus(0);
		// 2.调用业务逻辑
		OrderService service = new OrderServiceImpl();
		
		try {
			String orderNo = service.addOrder(order, shoppingCart);
			//清空购物车
			session.removeAttribute("shoppingCart");
			target = "/WEB-INF/jsp/user/收银台.jsp";
		
			request.setAttribute("orderNo", orderNo);
			request.setAttribute("address",address);
			request.setAttribute("orderTotalPrice", orderTotalPrice);
		} catch (Exception e) {
			target = "/WEB-INF/msg.jsp";
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
		}
		// 3.转发视图
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	
	public double computeOrderTotalPrice(List<Product> shoppingCart) {
		double productTotalPrice = 0;

		for (Product product : shoppingCart) {

			int shoppingCarSum = product.getShoppingCarSum();
			double buyPrice = product.getPrice();
			double singleProductTotalPrice = buyPrice * shoppingCarSum;
			productTotalPrice = productTotalPrice + singleProductTotalPrice;

		}

		return productTotalPrice;
	}
	public void getOrderByQuery(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String target = "";
		String searchCondition = request.getParameter("searchCondition");
		String requestPage = request.getParameter("requestPage");
		System.out.println("searchCondition="+searchCondition);
		System.out.println("requestPage="+requestPage);
		if(requestPage==null){
			requestPage ="1";
		}
		Order order = new Order();
		 String rexp = "^((\\d{2}(([02468][048])|([13579][26]))[\\-\\/\\s]?((((0?[13578])|(1[02]))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])))))|(\\d{2}(([02468][1235679])|([13579][01345789]))[\\-\\/\\s]?((((0?[13578])|(1[02]))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\\-\\/\\s]?((0?[1-9])|(1[0-9])|(2[0-8]))))))";    
         
         Pattern pat = Pattern.compile(rexp);      
             
         Matcher mat = pat.matcher(searchCondition);      
             
         boolean isDate = mat.matches(); 
		if(searchCondition!=null&&!searchCondition.equals("")){
			if(searchCondition.trim().equals("未付款")){
				order.setStatus(0);
				
			}else if(searchCondition.trim().equals("待发货")){
				order.setStatus(1);
			}else if(isDate){
			    SimpleDateFormat sdf =   new SimpleDateFormat( "yyyy-MM-dd" );
				Date date;
				try {
					date = sdf.parse( searchCondition);
					order.setOdate(date);
				} catch (ParseException e) {
					System.out.println("日期转化异常");
					e.printStackTrace();
				}
				
				

			}else{
				order.setAname(searchCondition);
				order.setOid(searchCondition);
			}
			
		
		}
		try {
			//查询多少条记录
			OrderService service1 = new OrderServiceImpl();
			
			int totalRecordCount = service1.getTotalRecordCount(order);
			System.out.println("totalRecordCount="+totalRecordCount);
			PageInfo pageInfo = new PageInfo(Integer.parseInt(requestPage));
			pageInfo.setTotalRecordCount(totalRecordCount);
			
		
			OrderService service = new OrderServiceImpl();
			List<Order> list =service.getOrderByQuery(order,pageInfo);
			System.out.println("list="+list);
			request.setAttribute("list", list);
			request.setAttribute("searchCondition", searchCondition);
			request.setAttribute("pageInfo", pageInfo);
			target = "/WEB-INF/jsp/admin/order/order.jsp";
		} catch (Exception e) {
			request.setAttribute("msg", "按条件查询失败");
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
		}
		request.getRequestDispatcher(target).forward(request, response);
		
	}
	public void getOdetailByQuery(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String target = "";
		String searchCondition = request.getParameter("searchCondition");
		String requestPage = request.getParameter("requestPage");
		System.out.println("requestPage="+requestPage);
		System.out.println("searchCondition="+searchCondition);
		if(requestPage==null){
			requestPage ="1";
		}
		Odetail odetail = new Odetail();
		boolean isNum = searchCondition.matches("[0-9]+");
		if(searchCondition!=null&&!searchCondition.equals("")){
			if(searchCondition.trim().equals("无效")){
				odetail.setQuality(0);
				
			}else if(searchCondition.trim().equals("有效")){
				odetail.setQuality(1);
			}else if(isNum){
				odetail.setOid(searchCondition);
				odetail.setPname(searchCondition);

			}else{
				odetail.setPname(searchCondition);
				odetail.setOid(searchCondition);
			}
			
		
		}
		odetail.setQuality(1);//(默认是有效的)
		System.out.println("odetail="+odetail);
		try {
			//查询多少条记录
			OrderService service1 = new OrderServiceImpl();
			
			int totalRecordCount = service1.getTotalRecordCount(odetail);
			System.out.println("******sum***="+totalRecordCount);
			PageInfo pageInfo = new PageInfo(Integer.parseInt(requestPage));
			pageInfo.setTotalRecordCount(totalRecordCount);
			
		
			OrderService service = new OrderServiceImpl();
			List<Odetail> list =service.getOdetailByQuery(odetail,pageInfo);
			System.out.println(list);
			System.out.println(searchCondition);
			System.out.println(pageInfo.getBegin());
			request.setAttribute("list", list);
			request.setAttribute("searchCondition", searchCondition);
			request.setAttribute("pageInfo", pageInfo);
			target = "/WEB-INF/jsp/admin/order/odetail.jsp";
		} catch (Exception e) {
			request.setAttribute("msg", "按条件查询失败");
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
		}
		request.getRequestDispatcher(target).forward(request, response);
		
	}
	protected void getOrderByPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String target = "";
		String requestPage = request.getParameter("requestPage");
		
		try {
			//查询多少条记录
			OrderService service1 = new OrderServiceImpl();
			
			int totalRecordCount = service1.getTotalRecordCount();
			System.out.println("totalRecordCount="+totalRecordCount);
			PageInfo pageInfo = new PageInfo(Integer.parseInt(requestPage));
			pageInfo.setTotalRecordCount(totalRecordCount);
			
		
			OrderService service = new OrderServiceImpl();
			List<Order> list =service.getOrderByPage(pageInfo);
			//System.out.println(list);
			request.setAttribute("list", list);
			request.setAttribute("pageInfo", pageInfo);
			target = "/WEB-INF/jsp/admin/order/order.jsp";
		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
		}
		request.getRequestDispatcher(target).forward(request, response);
		

	}
	protected void getOdetailByPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String target = "";
		String requestPage = request.getParameter("requestPage");
	
		try {
			//查询多少条记录
			OrderService service1 = new OrderServiceImpl();
			
			int totalRecordCount = service1.getOdetailTotalRecordCount();
			
			PageInfo pageInfo = new PageInfo(Integer.parseInt(requestPage));
			pageInfo.setTotalRecordCount(totalRecordCount);
			
		
			OrderService service = new OrderServiceImpl();
			List<Odetail> list =service.getOdetailByPage(pageInfo);
			
			request.setAttribute("list", list);
			request.setAttribute("pageInfo", pageInfo);
			target = "/WEB-INF/jsp/admin/order/odetail.jsp";
		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
		}
		request.getRequestDispatcher(target).forward(request, response);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

}
