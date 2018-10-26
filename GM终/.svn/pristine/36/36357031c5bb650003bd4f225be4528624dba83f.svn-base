package com.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.dao.impl.UserDaoImpl;
import com.service.inter.UserService;
import com.vo.User;

public class UserServiceImpl implements UserService{
	private UserDaoImpl dao = new UserDaoImpl();
	
	public User login(String username, String password) throws Exception{
		UserDaoImpl dao = new UserDaoImpl();
		User user = null;
		
		String sql = "select * from user1 where username='" + username+ "' and password='" + password + "'";
		List<User> list = dao.getPageByQuery(sql);
		if(list.size()>0){
			//”√ªß¥Ê‘⁄
			user = list.get(0);
			
		}
		
		return user;
	}

	@Override
	public int addUser(User user) throws Exception {
		UserDaoImpl dao = new UserDaoImpl();
		int count = dao.addUser(user);
		return count;
	}
	@Override
	public int updateUserState(String username,Integer loginCount,Integer lockState) throws Exception {
		UserDaoImpl dao = new UserDaoImpl();
		int count = dao.updateUserState(username,loginCount,lockState);
		
		return count;
	}
	
	@Override
	public List<User> getAllUsers() throws Exception {
		UserDaoImpl dao = new UserDaoImpl();
		List<User> list = null;
		String sql="select * from user1";
		list = dao.getPageByQuery(sql);
		return list;
	}

	@Override
	public User checkUser(String username) throws Exception {
		UserDaoImpl dao = new UserDaoImpl();
		User user = null;
		user = dao.getUserState(username);
		return user;
	}

	/*@Override
	public String getFirstTime(String username) throws Exception {
		UserDaoImpl dao = new UserDaoImpl();
		
		User user = null;
		String sql = "select * from user1 where username='"+username+"' and loginCount=1";
		user = dao.getUserByQuery(sql);
		
		String date = user.getLoginTime();
		
	}*/
	
	@Override
	public String getLastTime(String username) throws Exception {
		UserDaoImpl dao = new UserDaoImpl();
		
		User user = null;
		String sql = "select * from user1 where username='"+username+"' and loginCount=1";
		user = dao.getUserByQuery(sql);
		
		Date date = user.getLoginTime();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = sdf.format(date);
		
		return time;
	}

	@Override
	public int updateLoginTime(String username) throws Exception {
		UserDaoImpl dao = new UserDaoImpl();
		int count = 0;
		count = dao.updateUserByUsername(username);
		
		return count;
		
	}

	@Override
	public boolean checkUnlockTime(String date) throws Exception {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date1=sdf.parse(date);
        Date now=sdf.parse(sdf.format(new Date()));
      /*System.out.println(now);
        System.out.println(date1);
        System.out.println("now="+now.getTime());
        System.out.println("date1="+date1.getTime());*/
		if(now.getTime()-date1.getTime()>60*1000){
			return true;
		}else{
			return false;
		}
	}
	
	@Override
	public List<User> getAllUsersName() throws Exception {
		List<User> list = null;
		String sql = "select username from user1";
		list = dao.getNamesByQuery(sql);
		return list;
	}

	@Override
	public int updateIsactive(User user) throws Exception {
		int count = dao.updateIsactive(user);
		return count;
	}

	
}
