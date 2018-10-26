package com.service.inter;

import java.util.List;

import com.page.OrderCondition;
import com.page.PageInfo;
import com.vo.Product;

public interface UserProductService {
	//查商品总数  by category2的id
	public int getTotalRecordCount(Product product) throws Exception;
	//查所有商品+分页
	public List<Product> getAllCategorysByPage(PageInfo pageInfo,Product product,OrderCondition orderConditionObj) throws Exception;
	//查一
	public Product getProductById(String pid) throws Exception;
	public int getTotalRecordCount2(Product product) throws Exception;
	public List<Product> getPageByQuery(Product product,PageInfo pageInfo) throws Exception;
}
