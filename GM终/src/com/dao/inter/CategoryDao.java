package com.dao.inter;

import java.util.List;

import com.vo.Category;

public interface CategoryDao {

	//1.���
	public int addCategory(Category category) throws Exception;
	//2.ɾ��
	public int deleteCategory(Category category) throws Exception;
	//3.�޸�
	public int updateCategory(Category category) throws Exception;
	//4.��1
	public Category getCategoryById(int id) throws Exception;
	//5.��SQL����
	public List<Category> getPageByQuery(String sql) throws Exception;
	public int getTotalRecordCount(String sql) throws Exception;
}
