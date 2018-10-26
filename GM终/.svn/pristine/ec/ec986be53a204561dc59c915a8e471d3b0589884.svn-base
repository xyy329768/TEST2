package com.service.inter;

import java.util.List;

import com.page.PageInfo;
import com.vo.Category;
import com.vo.Odetail;
import com.vo.Order;
import com.vo.Product;
import com.vo.User;

public interface OrderService {
	//查询一共多少条记录
	public int getTotalRecordCount() throws Exception;
	public int getOdetailTotalRecordCount() throws Exception;
	public List<Order> getOrderByPage(PageInfo pageInfo) throws Exception;
	public List<Odetail> getOdetailByPage(PageInfo pageInfo) throws Exception;
	public int getTotalRecordCountByUserid(User user) throws Exception;
	//根据条件查询 总共有多少条记录
	public int getTotalRecordCount(Odetail odetail) throws Exception;
	public int getTotalRecordCount(Order order) throws Exception;
	public List<Order> getMyOrderByPage(User user,PageInfo pageInfo) throws Exception;
	//按条件查询后分页
	public List<Odetail> getOdetailByQuery(Odetail odetail,PageInfo pageInfo) throws Exception;
	public List<Order> getOrderByQuery(Order order,PageInfo pageInfo) throws Exception;
	
	//改变订单明细表的性质        商品删除后，订单如果有该商品的情况下，性质变为失效
	public int chaneOdetailQuality(String pid) throws Exception;
	
	//返回订单编号orderNo,订单编号有用户表的主键 + 随机数表示
	public String addOrder(Order order,List<Product> shoppingCart) throws Exception;

	//根据订单 得到详细订单
	public List<Odetail> getOdetailByOrder(String oid) throws Exception;

	// 删除详细订单
	public int deleteOdetailByOid(String oid) throws Exception;
	
	// 删除订单
	public int deleteOrderByOid(String oid) throws Exception;
	
	
	public int updateZTByOid(String oid) throws Exception;
	

}
