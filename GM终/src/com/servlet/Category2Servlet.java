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
import com.service.impl.ProductServiceImpl;
import com.service.inter.Category2Service;
import com.service.inter.CategoryService;
import com.service.inter.ProductService;
import com.vo.Category;
import com.vo.Category2;
import com.vo.Product;

public class Category2Servlet extends HttpServlet {
	
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			String action = request.getParameter("action");
				
			if("getAllCategoryForAddCategory2".equals(action)){
				this.getAllCategoryForAddCategory2(request, response);
			}else if("add".equals(action)){
				this.add(request, response);
			}else if("getMenuForFirstPage".equals(action)){
				this.getMenuForFirstPage(request, response);
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
			}
	}
	
	public void getAllCategoryForAddCategory2(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String target = "";
		//1.�������
		//2.����ҵ���߼�
		CategoryService service = new CategoryServiceImpl();
		
		
		try {
			List<Category> list = service.getAllCategorys();
			
			request.setAttribute("list", list);
			
			target = "/WEB-INF/jsp/admin/category2/addCategory2.jsp";
		} catch (Exception e) {
			request.setAttribute("msg", "��ѯһ����Ʒ����ʧ��!");
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
		}
		//3.ת����ͼ
		request.getRequestDispatcher(target).forward(request, response);
	}

	public void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String target = "";
		//һ.�������
		String cname = request.getParameter("cname");
		String cdesc = request.getParameter("cdesc");
		String fid = request.getParameter("fid");
	
		//��.����ҵ���߼�
		Category2 category = new Category2();
		category.setCname(cname);
		category.setCdesc(cdesc);
		category.setFid(Integer.parseInt(fid));
		
		Category2Service service = new Category2ServiceImpl();
		try {
			service.addCategory(category);
			request.setAttribute("msg", "��Ӷ�����Ʒ����ɹ�");
		} catch (Exception e) {
			request.setAttribute("msg", "��Ӷ�����Ʒ����ʧ��");
			e.printStackTrace();
		}
		//��.ת����ͼ
		target = "/WEB-INF/msg.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(target);
		
		rd.forward(request, response);
		
	}
	public void getMenuForFirstPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String target = "";
		//1.�������
		//2.����ҵ���߼�
		CategoryService service = new CategoryServiceImpl();
		
		try {
			List<Category> list = service.getAllCategorys();
			
			request.setAttribute("list", list);
			
			target = "/WEB-INF/jsp/user/welcome.jsp";
		} catch (Exception e) {
			request.setAttribute("msg", "��ѯһ����Ʒ����ʧ��!");
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
		}
		//3.ת����ͼ
		request.getRequestDispatcher(target).forward(request, response);
		
	}
	public void getAllByPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String target = "";
		String requestPage = request.getParameter("requestPage");
		
		
		
		try {
			//��ѯ��������¼
			Category2Service service1 = new Category2ServiceImpl();
			
			int totalRecordCount = service1.getTotalRecordCount();
			
			PageInfo pageInfo = new PageInfo(Integer.parseInt(requestPage));
			pageInfo.setTotalRecordCount(totalRecordCount);
			
		
			Category2Service service = new Category2ServiceImpl();
			List<Category2> list =service.getAllCategorysByPage(pageInfo);
			request.setAttribute("list", list);
			request.setAttribute("pageInfo", pageInfo);
			target = "/WEB-INF/jsp/admin/category2/category2Main.jsp";
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
		Category2 category = new Category2();
		Category category1 = new Category();
		
		if(searchCondition!=null&&!searchCondition.equals("")){
			category1.setCname(searchCondition);
			category.setCname(searchCondition);
			category.setCdesc(searchCondition);
			category.setCategory(category1);
		}else{
			category1.setCname("");
			category.setCname("");
			category.setCdesc("");
			category.setCategory(category1);
		}
		try {
			//��ѯ��������¼
			Category2Service service1 = new Category2ServiceImpl();
			
			int totalRecordCount = service1.getAllTotalRecordCount(category);
			PageInfo pageInfo = new PageInfo(Integer.parseInt(requestPage));
			pageInfo.setTotalRecordCount(totalRecordCount);
			
		
			Category2Service service = new Category2ServiceImpl();
			List<Category2> list =service.getPageByQuery(category,pageInfo);
			
			request.setAttribute("list", list);
			request.setAttribute("searchCondition", searchCondition);
			request.setAttribute("pageInfo", pageInfo);
			target = "/WEB-INF/jsp/admin/category2/category2Main.jsp";
		} catch (Exception e) {
			request.setAttribute("msg", "��������ѯʧ��");
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
		Category2Service service2 = new Category2ServiceImpl();
		Product product = new Product();
		product.setCid(Integer.parseInt(cid));
		ProductService service = new ProductServiceImpl();
		try {
			int count = service.getTotalRecordCount(product);
			if(count>0){
				request.setAttribute("msg", "ɾ��ʧ��");
				request.setAttribute("msgDetail", "���ҵ������࣬����ɾ�������࣬�ڽ���ɾ������");
			}else{
				service2.deleteCategoryByCid(cid);
				request.setAttribute("msg", "ɾ���ɹ�");
			}
			
			this.getPageByQuery(request, response);
		} catch (Exception e) {
			request.setAttribute("msg", "ɾ��������Ʒʧ��");
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
		Category2 category2 = new Category2();
		category2.setFid(Integer.parseInt(cid));
		Category2Service service2 = new Category2ServiceImpl();
		try {
			List<Category> list = service.getAllCategorys();
			request.setAttribute("list", list);
			category2 =service2.getOne(cid);
			request.setAttribute("category", category2);
			target = "/WEB-INF/jsp/admin/category2/updateCategory2.jsp";
			
		} catch (Exception e) {
			request.setAttribute("msg", "��ѯ����������Ʒʧ��");
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
		}
		request.getRequestDispatcher(target).forward(request, response);
	}	
	private void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		String target = "";
		String cid = request.getParameter("cid");
		String fid = request.getParameter("fid");
		String cname = request.getParameter("cname");
		String cdesc = request.getParameter("cdesc");
		Category category1 = (Category)request.getAttribute("category1");
		Category2 category = new Category2();
		category.setCid(Integer.parseInt(cid));
		category.setCname(cname);
		category.setCdesc(cdesc);
		category.setFid(Integer.parseInt(fid));
		category.setCategory(category1);
		System.out.println("category="+category);
		Category2Service service = new Category2ServiceImpl();
		
		try {
			//System.out.println(service.updateCategory(category));
			service.updateCategory(category);
			request.setAttribute("msg", "�޸ļ���Ʒ����ɹ�!");
			this.getPageByQuery(request, response);
		} catch (Exception e) {
			request.setAttribute("msg", "�޸�er����Ʒ����ʧ��");
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
