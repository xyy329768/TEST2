package com.service.impl;

import java.util.List;

import com.dao.impl.User1DaoImpl;
import com.dao.inter.User1Dao;
import com.page.PageInfo;
import com.service.inter.User1Service;
import com.vo.Product;
import com.vo.User1;

public class User1ServiceImpl implements User1Service{

	private User1Dao dao;
	
	public User1ServiceImpl(){
		dao = new User1DaoImpl();
	}
	

	@Override
	public List<User1> getAllUsers() throws Exception {
		List<User1> list = null;
		String sql="select * from user1";
		list = dao.getPageByQuery(sql);
		return list;
	}
	
	
	//��ѯ���к��ҳ
		public List<User1> getAllByPage(PageInfo pageInfo) throws Exception{
			
			
			String sql = "select * from (select u.*,rownum r from user1 u) where r>=" + pageInfo.getBegin() + " and r<=" + pageInfo.getEnd();
			
			
			List<User1> list = null;
			
			list = dao.getPageByQuery(sql);
			return list;
		}
		
		
		
		//��ѯ�ܹ��ж�������¼
		public int getTotalRecordCount() throws Exception{
			int totalRecordCount = -1;
			
			String sql = "select count(*) from user1";
			totalRecordCount = dao.getTotalRecordCount(sql);
			return totalRecordCount;
		}
		  
		
		//����������ѯ �ܹ��ж�������¼
		@Override
		public int getTotalRecordCount(User1 user1) throws Exception{
			int totalRecordSum = 0;
			StringBuilder sb = new StringBuilder("select count(*) as totalRecordSum from user1 where 1=1");
			
			//select count(*) as totalRecordSum from user1 where 1=1 and username='�û���1' or phoneNumber = 'pg' or email='ec'
			String username = user1.getUserName();
			String phoneNumber = user1.getPhoneNumber();
			String email = user1.getEmail();
			
			if(username!=null&&!username.trim().equals("")){
				sb.append(" and username='");
				sb.append(username);
				sb.append("'");
			}
			
			if(phoneNumber!=null&&!phoneNumber.trim().equals("")){
				sb.append(" or phoneNumber ='");
				sb.append(phoneNumber);
				sb.append("'");
			}
			
			if(email!=null&&!email.trim().equals("")){
				sb.append(" or email ='");
				sb.append(email);
				sb.append("'");
			}
			
			
			String sql = sb.toString();

			totalRecordSum = dao.getTotalRecordCount(sql);

			return totalRecordSum;
		}
		
		// ����������ѯ Ȼ���ҳ
		@Override
		public List<User1> getPageByQuery(User1 user1,PageInfo pageInfo) throws Exception{
			List<User1> list = null;
			
			//String sql = "select * from (select u.*,rownum r from user1 u where 1=1 and username='�û���1' or phoneNumber = 'pg' or email='ec') where r>=1 and r<=5";
			
			StringBuilder sb = new StringBuilder("select * from (select u.*,rownum r from user1 u where 1=1");
			
			String username = user1.getUserName();
			String phoneNumber = user1.getPhoneNumber();
			String email = user1.getEmail();
			if(username!=null&&!username.trim().equals("")){
				sb.append(" and username='");
				sb.append(username);
				sb.append("'");
			}
			
			if(phoneNumber!=null&&!phoneNumber.trim().equals("")){
				sb.append(" or phoneNumber ='");
				sb.append(phoneNumber);
				sb.append("'");
			}
			
			if(email!=null&&!email.trim().equals("")){
				sb.append(" or email ='");
				sb.append(email);
				sb.append("'");
			}
			
			sb.append(") where r>=");
			sb.append(pageInfo.getBegin());
			sb.append(" and r<=");
			sb.append(pageInfo.getEnd());
			
			String sql = sb.toString();
			
			list = dao.getPageByQuery(sql);
			return list;
		}

		public static void main(String[] args) throws Exception {
			User1ServiceImpl service = new User1ServiceImpl();

			User1 user1 = new User1();
			
			
			
			PageInfo pageInfo = new PageInfo(1);
			
			List<User1> list = service.getPageByQuery(user1, pageInfo);
			
			for(User1 temp:list){
				System.out.println(temp);
			}
			
		}
		
		// ��1
		public User1 getUser1ById(String userId) throws Exception {

			User1 user1 = null;

			user1 = dao.getUser1ById(Integer.parseInt(userId));
			return user1;
		}
		// �޸�
		public int updateUser1(User1 user1) throws Exception {
			int count = dao.updateUser1(user1);
			return count;
		}
		
		// ɾ�������û�
		public int deleteUser1ById(String userId) throws Exception {

			User1 user1 = new User1();
			user1.setUserId(Integer.parseInt(userId));
			int count = dao.deleteUser1(user1);
			return count;
		}
		//�����û�
		@Override
		public int user1Active(User1 user1) throws Exception {
			
			int count = dao.updateUser1Active(user1);
			return count;
		}
}
