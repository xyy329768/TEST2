package com.dao.inter;
import java.util.List;

import com.vo.Address;



public interface AddressDao {

	//添加
	public int addAddress(Address address) throws Exception;
	//根据sql语句查
	public List<Address> getPageByQuery(String sql) throws Exception;
	public List<Address> getAddressByUserid(int userid) throws Exception;
	public Address getOneByOid(int aid) throws Exception;
	//删除
	public int deleteAddress(Address address) throws Exception;

	//查询一条
	public Address getAddressById(int aid) throws Exception;
	
	//修改
	public int updateAddress(Address address)throws Exception;
	
	
	/*//根据sql 查询总共有多少条记录
	public int getTotalRecordCount(String sql) throws Exception;*/
	
	
}
