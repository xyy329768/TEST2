package com.service.inter;

import java.util.Date;
import java.util.List;

import com.vo.User;

public interface UserService {
	//用户登录
	public User login(String username,String password) throws Exception;
	
	//添加用户
	public int addUser(User user) throws Exception;
	
	//查询所有用户
	public List<User> getAllUsers() throws Exception;
	
	//修改用户状态
	public int updateUserState(String username,Integer loginCount,Integer lockState)throws Exception;
	//判断用户是否存在
	public User checkUser(String username) throws Exception;
	
	//获取用户第一次登录失败时的时间
	/*public String getFirstTime(String username)throws Exception;*/
	//修改用户登录时间
	public int updateLoginTime(String username)throws Exception;
	//获取用户第五次登录失败时的时间
	public String getLastTime(String username) throws Exception;
	
	//判断系统当前时间与给定时间时间差是否超过1分钟
	public boolean checkUnlockTime(String date) throws Exception;
	
	
	public List<User> getAllUsersName() throws Exception;
	
	public int updateIsactive(User user) throws Exception;
}
