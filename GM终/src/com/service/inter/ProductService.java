package com.service.inter;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.page.PageInfo;
import com.vo.Category2;
import com.vo.Product;

public interface ProductService {
	//�����Ʒ
	public int addProduct(Product product) throws Exception;
	//��ѯ��Ʒ����
	public int getTotalRecordCount() throws Exception;
	//��������Ʒ+��ҳ
	public List<Product> getAllCategorysByPage(PageInfo pageInfo) throws Exception;
	//�������Ʒ�����µ�������Ʒ
	public int getTotalRecordCount(Product product) throws Exception;
	//����������ѯ �ܹ��ж�������¼
	public int getAllTotalRecordCount(Product product) throws Exception;
	//��������ѯ���ҳ
	public List<Product> getPageByQuery(Product product,PageInfo pageInfo) throws Exception;
	//��IDɾ����Ʒ
	public int deleteCategoryByCid(String cid) throws Exception;
	//��ID����Ʒ
	public Product getOne(String cid) throws Exception;
	
	//update
	public int updateCategory(Product product) throws Exception;
	//���¼���Ʒ
	public int ProductUpDown(Product product) throws Exception;
	//�ϴ���Ƭ
	public void upload(HttpServletRequest request, String productListUploadPath) throws Exception;

	
}
