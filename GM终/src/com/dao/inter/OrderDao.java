package com.dao.inter;

import java.util.List;

import com.page.PageInfo;
import com.vo.Category;
import com.vo.Odetail;
import com.vo.Order;

public interface OrderDao {
	public int getTotalRecordSum(String sql) throws Exception;//�鶩���Ͷ�����ϸ��  ��������
	
	public List<Odetail> getOdetailByQuery(String sql) throws Exception;//�鶩����ϸ��+��ҳ
	public List<Order> getOrderByQuery(String sql) throws Exception;//�鶩����+��ҳ
	
	
	public int updateOdetail(Odetail odetail) throws Exception; //�޸�odetail���quality

	public int addOdetail(Odetail odetail) throws Exception;

	public int addOrder(Order order) throws Exception;
public List<Odetail> getPageByQueryOdetail(String sql) throws Exception;
	
	public int deleteOdetail(Odetail odetail) throws Exception;
	
	public int deleteOrder(Order order) throws Exception;
	public int updateZTByOid(String oid) throws  Exception;
	
	
}
