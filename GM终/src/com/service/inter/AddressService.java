package com.service.inter;

import java.util.List;

import com.page.PageInfo;
import com.vo.Address;


public interface AddressService {

	//���
	public int addAddress(Address address) throws Exception;
	
	//��ѯ
	public List<Address> getAllAddress() throws Exception;
	public List<Address> getAddressByUserid(int userid) throws Exception;
	public Address getOneByOid(String aid) throws Exception;
	

	//ɾ��һ����Ʒ����
	public int  deleteAddressById(String aid) throws Exception;
	
	//��ѯ����һ����Ʒ����
	public Address getAddressById(String aid) throws Exception;
	
	//�޸ĵ���һ����Ʒ����
	public int updateAddress(Address address) throws Exception;
	
	/*//��ѯ���к��ҳ
	public List<Category> getAllByPage(PageInfo pageInfo) throws Exception;
	
	//��ѯ�ܹ��ж�������¼
	public int getTotalRecordCount() throws Exception;
	
	//����������ѯȻ�����
	public List<Category> getPageByQuery(Category category ,PageInfo pageInfo) throws Exception;
	
	//����������ѯ���ܹ��ж�������¼
	public int getTotalRecordCount(Category category) throws Exception;

*/
}
