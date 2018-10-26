package com.service.inter;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.page.PageInfo;
import com.vo.Category2;
import com.vo.Product;

public interface ProductService {
	//添加商品
	public int addProduct(Product product) throws Exception;
	//查询商品总数
	public int getTotalRecordCount() throws Exception;
	//查所有商品+分页
	public List<Product> getAllCategorysByPage(PageInfo pageInfo) throws Exception;
	//查二级商品种类下的所有商品
	public int getTotalRecordCount(Product product) throws Exception;
	//根据条件查询 总共有多少条记录
	public int getAllTotalRecordCount(Product product) throws Exception;
	//按条件查询后分页
	public List<Product> getPageByQuery(Product product,PageInfo pageInfo) throws Exception;
	//按ID删除商品
	public int deleteCategoryByCid(String cid) throws Exception;
	//按ID查商品
	public Product getOne(String cid) throws Exception;
	
	//update
	public int updateCategory(Product product) throws Exception;
	//上下架商品
	public int ProductUpDown(Product product) throws Exception;
	//上传照片
	public void upload(HttpServletRequest request, String productListUploadPath) throws Exception;

	
}
