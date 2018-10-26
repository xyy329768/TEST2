package com.service.inter;

import java.util.List;

import com.page.PageInfo;
import com.vo.Product;
import com.vo.User1;

public interface User1Service {

	//查所有
	public List<User1> getAllUsers() throws Exception;
	//查询所有后分页
	public List<User1> getAllByPage(PageInfo pageInfo) throws Exception;
	//查询总共有多少条记录
	public int getTotalRecordCount() throws Exception;
	
	//根据条件查询 然后分页
	public List<User1> getPageByQuery(User1 user1,PageInfo pageInfo) throws Exception;
	//根据条件查询 总共有多少条记录
	public int getTotalRecordCount(User1 user1) throws Exception;
	//查1
	public User1 getUser1ById(String userId) throws Exception;
	//修改
	public int updateUser1(User1 user1) throws Exception;
	//删除单个用户
	public int deleteUser1ById(String userId) throws Exception;
	//激活用户
	public int user1Active(User1 user1) throws Exception;
}
