package com.dao.inter;

import java.util.List;

import com.page.PageInfo;
import com.vo.Category;
import com.vo.Odetail;
import com.vo.Order;

public interface OrderDao {
	public int getTotalRecordSum(String sql) throws Exception;//查订单和订单明细表  订单总数
	
	public List<Odetail> getOdetailByQuery(String sql) throws Exception;//查订单明细表+分页
	public List<Order> getOrderByQuery(String sql) throws Exception;//查订单表+分页
	
	
	public int updateOdetail(Odetail odetail) throws Exception; //修改odetail表的quality

	public int addOdetail(Odetail odetail) throws Exception;

	public int addOrder(Order order) throws Exception;
public List<Odetail> getPageByQueryOdetail(String sql) throws Exception;
	
	public int deleteOdetail(Odetail odetail) throws Exception;
	
	public int deleteOrder(Order order) throws Exception;
	public int updateZTByOid(String oid) throws  Exception;
	
	
}
