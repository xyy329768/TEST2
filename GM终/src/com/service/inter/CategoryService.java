package com.service.inter;

import java.util.List;

import com.page.PageInfo;
import com.vo.Category;

public interface CategoryService {

	//添加
	public int addCategory(Category category) throws Exception;
	//查所有
	public List<Category> getAllCategorys() throws Exception;
	//删除单个商品
	public int deleteCategoryByCid(String cid) throws Exception;
	//查单个
	public Category getOne(String cid) throws Exception;
	//x修改
	public int updateCategory(Category category) throws Exception;
	//查所有 分页
	public List<Category> getAllCategorysByPage(PageInfo pageInfo) throws Exception;
	//查询一共多少条记录
	public int getTotalRecordCount() throws Exception;
	//按条件查询后分页
	public List<Category> getPageByQuery(Category category,PageInfo pageInfo) throws Exception;
	//根据条件查询 总共有多少条记录
	public int getTotalRecordCount(Category category) throws Exception;
}
