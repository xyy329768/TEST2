package com.dao.inter;
import java.util.List;

import com.vo.Address;



public interface AddressDao {

	//���
	public int addAddress(Address address) throws Exception;
	//����sql����
	public List<Address> getPageByQuery(String sql) throws Exception;
	public List<Address> getAddressByUserid(int userid) throws Exception;
	public Address getOneByOid(int aid) throws Exception;
	//ɾ��
	public int deleteAddress(Address address) throws Exception;

	//��ѯһ��
	public Address getAddressById(int aid) throws Exception;
	
	//�޸�
	public int updateAddress(Address address)throws Exception;
	
	
	/*//����sql ��ѯ�ܹ��ж�������¼
	public int getTotalRecordCount(String sql) throws Exception;*/
	
	
}
