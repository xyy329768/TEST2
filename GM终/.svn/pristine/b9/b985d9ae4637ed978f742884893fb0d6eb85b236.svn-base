package com.dao.inter;

import java.util.List;

import com.vo.Product;

public interface UserProductDao {
	public int getTotalRecordSum(String sql) throws Exception;
	//查询指定二级商品种类下的 商品所有信息
	public List<Product> getAllProductForCategory2(String sql) throws Exception;
	//查一
	public Product getProductById(Integer pid) throws Exception;
	//根据sql查询商品
	public List<Product> getPageByQuery(String sql) throws Exception;
}
