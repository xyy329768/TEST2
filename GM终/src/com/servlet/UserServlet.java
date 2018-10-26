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
					System.out.println("�û����Ѵ���");
					PrintWriter out=response.getWriter();
					Gson gson=new Gson();
					String categoryListjson=gson.toJson("�û����Ѵ���");
					out.println(categoryListjson);
					out.flush();				
					out.close();
				}
			}
			  
		} catch (Exception e) {
			target = "/WEB-INF/msg.jsp";
			request.setAttribute("msg","��ѯʧ��");
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
			request.setAttribute("msg", "�޸�ʧ��");
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
			 request.setAttribute("msg", "�ʺŲ���Ϊ��");
			 target = "/WEB-INF/msg.jsp";
			 request.getRequestDispatcher(target).forward(request, response);
			 return;
		}
		if(password == null || password.trim().isEmpty()){
			request.setAttribute("msg", "���벻��Ϊ��");
			target = "/WEB-INF/msg.jsp";
			request.getRequestDispatcher(target).forward(request, response);
			return;
		}
		if(!password.equals(confirmPass)){
			request.setAttribute("msg", "������������벻ͬ");
			target = "/WEB-INF/msg.jsp";
			request.getRequestDispatcher(target).forward(request, response);
			return;
		}
		if(email == null || email.trim().isEmpty()){
			request.setAttribute("msg", "���䲻��Ϊ��");
			target = "/WEB-INF/msg.jsp";
			request.getRequestDispatcher(target).forward(request, response);
			return;
		}
		if(phoneNumber == null || phoneNumber.trim().isEmpty()){
			request.setAttribute("msg", "�ֻ��Ų���Ϊ��");
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
			request.setAttribute("msg","ע��ɹ�");
			session.setAttribute("user",user);
			target = "/WEB-INF/jsp/user/registerLogo.jsp";
			
		} catch (Exception e) {
			request.setAttribute("msg", "ע��ʧ��");
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
		
		//һ.�������
		String where = request.getParameter("where");
		System.out.println("where="+where);
		if(where==null){
			where="index.jsp";
		}
		String username = request.getParameter("loginName");
		String password = request.getParameter("password");
		
		
		//��.����ҵ���߼� 
		try {
			UserServiceImpl service1 = new UserServiceImpl();
			User user1 = service1.checkUser(username);
			System.out.println(user1);
			
			if(user1.getUsername()!=null){//�û�����ȷ���û�����
				Date date = user1.getLoginTime();
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String lastTime = sdf.format(date);
				System.out.println("lasttime="+lastTime);
				if(user1.getLockState()==1){//�˻�������
					System.out.println("�������˺�");
					
					if(service1.checkUnlockTime(lastTime)){//����˻�����ʱ�䳬��һ���ӣ��Զ�����
						System.out.println("�˻��Զ�����");
						UserServiceImpl service = new UserServiceImpl();
						User user = service.login(username, password);
						if(user!=null){//�����û����������ҵ��˸��û�
							
							Integer isActive = user.getIsActive();
							if(isActive==1){
								//��¼�ɹ� ����������ҳ firstPage
								
								//���û���¼ʱ���޸�Ϊϵͳ��ǰʱ��
								service.updateLoginTime(username);
								
								//��¼�ɹ�������¼����������Ϊ0
								service.updateUserState(username, 0, 0);
								
								//��ѯ��Ʒ���� ������ʾ��ҳ�Ĳ˵�
								CategoryService categoryService = new CategoryServiceImpl();
								List<Category> list = categoryService.getAllCategorys();
								
								
								request.setAttribute("list", list);
								HttpSession session = request.getSession(true);
								session.setAttribute("user", user); //��user����浽session�� �Ժ�ÿ��ҳ���ж�����ȡ����ʹ��
								if(where.equals("������Ϣ.jsp")){
									System.out.println("888");
								
									target="AddressServlet?action=runNext";
								
								}else{
									System.out.println("999");
									target = "/jsp/user/"+where;
								}
							
								
							}else{
								//��¼ʧ�� ���ص�¼ҳ�� ��ʾ "�û���δ����,�뼤����ٳ��Ե�¼"
								request.setAttribute("msg", "�û���δ����뼤����ٳ��Ե�¼");
								target = "/jsp/user/login.jsp";
							}
						}else if(username.equals(user1.getUsername()) && !password.equals(user1.getPassword())){//�û�����ȷ���������
							System.out.println("*****�˺Ż��������******");
								
								if(user1.getLoginCount() == 4){//�����¼����=4
									//���û���¼ʱ���޸�Ϊϵͳ��ǰʱ��
									service.updateLoginTime(username);
									service.updateUserState(username, user1.getLoginCount()+1, user1.getLockState()+1);
									//��¼ʧ�� ���ص�¼ҳ�� ��ʾ "�û������������"
									request.setAttribute("msg", "�û��������벻ƥ�䣬����������");
									target = "/jsp/user/login.jsp";
									
								}else if(user1.getLoginCount()<4){//�����¼����<4
									
										//���û���¼ʱ���޸�Ϊϵͳ��ǰʱ��
										service.updateLoginTime(username);
								
										service.updateUserState(username, user1.getLoginCount()+1, user1.getLockState());
										//��¼ʧ�� ���ص�¼ҳ�� ��ʾ "�û������������"
										request.setAttribute("msg", "�û��������벻ƥ�䣬����������");
										target = "/jsp/user/login.jsp";
										
								}else if(user1.getLoginCount()>4){
									//���û���¼ʱ���޸�Ϊϵͳ��ǰʱ��
									service.updateLoginTime(username);
									//���û���¼������������Ϊ1���˻�����
									service.updateUserState(username, 1, 0);
									request.setAttribute("msg", "�û��������벻ƥ�䣬����������");
									target = "/jsp/user/login.jsp";
								}
							
						}else{
							//��¼ʧ�� ���ص�¼ҳ�� ��ʾ "�û������������"
							request.setAttribute("msg", "�û��������벻ƥ�䣬����������");
							target = "/jsp/user/login.jsp";
						}
						
					}else{
						//��¼ʧ�� ���ص�¼ҳ�� ��ʾ "�˻���������״̬����ʱ�޷���¼"
						System.out.println("����״̬");
						request.setAttribute("msg", "�˻���������״̬����ʱ�޷���¼");
						target = "/jsp/user/login.jsp";
					}
				}else{//�˻�û�б�����
					
					UserServiceImpl service = new UserServiceImpl();
					User user = service.login(username, password);
					if(user!=null){//�����û����������ҵ��˸��û�
						
						Integer isActive = user.getIsActive();
						if(isActive==1){
							//System.out.println("***�������붼��ȷ��Ҳ����***");
							//��¼�ɹ� ����������ҳ firstPage
							
							//���û���¼ʱ���޸�Ϊϵͳ��ǰʱ��
							service.updateLoginTime(username);
							//System.out.println("*******����******");
							//��¼�ɹ�������¼����������Ϊ0
							service.updateUserState(username, 0, 0);
							
							//��ѯ��Ʒ���� ������ʾ��ҳ�Ĳ˵�
							CategoryService categoryService = new CategoryServiceImpl();
							List<Category> list = categoryService.getAllCategorys();
							
							
							request.setAttribute("list", list);
							HttpSession session = request.getSession(true);
							session.setAttribute("user", user); //��user����浽session�� �Ժ�ÿ��ҳ���ж�����ȡ����ʹ��
							//System.out.println("*****here*************");
							if(where.equals("������Ϣ.jsp")){
								System.out.println("888");
							
								target="AddressServlet?action=runNext";
							
							}else{
								System.out.println("999");
								target = "/jsp/user/"+where;
							}
							
						}else{
							//��¼ʧ�� ���ص�¼ҳ�� ��ʾ "�û���δ����,�뼤����ٳ��Ե�¼"
							request.setAttribute("msg", "�û���δ����뼤����ٳ��Ե�¼");
							target = "/jsp/user/login.jsp";
						}
					}else if(username.equals(user1.getUsername()) && !password.equals(user1.getPassword())){//�û�����ȷ���������
							
						
							if(user1.getLoginCount() == 4){//�����¼����=4
								//���û���¼ʱ���޸�Ϊϵͳ��ǰʱ��
								service.updateLoginTime(username);
								service1.updateUserState(username, user1.getLoginCount()+1, user1.getLockState()+1);
								//��¼ʧ�� ���ص�¼ҳ�� ��ʾ "�û������������"
								request.setAttribute("msg", "�û��������벻ƥ�䣬����������");
								target = "/jsp/user/login.jsp";
								
							}else if(user1.getLoginCount()<4){//�����¼����<4
								
									//���û���¼ʱ���޸�Ϊϵͳ��ǰʱ��
									service1.updateLoginTime(username);
							
									service1.updateUserState(username, user1.getLoginCount()+1, user1.getLockState());
									//��¼ʧ�� ���ص�¼ҳ�� ��ʾ "�û������������"
									request.setAttribute("msg", "�û��������벻ƥ�䣬����������");
									target = "/jsp/user/login.jsp";
									
							}
						
					}else{
						//��¼ʧ�� ���ص�¼ҳ�� ��ʾ "�û������������"
						request.setAttribute("msg", "�û��������벻ƥ�䣬����������");
						target = "/jsp/user/login.jsp";
					}
					
				}
			}else{
				//��¼ʧ�� ���ص�¼ҳ�� ��ʾ "�û������������"
				request.setAttribute("msg", "�û��������벻ƥ��");
				target = "/jsp/user/login.jsp";
			}
			
		} catch (Exception e) {
			target = "/WEB-INF/msg.jsp";
			request.setAttribute("msg","��¼ʧ�� ��ص���¼ҳ�����µ�¼");
			e.printStackTrace();
		}
		
		//��.ת����ͼ
		request.getRequestDispatcher(target).forward(request, response);
	}

	public void logout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String target = "";
		//һ.�������
		//��.����ҵ���߼�
		//�˳���¼ ע��session����
		HttpSession session = request.getSession(true);
		session.invalidate();
		//��.ת����ͼ
		target = "/jsp/user/login.jsp";
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
