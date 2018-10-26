package com.service.inter;

import java.util.List;

import com.page.PageInfo;
import com.vo.Category;
import com.vo.Category2;

public interface Category2Service {
	//增加二级商品种类
	public int addCategory(Category2 category) throws Exception;
	//查所有
	public List<Category2> getAllCategorys() throws Exception;
	//查一级商品下二级种类的个数
	public int getTotalRecordCount(Category2 category) throws Exception;
	//查询一级商品下的全部二级商品种类
	public List<Category2> getAllCategory2ByCategory1(int cid) throws Exception;
	//查询二级商品总数
	public int getTotalRecordCount() throws Exception;
	//查所有+分页
	public List<Category2> getAllCategorysByPage(PageInfo pageInfo) throws Exception;
	//按条件查询后分页
	public List<Category2> getPageByQuery(Category2 category,PageInfo pageInfo) throws Exception;
	//根据条件查询 总共有多少条记录
	public int getAllTotalRecordCount(Category2 category) throws Exception;
	//按ID删除二级商品种类
	public int deleteCategoryByCid(String cid) throws Exception;
	//按ID查二级商品
	public Category2 getOne(String cid) throws Exception;
	//update
	public int updateCategory(Category2 category) throws Exception;
	
	
}
