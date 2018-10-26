package com.service.inter;

import java.util.List;

import com.page.PageInfo;
import com.vo.Product;
import com.vo.User1;

public interface User1Service {

	//������
	public List<User1> getAllUsers() throws Exception;
	//��ѯ���к��ҳ
	public List<User1> getAllByPage(PageInfo pageInfo) throws Exception;
	//��ѯ�ܹ��ж�������¼
	public int getTotalRecordCount() throws Exception;
	
	//����������ѯ Ȼ���ҳ
	public List<User1> getPageByQuery(User1 user1,PageInfo pageInfo) throws Exception;
	//����������ѯ �ܹ��ж�������¼
	public int getTotalRecordCount(User1 user1) throws Exception;
	//��1
	public User1 getUser1ById(String userId) throws Exception;
	//�޸�
	public int updateUser1(User1 user1) throws Exception;
	//ɾ�������û�
	public int deleteUser1ById(String userId) throws Exception;
	//�����û�
	public int user1Active(User1 user1) throws Exception;
}
