package com.dao.inter;

import java.util.List;

import com.vo.User;

public interface UserDao {
	//一.增加
	public int addUser(User user) throws Exception;
	//二.删除
	public int deleteUser(User user) throws Exception;
	//三.修改
	public int updateUser(User user) throws Exception;
	
	//四.查1
	public User getUserById(Integer userid) throws Exception;
	
	//五.按SQL语句查
	public List<User> getPageByQuery(String sql) throws Exception;
	
	//六.查询总共有多少条记录
	public int getTotalRecordSum(String sql) throws Exception;
	
	//根据username修改用户登录次数和账户状态
	public int updateUserState(String username,Integer loginCount,Integer lockState) throws Exception;
	
	//根据username查询账户状态
	public User getUserState(String username) throws Exception;
	
	//根据sql语句查询单个用户
	public User getUserByQuery(String sql) throws Exception;
	
	//根据sql语句修改单个用户
	public int updateUserByUsername(String username)throws Exception;
	
	public int updateIsactive(User user) throws Exception;
	public List<User> getNamesByQuery(String sql) throws Exception;
	
	
}
