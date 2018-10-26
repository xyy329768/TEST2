package com.dao.inter;

import java.util.List;

import com.vo.Category;
import com.vo.Category2;

public interface Category2Dao {
	//1.添加
		public int addCategory(Category2 category) throws Exception;
	//删除
		public int deleteCategory(Category2 category) throws Exception;
	//
		public int getTotalRecordCount(String sql)throws Exception;
	////一级商品表、二级商品表组成一个联合表
		public List<Category2> getPageByQuery(String sql)throws Exception;
	//ID查
		public Category2 getCategoryById(int id)throws Exception;
	//修改
	public int updateCategory(Category2 category) throws Exception;
	//只查二级表所有商品
	public List<Category2> getPageByQueryOnly2(String sql) throws Exception;
	
}
