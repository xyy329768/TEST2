package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.page.PageInfo;
import com.service.impl.Category2ServiceImpl;
import com.service.impl.CategoryServiceImpl;
import com.service.inter.Category2Service;
import com.service.inter.CategoryService;
import com.vo.Category;
import com.vo.Category2;

public class CategoryServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//分发请求
		String action = request.getParameter("action");
		
		if("add".equals(action)){
			this.add(request, response);
		}else if("getAll".equals(action)){
			
			this.getAll(request,response);
		}else if ("delete".equals(action)){
			this.delete(request, response);
		}else if("getOne".equals(action)){
			this.getOne(request,response);
		}else if("update".equals(action)){
			this.upDate(request,response);
		}else if ("getAllByPage".equals(action)){
			this.getAllByPage(request,response);
		}else if("getPageByQuery".equals(action)){
			this.getPageByQuery(request,response);
		}
	}
	
	private void upDate(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String target = "";
		String cid = request.getParameter("cid");
		
		String cname = request.getParameter("cname");
		String cdesc = request.getParameter("cdesc");
		Category category = new Category();
		category.setCid(Integer.parseInt(cid));
		category.setCname(cname);
		category.setCdesc(cdesc);
		CategoryService service = new CategoryServiceImpl();
		
		try {
			//System.out.println(service.updateCategory(category));
			service.updateCategory(category);
			request.setAttribute("msg", "修改一级商品种类成功!");
			this.getPageByQuery(request, response);
		} catch (Exception e) {
			request.setAttribute("msg", "修改单个商品失败");
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
			request.getRequestDispatcher(target).forward(request, response);
			
		}
		
		
		
	}

	private void getOne(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String target = "";
		String cid = request.getParameter("cid");
		CategoryService service = new CategoryServiceImpl();
		try {
			Category category =service.getOne(cid);
			request.setAttribute("category", category);
			target = "/WEB-INF/jsp/admin/category/updateCategory.jsp";
		} catch (Exception e) {
			request.setAttribute("msg", "查询单个商品失败");
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
			
		}
		request.getRequestDispatcher(target).forward(request, response);
		
		
	}

	
	private void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String target = "";
		String cid = request.getParameter("cid");
		
		Category2 category2 = new Category2();
		category2.setFid(Integer.parseInt(cid));
		Category2Service service2 = new Category2ServiceImpl();
		CategoryService service = new CategoryServiceImpl();
		try {
			int count = service2.getTotalRecordCount(category2);
			if(count>0){
				request.setAttribute("msg", "删除失败");
				request.setAttribute("msgDetail", "已找到子种类，请先删除子种类，在进行删除操作");
			}else{
				service.deleteCategoryByCid(cid);
				request.setAttribute("msg", "删除成功");
			}
			this.getPageByQuery(request, response);
		} catch (Exception e) {
			request.setAttribute("msg", "删除单个商品失败");
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
			request.getRequestDispatcher(target).forward(request, response);
		}
		
		
		
	}

	public void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String target = "";
		//一.填充数据
		String cname = request.getParameter("cname");
		String cdesc = request.getParameter("cdesc");
		
		//二.调用业务逻辑
		Category category = new Category();
		category.setCname(cname);
		category.setCdesc(cdesc);
		
		CategoryService service = new CategoryServiceImpl();
		try {
			service.addCategory(category);
			request.setAttribute("msg", "添加一级商品种类成功");
		} catch (Exception e) {
			request.setAttribute("msg", "添加一级商品种类失败");
			e.printStackTrace();
		}
		//三.转发视图
		target = "/WEB-INF/msg.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(target);
		
		rd.forward(request, response);
	}
	
	public void getAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		String target = "";
		//1.填充数据
		//2.调用业务逻辑
		CategoryService service = new CategoryServiceImpl();
		
		try {
			List<Category> list = service.getAllCategorys();
			
			request.setAttribute("list", list);
			
			target = "/WEB-INF/jsp/admin/category/categoryMain.jsp";
		} catch (Exception e) {
			request.setAttribute("msg", "查询一级商品种类失败!");
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
		}
		//3.转发视图
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	
	public void getAllByPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String target = "";
		String requestPage = request.getParameter("requestPage");
		
		
		
		try {
			//查询多少条记录
			CategoryService service1 = new CategoryServiceImpl();
			
			int totalRecordCount = service1.getTotalRecordCount();
			
			PageInfo pageInfo = new PageInfo(Integer.parseInt(requestPage));
			pageInfo.setTotalRecordCount(totalRecordCount);
			
		
			CategoryService service = new CategoryServiceImpl();
			List<Category> list =service.getAllCategorysByPage(pageInfo);
			request.setAttribute("list", list);
			request.setAttribute("pageInfo", pageInfo);
			target = "/WEB-INF/jsp/admin/category/categoryMain.jsp";
		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
		}
		request.getRequestDispatcher(target).forward(request, response);
		
	}
	public void getPageByQuery(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String target = "";
		String searchCondition = request.getParameter("searchCondition");
		String requestPage = request.getParameter("requestPage");
		if(requestPage==null){
			requestPage ="1";
		}
		Category category = new Category();
		
		if(searchCondition!=null&&!searchCondition.equals("")){
			category.setCname(searchCondition);
			category.setCdesc(searchCondition);
		
		}
		try {
			//查询多少条记录
			CategoryService service1 = new CategoryServiceImpl();
			
			int totalRecordCount = service1.getTotalRecordCount(category);
			
			PageInfo pageInfo = new PageInfo(Integer.parseInt(requestPage));
			pageInfo.setTotalRecordCount(totalRecordCount);
			
		
			CategoryService service = new CategoryServiceImpl();
			List<Category> list =service.getPageByQuery(category,pageInfo);
			
			request.setAttribute("list", list);
			request.setAttribute("searchCondition", searchCondition);
			request.setAttribute("pageInfo", pageInfo);
			target = "/WEB-INF/jsp/admin/category/categoryMain.jsp";
		} catch (Exception e) {
			request.setAttribute("msg", "按条件查询失败");
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
		}
		request.getRequestDispatcher(target).forward(request, response);
		
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
