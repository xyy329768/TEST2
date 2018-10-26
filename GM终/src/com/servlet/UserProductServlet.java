package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.page.OrderCondition;
import com.page.PageInfo;
import com.service.impl.Category2ServiceImpl;
import com.service.impl.UserProductServiceImpl;
import com.service.inter.Category2Service;
import com.service.inter.UserProductService;
import com.vo.Category2;
import com.vo.Product;


public class UserProductServlet extends HttpServlet {
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		
		if("getProductListByCategory".equals(action)){
			this.getProductListByCategory(request, response);
		}else if("getOneProduct".equals(action)){
			this.getOneProduct(request, response);
		}else if("getPageByQuery".equals(action)){
			getPageByQuery(request,response);  
		}
	}
	public void getPageByQuery(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("in getPageByQuery");
		// 填充数据
		String sfid = request.getParameter("sfid");
		System.out.println(sfid);
		if(sfid!=null&&!sfid.trim().equals("")){
			//点菜单的商品种类的时候 使用这个
			this.getProductListByCategory(request, response);
		}else{
			//搜索框使用
			this.getPageByQuery2(request,response);
		}
	
	}
	public void getProductListByCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String target="";
		String cid = request.getParameter("cid");
		String requestPage = request.getParameter("requestPage");
		String ascOrDesc = request.getParameter("ascOrDesc");
		String orderCondition = request.getParameter("orderCondition");
		OrderCondition orderConditionObj = new OrderCondition();
		
		if(orderCondition!=null&&!orderCondition.trim().equals("")){
			orderConditionObj.setOrderCondition(orderCondition);
			orderConditionObj.setAscOrDesc(ascOrDesc);
		}
		Product product = new Product();
		product.setCid(Integer.parseInt(cid));
		UserProductService service = new UserProductServiceImpl();
	
		UserProductService service1 = new UserProductServiceImpl();

		try {
			int totalRecordCount = service.getTotalRecordCount(product);
			//System.out.println("*************"+totalRecordCount);
			PageInfo pageInfo = new PageInfo(Integer.parseInt(requestPage),12);
			pageInfo.setTotalRecordCount(totalRecordCount);
			
			List<Product> list =service1.getAllCategorysByPage(pageInfo,product,orderConditionObj);
			request.setAttribute("list", list);
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("product", product);
			request.setAttribute("orderConditionObj", orderConditionObj);
			target = "/WEB-INF/jsp/user/all_product.jsp";
		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
		}
		request.getRequestDispatcher(target).forward(request, response);
		
	}
	
	protected void getOneProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String target  ="";
		String pid = request.getParameter("pid");
		UserProductService service = new UserProductServiceImpl();
		try {
			Product product = service.getProductById(pid);
			request.setAttribute("product", product);
			target = "/WEB-INF/jsp/user/product.jsp";
		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());
			target = "/WEB-INF/msg.jsp";
			e.printStackTrace();
		}
		//3.转发视图
		request.getRequestDispatcher(target).forward(request, response);;
	}
	
	
	protected void getPageByQuery2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String target ="";
		
		System.out.println("in getPageByQuery2");
		String requestPage = request.getParameter("requestPage");
		String searchCondition = request.getParameter("searchCondition");
		String orderCondition = request.getParameter("orderCondition");
		String ascOrDesc = request.getParameter("ascOrDesc");
		System.out.println("requestPage="+requestPage);
		
		OrderCondition orderConditionObj = new OrderCondition();
		System.out.println("这是在 getPageByQuery2 中测试"+orderCondition);
		System.out.println("这是在 getPageByQuery2 中测试"+ascOrDesc);
		
		
		// 调用业务逻辑    
		Product product = new Product();
		
		if(orderCondition!=null&&!orderCondition.trim().equals("")){
			orderConditionObj.setOrderCondition(orderCondition);
			orderConditionObj.setAscOrDesc(ascOrDesc);
			product.setOrderCondition(orderConditionObj);
			System.out.println("在getPageByQuery2   if中");
		}else{
			orderConditionObj.setOrderCondition("price");
			orderConditionObj.setAscOrDesc("asc");
			product.setOrderCondition(orderConditionObj);
			System.out.println("在getPageByQuery2  else中");
		}
		
		if(requestPage==null){
			requestPage = "1";
		}
		
		Category2 category2 = new Category2();
		
		if(searchCondition!=null&&!searchCondition.equals("")){
			product.setPname(searchCondition);
			product.setDianpuName(searchCondition);
			category2.setCname(searchCondition);
			product.setCategory(category2);
			System.out.println(product);
		}else{
			product.setPname("");
			product.setDianpuName("");
			category2.setCname("");
			product.setCategory(category2);
		}
		
		// 按条件查询有多少条记录
		UserProductService service1 = new UserProductServiceImpl();
		List<Product> list = null;
		try {
			int totalRecordCount = service1.getTotalRecordCount2(product);
			PageInfo pageInfo = new PageInfo(Integer.parseInt(requestPage),12);
			pageInfo.setTotalRecordCount(totalRecordCount);
			System.out.println(totalRecordCount);
			System.out.println(pageInfo);
			
			// 调用业务逻辑
			UserProductService service2 = new UserProductServiceImpl();
			list = service2.getPageByQuery(product, pageInfo);
			
			request.setAttribute("list", list);
			request.setAttribute("product", product);
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("searchCondition", searchCondition);
			request.setAttribute("orderConditionObj", orderConditionObj);
		} catch (Exception e) {
			target = "msg.jsp";
			request.setAttribute("msg", "查询二级商品种类失败");
			e.printStackTrace();
		}
		// 转发数据
		target = "WEB-INF/jsp/user/all_product.jsp";
		System.out.println("target="+target);
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

}
