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

		//�ַ�����   ���䴫�б��  �����ַ����жϵ���ʲô����
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

		//һ.�������
		//��.����ҵ���߼�
		//�ж��Ƿ��¼
	//���� ����ҳ
			
			//��ѯ���ﳵ��Ķ��� �ڽ���ҳ  ����ʾһ��  Ϊ��ȷ��
			List<Product> list = (List<Product>)service.getAttribute("shoppingCart");
			//��.ת����ͼ
			request.setAttribute("list", list);
			
			target = "/WEB-INF/jsp/user/������Ϣ.jsp";
		
		//��.ת����ͼ
		request.getRequestDispatcher(target).forward(request, response);
	}*/

	
	
	public void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	
		String target="";
		
		PrintWriter out = response.getWriter();
		
		//�������
		
		String aname=request.getParameter("aname");
		String aprovince=request.getParameter("aprovince");
		String acity=request.getParameter("acity");
		String adetailed=request.getParameter("adetailed");
		String aphone=request.getParameter("aphone");
	
		//System.out.println( "�ջ���"+ aname + "ʡ" + aprovince +"��"+ acity + "��ϸ��ַ"+adetailed +"�ֻ���"+ aphone );
		//����ҵ���߼�
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
			
			request.setAttribute("msg", "��ӵ�ַ�ɹ�");
		} catch (Exception e) {		
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
		}
		
		this.runNext(request, response);
	}

	
	/*public void checkOrder(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String target = "";
		System.out.println("��ת�ɹ� �õ�list list1");
		//һ.�������
		//��.����ҵ���߼�
		//�ж��Ƿ��¼
		HttpSession session = request.getSession(true);
		AddressService service=new AddressServiceImpl();
		User user = (User)session.getAttribute("user");
		if(user==null){
			//������½ҳ��
			target = "login.jsp";
			request.setAttribute("toWhere", "jiesuan");
		}else{

			//���� ����ҳ
			
			//��ѯ���ﳵ��Ķ��� �ڽ���ҳ  ����ʾһ��  Ϊ��ȷ��
			List<Product> list = (List<Product>)session.getAttribute("shoppingCart");
			try {
				List<Address> list1 =service.getAllAddress();
				//��.ת����ͼ
				request.setAttribute("list", list);
				request.setAttribute("list1", list1);
				System.out.println(list1);
				target = "/WEB-INF/jsp/user/������Ϣ.jsp";
			} catch (Exception e) {
				System.out.println("��ѯ���е�ַʧ�ܻ�ת����ͼʧ��");
				e.printStackTrace();
			}
			
		}
		//��.ת����ͼ
		request.getRequestDispatcher(target).forward(request, response);
	}*/
	
	
	public void runNext(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String target = "";
		
		//һ.�������
		//��.����ҵ���߼�
		
		HttpSession session = request.getSession(true);
		AddressService service=new AddressServiceImpl();
		
		User user = (User)session.getAttribute("user");

			//���� ����ҳ
			
			//��ѯ���ﳵ��Ķ��� �ڽ���ҳ  ����ʾһ��  Ϊ��ȷ��
			List<Product> list = (List<Product>)session.getAttribute("shoppingCart");
			try {
				List<Address> list1 =service.getAddressByUserid(user.getUserid());
				//��.ת����ͼ
				request.setAttribute("list", list);
				request.setAttribute("list1", list1);
				System.out.println(list1);
				target = "/WEB-INF/jsp/user/������Ϣ.jsp";
			} catch (Exception e) {
				System.out.println("��ѯ���е�ַʧ�ܻ�ת����ͼʧ��");
				e.printStackTrace();
			}
			
		
		//��.ת����ͼ
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
			request.setAttribute("msg", "ɾ����ַʧ��");
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
			request.setAttribute("msg", "��ѯ������Ʒʧ��");
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
			
		}
		request.getRequestDispatcher(target).forward(request, response);
	
	}
	
	
	public void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String target="";
		
		PrintWriter out = response.getWriter();
		
		//�������
		String changeaid = request.getParameter("changeaid");
		
		String aname=request.getParameter("aname");
		String aprovince=request.getParameter("aprovince");
		String acity=request.getParameter("acity");
		String adetailed=request.getParameter("adetailed");
		String aphone=request.getParameter("aphone");
	
		//System.out.println( "�ջ���"+ aname + "ʡ" + aprovince +"��"+ acity + "��ϸ��ַ"+adetailed +"�ֻ���"+ aphone );
		//����ҵ���߼�
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
			
			request.setAttribute("msg", "�޸ĵ�ַ�ɹ�");
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
