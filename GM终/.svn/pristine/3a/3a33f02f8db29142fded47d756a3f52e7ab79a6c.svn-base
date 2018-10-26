package com.service.inter;

import java.util.List;

import com.page.PageInfo;
import com.vo.Address;


public interface AddressService {

	//添加
	public int addAddress(Address address) throws Exception;
	
	//查询
	public List<Address> getAllAddress() throws Exception;
	public List<Address> getAddressByUserid(int userid) throws Exception;
	public Address getOneByOid(String aid) throws Exception;
	

	//删除一级商品种类
	public int  deleteAddressById(String aid) throws Exception;
	
	//查询单个一级商品种类
	public Address getAddressById(String aid) throws Exception;
	
	//修改单个一级商品种类
	public int updateAddress(Address address) throws Exception;
	
	/*//查询所有后分页
	public List<Category> getAllByPage(PageInfo pageInfo) throws Exception;
	
	//查询总共有多少条记录
	public int getTotalRecordCount() throws Exception;
	
	//根据条件查询然后分类
	public List<Category> getPageByQuery(Category category ,PageInfo pageInfo) throws Exception;
	
	//根据条件查询后总共有多少条记录
	public int getTotalRecordCount(Category category) throws Exception;

*/
}
