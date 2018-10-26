package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ConcurrentModificationException;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.page.OrderCondition;
import com.page.PageInfo;
import com.service.impl.ProductServiceImpl;
import com.service.impl.ShoppingCartServiceImpl;
import com.service.impl.UserProductServiceImpl;
import com.service.inter.ProductService;
import com.service.inter.UserProductService;
import com.vo.Product;
import com.vo.User;


public class ShoppingCartServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		
		if("addToCart".equals(action)){
			this.addToCart(request, response);
		}else if("queryShoppingCart".equals(action)){
			this.queryShoppingCart(request, response);
		}else if("delete".equals(action)){
			this.delete(request,response);
		}else if("jia".equals(action)){
			this.jia(request,response);
		}else if("jian".equals(action)){
			this.jian(request,response);
		}else if("ifdenglu".equals(action)){
			this.ifdenglu(request,response);
		}
	}
	protected void jian(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String target="";
		String pid = request.getParameter("pid");
		HttpSession session = request.getSession(true);
		List<Product> list = (List<Product>)session.getAttribute("shoppingCart");
		Iterator<Product> iterator = list.iterator();
        while(iterator.hasNext()){
            Product p = iterator.next();
            if(p.getPid()==Integer.parseInt(pid))
                p.setShoppingCarSum(p.getShoppingCarSum()-1);   //注意这个地方
        }	
        int product_s=list.size();
    	request.setAttribute("product_s", product_s);
        target = "/WEB-INF/jsp/user/shoppingCart.jsp";
		request.setAttribute("list", list);
		
		request.getRequestDispatcher(target).forward(request, response);
//        ProductService service = new ProductServiceImpl();
//        try {
//			Product product =service.getOne(pid);
//		} catch (Exception e) {
//			System.out.println("查询商品失败");
//			e.printStackTrace();
//		}
//        
//        response.setContentType("application/json");
//        PrintWriter out =response.getWriter();
//        Gson gson = new Gson();
//       
//		String newlist = gson.toJson(product);
//        out.println(newlist);
//        out.flush();
//        out.close();

	

	}
	
	protected void jia(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String target="";
		String pid = request.getParameter("pid");
		HttpSession session = request.getSession(true);
		List<Product> list = (List<Product>)session.getAttribute("shoppingCart");
		Iterator<Product> iterator = list.iterator();
        while(iterator.hasNext()){
            Product p = iterator.next();
            if(p.getPid()==Integer.parseInt(pid))
                p.setShoppingCarSum(p.getShoppingCarSum()+1);   //注意这个地方
        }	
    	int product_s=list.size();
    	request.setAttribute("product_s", product_s);
        target = "/WEB-INF/jsp/user/shoppingCart.jsp";
		request.setAttribute("list", list);
		
		request.getRequestDispatcher(target).forward(request, response);
//        ProductService service = new ProductServiceImpl();
//        try {
//			Product product =service.getOne(pid);
//		} catch (Exception e) {
//			System.out.println("查询商品失败");
//			e.printStackTrace();
//		}
//        
//        response.setContentType("application/json");
//        PrintWriter out =response.getWriter();
//        Gson gson = new Gson();
//       
//		String newlist = gson.toJson(product);
//        out.println(newlist);
//        out.flush();
//        out.close();

	

	}
	
	protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String target = "";
		
		String pid = request.getParameter("pid");
		HttpSession session = request.getSession(true);
		List<Product> list = (List<Product>)session.getAttribute("shoppingCart");
//		System.out.println(list);
//		int oldListLength = list.size();
//		int product_s=0;
		
		
      
//		for(Product p:list){
//			if(p.getPid()==Integer.parseInt(pid)){
//				if(list.size()==1){
//					list=null;
//					
//				}else{
//					System.out.println("**************");
//					list.remove(p);
//					product_s = oldListLength-1;
//				}
//			}
//		}
		  Iterator<Product> iterator = list.iterator();
	        while(iterator.hasNext()){
	            Product p = iterator.next();
	            if(p.getPid()==Integer.parseInt(pid))
	                iterator.remove();   //注意这个地方
	        }	
	
		int product_s=list.size();
	
		target = "/WEB-INF/jsp/user/shoppingCart.jsp";
		request.setAttribute("list", list);
		request.setAttribute("product_s", product_s);
		request.getRequestDispatcher(target).forward(request, response);
		
	}
	protected void queryShoppingCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String target="";
		HttpSession session = request.getSession(true);
		List<Product> list = (List<Product>)session.getAttribute("shoppingCart");
		if(list==null||list.size()==0){
			target = "/WEB-INF/msg.jsp";
			request.setAttribute("msg", "请您登陆，就可以查看购物车了");
		}else{
			request.setAttribute("list", list);
			int product_s = list.size();
			request.setAttribute("product_s", product_s);
			target="/WEB-INF/jsp/user/shoppingCart.jsp";
		}
	
		request.getRequestDispatcher(target).forward(request, response);
	}

	protected void addToCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String target="";
		String pid = request.getParameter("pid");
		String shoppingCarSum = request.getParameter("shoppingCarSum");
		UserProductServiceImpl productService = new UserProductServiceImpl();
		try {
			Product product = productService.getProductById(pid);
			product.setShoppingCarSum(Integer.parseInt(shoppingCarSum));
			ShoppingCartServiceImpl shoppingCartService = new ShoppingCartServiceImpl();
			
			HttpSession session = request.getSession(true);
			shoppingCartService.addToCart(session, product);
			target = "/WEB-INF/jsp/user/addToShoppingCart.jsp";
			request.setAttribute("product", product);
		} catch (Exception e) {
			target = "/WEB-INF/msg.jsp";
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
		}
		// 二.调用业务逻辑

		request.getRequestDispatcher(target).forward(request, response);
	}
	
	protected void ifdenglu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession(true);
		User user=(User)session.getAttribute("user");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		
		Gson gson = new Gson();
		String islogin = gson.toJson(user);
		out.println(islogin);
		out.flush();
		out.close();
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

}