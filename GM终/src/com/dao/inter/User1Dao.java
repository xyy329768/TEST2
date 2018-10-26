package com.dao.inter;

import java.util.List;

import com.vo.Product;
import com.vo.User1;

public interface User1Dao {

	//1.��SQL����
	public List<User1> getPageByQuery(String sql) throws Exception;
	//2.����sql��ѯ �ܹ��ж�������¼
    public int getTotalRecordCount(String sql) throws Exception;
    //3.��1
  	public User1 getUser1ById(int userId) throws Exception;
  	//4.�޸�
  	public int updateUser1(User1 user1) throws Exception;
  	//5.ɾ��
  	public int deleteUser1(User1 user1) throws Exception;
    //�޸��û�isActive
  	public int updateUser1Active(User1 user1) throws Exception;
}
