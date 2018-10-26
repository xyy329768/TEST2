package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.page.PageInfo;
import com.service.impl.Category2ServiceImpl;
import com.service.impl.CategoryServiceImpl;
import com.service.impl.OrderServiceImpl;
import com.service.impl.ProductServiceImpl;
import com.service.inter.Category2Service;
import com.service.inter.CategoryService;
import com.service.inter.OrderService;
import com.service.inter.ProductService;
import com.vo.Category;
import com.vo.Category2;
import com.vo.Product;


public class ProductServlet extends HttpServlet {
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		if("getAllCategoryForAddProduct".equals(action)){
			this.getAllCategoryForAddProduct(request, response);
		}else if("getCategory2ByCategory1ForAddProduct".equals(action)){
			this.getCategory2ByCategory1ForAddProduct(request, response);
		}else if("add".equals(action)){
			this.add(request,response);
		}else if("getAllByPage".equals(action)){
			this.getAllByPage(request, response);
		}else if("getPageByQuery".equals(action)){
			this.getPageByQuery(request,response);
		}else if ("delete".equals(action)){
			this.delete(request, response);
		}else if("getOne".equals(action)){
			this.getOne(request, response);
		}else if("update".equals(action)){
			this.update(request, response);
		}else if("ProductUpDown".equals(action)){
			this.ProductUpDown(request, response);
		}else if("getOneForUpload".equals(action)){
			this.getOneForUpload(request, response);
		}else if("uploadImage".equals(action)){
			this.uploadImage(request,response);
		}else if("deleteSelect".equals(action)){
			this.deleteSelect(request,response);
		}
	}
	
	public void deleteSelect(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String target="";	
		String pids=request.getParameter("pid");
			 String[] list = pids.split(",");
			 ProductServiceImpl service = new ProductServiceImpl();
			 try {
					service.deleteProductByIdSelect(list);
					request.setAttribute("msg", "删除成功！");
					this.getPageByQuery(request, response);	
				} catch (Exception e) {
					request.setAttribute("msg", "删除失败！");
					target = "/WEB-INF/msg.jsp";
					e.printStackTrace();
					request.getRequestDispatcher(target).forward(request, response);
				}
	}
	public void uploadImage(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String target = "/WEB-INF/msg.jsp";
		// 一.填充数据

		// 二.调用业务逻辑
		ServletConfig servletconfig = this.getServletConfig();
		String productListUploadPath = servletconfig.getInitParameter("productImageUploadPath");
		if(productListUploadPath==null || productListUploadPath.trim().equals("")){
			request.setAttribute("msg", "系统未指定上传路径");
		}else{
			ProductServiceImpl service = new ProductServiceImpl();
			try {
				service.upload(request, productListUploadPath);
				
				request.setAttribute("msg", "上传图片成功!");
			} catch (Exception e) {
				
				request.setAttribute("msg", e.getMessage());
				e.printStackTrace();
			}
		}
		
			// 三.转发视图
		

		request.getRequestDispatcher(target).forward(request, response);
	}
	public void getOneForUpload(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String target = "";
		// 一.填充数据
		String pid = request.getParameter("pid");
		// 二.调用业务逻辑
		try {
			ProductServiceImpl service = new ProductServiceImpl();
			Product product = service.getOne(pid);

			// 三.转发视图
			target = "/WEB-INF/jsp/admin/product/uploadProductImage.jsp";
			request.setAttribute("product", product);
		} catch (Exception e) {
			
			target = "/WEB-INF/msg.jsp";
			request.setAttribute("msg", "查询单一商品信息失败");
			e.printStackTrace();
		}

		request.getRequestDispatcher(target).forward(request, response);
	}
	protected void getAllCategoryForAddProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String target = "";
		//1.填充数据
		//2.调用业务逻辑
		CategoryService service = new CategoryServiceImpl();
		try {
			List<Category> list = service.getAllCategorys();
			
			request.setAttribute("list", list);
			
			target = "/WEB-INF/jsp/admin/product/addproduct.jsp";
		} catch (Exception e) {
			request.setAttribute("msg", "查询一级商品种类失败!");
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
		}
		//3.转发视图
		request.getRequestDispatcher(target).forward(request, response);
		
		
	}
	protected void getCategory2ByCategory1ForAddProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置服务器响应的数据类型  为application/json 
		response.setContentType("application/json");
		String target = "";
		//1.填充数据
		//2.调用业务逻辑
		String category1Id = request.getParameter("category1Id");
		Category2Service service = new Category2ServiceImpl();
		//3.输出
		PrintWriter out = response.getWriter();
		try {
			List<Category2> list = service.getAllCategory2ByCategory1(Integer.parseInt(category1Id));
			Gson gson = new Gson();
			String category2ListString = gson.toJson(list);
			out.println(category2ListString);
			out.flush();
			out.close();
			
		} catch (Exception e) {
			request.setAttribute("msg", "查询一级商品种类失败!");
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
			request.getRequestDispatcher(target).forward(request, response);
		}
	}
	public void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String target = "";
		//一.填充数据
		String pname = request.getParameter("pname");
		String price = request.getParameter("price");
		String productSum = request.getParameter("productSum");
		String dianpuName = request.getParameter("dianpuName");
		String pdesc = request.getParameter("pdesc");
		String cid = request.getParameter("cid");
		
		Product product = new Product();
		product.setPname(pname);
		product.setPrice(Double.parseDouble(price));
		product.setProductSum(Integer.parseInt(productSum));
		product.setDianpuName(dianpuName);
		product.setPdesc(pdesc);
		product.setCid(Integer.parseInt(cid));
		//二.调用业务逻辑
		
		ProductService service = new ProductServiceImpl();
		try {
			service.addProduct(product);
			request.setAttribute("msg", "添加商品成功");
		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
		}
		//三.转发视图
		target = "/WEB-INF/msg.jsp";
		request.getRequestDispatcher(target).forward(request, response);
	}
	public void getAllByPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String target = request.getParameter("target");
		String requestPage = request.getParameter("requestPage");
		
		
		
		try {
			//查询多少条记录
			ProductService service1 = new ProductServiceImpl();
			
			int totalRecordCount = service1.getTotalRecordCount();
		
			PageInfo pageInfo = new PageInfo(Integer.parseInt(requestPage));
			pageInfo.setTotalRecordCount(totalRecordCount);
			
		
			ProductService service = new ProductServiceImpl();
			List<Product> list =service.getAllCategorysByPage(pageInfo);
			request.setAttribute("list", list);
			request.setAttribute("pageInfo", pageInfo);
			target = "/WEB-INF/jsp/admin/product/" + target + ".jsp";
		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
		}
		request.getRequestDispatcher(target).forward(request, response);
		
	}
	public void getPageByQuery(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String target = request.getParameter("target");
		String searchCondition = request.getParameter("searchCondition");
		String requestPage = request.getParameter("requestPage");
		if(requestPage==null){
			requestPage ="1";
		}
		Category2 category = new Category2();
		Product product = new Product();
		if(searchCondition!=null&&!searchCondition.equals("")){
			category.setCname(searchCondition);
			product.setPname(searchCondition);
			product.setDianpuName(searchCondition);
			product.setCategory(category);
		}else{
			category.setCname("");
			product.setPname("");
			product.setDianpuName("");
			product.setCategory(category);
		}
		try {
			//查询多少条记录
			ProductService service1 = new ProductServiceImpl();
			int totalRecordCount = service1.getAllTotalRecordCount(product);
			PageInfo pageInfo = new PageInfo(Integer.parseInt(requestPage));
			pageInfo.setTotalRecordCount(totalRecordCount);
			
		
			ProductService service = new ProductServiceImpl();
			List<Product> list =service.getPageByQuery(product,pageInfo);
			
			request.setAttribute("list", list);
			request.setAttribute("searchCondition", searchCondition);
			request.setAttribute("pageInfo", pageInfo);
			target = "/WEB-INF/jsp/admin/product/" + target + ".jsp";
		} catch (Exception e) {
			request.setAttribute("msg", "按条件查询失败");
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
		}
		request.getRequestDispatcher(target).forward(request, response);
		
	}
	private void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String target = "";
		String cid = request.getParameter("cid");
		ProductService service = new ProductServiceImpl();
		OrderService oservice = new OrderServiceImpl();
		try {
			oservice.chaneOdetailQuality(cid);
			service.deleteCategoryByCid(cid);
			request.setAttribute("msg", "删除成功");
			this.getPageByQuery(request, response);
		} catch (Exception e) {
			request.setAttribute("msg", "删除单个商品失败");
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
			request.getRequestDispatcher(target).forward(request, response);
		}
		
	}	
	private void getOne(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String target = "";
		String cid = request.getParameter("cid");
		Category2Service service = new Category2ServiceImpl();	
		Product product = new Product();
		product.setPid(Integer.parseInt(cid));
		ProductService service2 = new ProductServiceImpl();
		try {
			List<Category2> list = service.getAllCategorys();
			request.setAttribute("list", list);
			product =service2.getOne(cid);
			request.setAttribute("product", product);
			target = "/WEB-INF/jsp/admin/product/updateProduct.jsp";
			
		} catch (Exception e) {
			request.setAttribute("msg", "查询单个二级商品失败");
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
		}
		request.getRequestDispatcher(target).forward(request, response);
	}	
	private void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	
		String target = "";
		String pid = request.getParameter("pid");
		String pname = request.getParameter("pname");
		String price = request.getParameter("price");
		String productSum = request.getParameter("productSum");
		String dianpuName = request.getParameter("dianpuName");
		String pdesc = request.getParameter("pdesc");
		String cid = request.getParameter("cid");
		
		Product product = new Product();
		product.setPid(Integer.parseInt(pid));
		product.setPname(pname);
		product.setPrice(Double.parseDouble(price));
		product.setProductSum(Integer.parseInt(productSum));
		product.setDianpuName(dianpuName);
		product.setPdesc(pdesc);
		product.setCid(Integer.parseInt(cid));
	
		ProductService service = new ProductServiceImpl();
		
		try {
			//System.out.println(service.updateCategory(category));
			service.updateCategory(product);
			request.setAttribute("msg", "修改级商品种类成功!");
			this.getPageByQuery(request, response);
		} catch (Exception e) {
			request.setAttribute("msg", "修改er级商品种类失败");
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
			request.getRequestDispatcher(target).forward(request, response);
			
		}
		
	}	
	private void ProductUpDown(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String target = "";
		String pid = request.getParameter("pid");
		String onsale = request.getParameter("onsale");
		Product product = new Product();
		product.setPid(Integer.parseInt(pid));
		product.setOnsale(Integer.parseInt(onsale));
		ProductService service = new ProductServiceImpl();
		
		try {
			//System.out.println(service.updateCategory(category));
			service.ProductUpDown(product);
			if((int)Integer.parseInt(onsale) == 1){
				request.setAttribute("msg", "商品上架成功!");
			}else{
				request.setAttribute("msg", "商品下架成功!");
			}
			this.getPageByQuery(request, response);
		} catch (Exception e) {
			if((int)Integer.parseInt(onsale) == 1){
				request.setAttribute("msg", "商品上架失败!");
			}else{
				request.setAttribute("msg", "商品下架失败!");
			}
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
			request.getRequestDispatcher(target).forward(request, response);
			
		}
		
	}	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

}
