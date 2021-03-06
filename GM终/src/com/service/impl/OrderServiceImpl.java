package com.service.impl;

import java.util.Date;
import java.util.List;

import com.dao.impl.CategoryDaoImpl;
import com.dao.impl.OrderDaoImpl;
import com.dao.impl.ProductDaoImpl;
import com.dao.inter.CategoryDao;
import com.dao.inter.OrderDao;
import com.dao.inter.ProductDao;
import com.page.PageInfo;
import com.service.inter.OrderService;
import com.util.ConnOracleDataSourceTransaction;
import com.vo.Category;
import com.vo.Odetail;
import com.vo.Order;
import com.vo.Product;
import com.vo.User;

public class OrderServiceImpl implements OrderService{
	private OrderDao dao;
	
	public OrderServiceImpl(){
		dao = new OrderDaoImpl();
	}
	@Override
	public int getTotalRecordCount() throws Exception {
		int totalRecordCount = -1;
		
		String sql = "select count(*) from order1";
		totalRecordCount = dao.getTotalRecordSum(sql);
		return totalRecordCount;
	}
	@Override
	public List<Order> getOrderByPage(PageInfo pageInfo) throws Exception {
		List<Order> list = null;
		
		String sql = "select * FROM (select c.*,rownum r from order1 c) WHERE r>="+pageInfo.getBegin()+ "and r<="+pageInfo.getEnd();
		list = dao.getOrderByQuery(sql);
		return list;
	}
	@Override
	public int getOdetailTotalRecordCount() throws Exception {
		int totalRecordCount = -1;
		
		String sql = "select count(*) from odetail";
		totalRecordCount = dao.getTotalRecordSum(sql);
		return totalRecordCount;
	}
	@Override
	public List<Odetail> getOdetailByPage(PageInfo pageInfo) throws Exception {
		List<Odetail> list = null;
		
		String sql = "select * FROM (select c.*,rownum r from odetail c) WHERE r>="+pageInfo.getBegin()+ "and r<="+pageInfo.getEnd();
		list = dao.getOdetailByQuery(sql);
		return list;
	}
	public int getTotalRecordCount(Order order) throws Exception {
		int totalRecordCount = -1;
		
		StringBuffer sb = new StringBuffer("select count(*) from order1 where 1=1");
		String oid=order.getOid();
		String status = Integer.toString(order.getStatus());
		Date odate = order.getOdate();
		String aname = order.getAname();

		if (!status.equals("0") ) {

			sb.append(" and status='");
			sb.append(status);
			sb.append("' and (");
		}else{
			sb.append(" and (");
		}


		if (odate != null ) {
			sb.append(" odate like '%");
			sb.append(odate);
			sb.append("%' or");
		}
		
		if(aname!= null && !aname.trim().equals("")){
			sb.append(" aname='");
			sb.append(aname);
			sb.append("' ");
			
		}else{
			sb.append("  1=1)");
		}
		if(oid!= null && !oid.trim().equals("")){
			sb.append(" or oid='");
			sb.append(oid);
			sb.append("')");
		}
		String sql = sb.toString();
		System.out.println(sql);
		totalRecordCount = dao.getTotalRecordSum(sql);
		return totalRecordCount;
	}
	public List<Order> getOrderByQuery(Order order,PageInfo pageInfo) throws Exception {
		List<Order> list = null;
		
		StringBuffer sb = new StringBuffer(
				"select * from (select c.*,rownum r from order1 c where 1=1");

		String status = Integer.toString(order.getStatus());
		System.out.println("status="+status);
		Date odate = order.getOdate();
		String aname = order.getAname();
		String oid=order.getOid();

		if (!status.equals("0") ) {

			sb.append(" and status='");
			sb.append(status);
			sb.append("' and (");
		}else{
			sb.append("and (");
		}

		if (odate != null ) {
			sb.append(" odate like '%");
			sb.append(odate);
			sb.append("%' or");
		}
		
		if(aname!= null && !aname.trim().equals("")){
			sb.append(" aname='");
			sb.append(aname);
			sb.append("' ");
			
		}else{
			sb.append("  1=1)");
		}
		if(oid!= null && !oid.trim().equals("")){
			sb.append("or oid='");
			sb.append(oid);
			sb.append("')");
		}
		sb.append(") where r>=");
		sb.append(pageInfo.getBegin());
		sb.append(" and r<=");
		sb.append(pageInfo.getEnd());
		String sql = sb.toString();
		System.out.println(sql);
		list = dao.getOrderByQuery(sql);
		return list;
		
	}
	public int getTotalRecordCount(Odetail odetail) throws Exception {
		int totalRecordCount = -1;
		
		StringBuffer sb = new StringBuffer("select count(*) from odetail where 1=1");
		
		String quality = Integer.toString(odetail.getQuality());
		String pname = odetail.getPname();
		String  oid = odetail.getOid();

		if (!quality.equals("1")) {

			sb.append(" and quality='");
			sb.append(quality);
			sb.append("' and (");
		}else{
			
			sb.append("and (");
		}
		if (pname != null && !pname.trim().equals("")) {
			sb.append(" pname like '%");
			sb.append(pname);
			sb.append("%' ");
		}else{
			sb.append("1=1");
		}
		
		if(oid!= null && !oid.trim().equals("")){
			sb.append(" or oid='");
			sb.append(oid);
			sb.append("')");
			
		}else{
			sb.append(" and 1=1)");
		}
	
		
		String sql = sb.toString();
		System.out.println("sql="+sql);
		totalRecordCount = dao.getTotalRecordSum(sql);
		return totalRecordCount;
	}
	public List<Odetail> getOdetailByQuery(Odetail odetail,PageInfo pageInfo) throws Exception {
		List<Odetail> list = null;
		
		StringBuffer sb = new StringBuffer(
				"select * from (select c.*,rownum r from odetail c where 1=1");

		String quality = Integer.toString(odetail.getQuality());
		String pname = odetail.getPname();
		String  oid = odetail.getOid();

		if (!quality.equals("1")) {

			sb.append(" and quality='");
			sb.append(quality);
			sb.append("' and (");
		}else{
			
			sb.append("and (");
		}

		if (pname != null && !pname.trim().equals("")) {
			sb.append(" pname like '%");
			sb.append(pname);
			sb.append("%' ");
		}else{
			sb.append("1=1)");
		}
		
		if(oid!= null && !oid.trim().equals("")){
			sb.append(" or oid='");
			sb.append(oid);
			sb.append("')");
			
		}else{
			sb.append(" and 1=1");
		}
		sb.append(") where r>=");
		sb.append(pageInfo.getBegin());
		sb.append(" and r<=");
		sb.append(pageInfo.getEnd());
		String sql = sb.toString();
		System.out.println(sql);
		list = dao.getOdetailByQuery(sql);
		return list;
		
	}
	@Override
	public int chaneOdetailQuality(String pid) throws Exception {
		//先查询该商品（product表已删除）是否存在odetail表中
		int count = 0;
		List<Odetail> list = null;
		String sql = "select * from odetail where pid="+pid;
		list= dao.getOdetailByQuery(sql);
		if(list!=null){
			for(Odetail odetail:list){
			   OrderDao	 dao = new OrderDaoImpl();
			  
			   count =dao.updateOdetail(odetail);
			}
		}
		return count;
	}

	private OrderDao orderDao = new OrderDaoImpl();
	@Override
	public String addOrder(Order order, List<Product> shoppingCart)
			throws Exception {
		String oid= order.getOid();
		// 开启事务
		ConnOracleDataSourceTransaction.beginTransaction();
		
		try {
			 orderDao.addOrder(order);
		} catch (Exception e) {
			ConnOracleDataSourceTransaction.rollbackTransaction();
			e.printStackTrace();
			throw new Exception("下单失败");
		}

		for (Product product : shoppingCart) {

			int shoppingCarSum = product.getShoppingCarSum();
			// 添加订单明细
			Odetail odetail = new Odetail();
			odetail.setOid(oid);
			odetail.setPid(product.getPid());
			odetail.setPname(product.getPname());
			odetail.setPsum(product.getShoppingCarSum());
			odetail.setQuality(1);
			odetail.setBeizhu(product.getBeizhu());

			
			try {
				orderDao.addOdetail(odetail);
			} catch (Exception e) {
				ConnOracleDataSourceTransaction.rollbackTransaction();
				e.printStackTrace();
				break;
			}

			// 修改商品库存数量
			ProductDao productDao = new ProductDaoImpl();

			int productSum = product.getProductSum();

			if (shoppingCarSum <= productSum) {
				productSum = productSum - shoppingCarSum;
				product.setProductSum(productSum);
				try {
					productDao.updateProduct(product);
				} catch (Exception e) {
					ConnOracleDataSourceTransaction.rollbackTransaction();
					e.printStackTrace();
				}
			} else {
				ConnOracleDataSourceTransaction.rollbackTransaction();
				throw new Exception(product.getPname() + "库存不足,请暂时选择其他商品,谢谢!");

			}

			ConnOracleDataSourceTransaction.commitTransaction();
		}

		return oid;
	}
	// 删除详细订单
	public int deleteOdetailByOid(String oid) throws Exception {

		Odetail odetail = new Odetail();
		odetail.setOid(oid);
		int count = dao.deleteOdetail(odetail);
		return count;
	}
	@Override
	public List<Order> getMyOrderByPage(User user,PageInfo pageInfo) throws Exception {
		List<Order> list = null;
		
		String sql = "select * FROM (select c.*,rownum r from order1 c where userid="+user.getUserid() +") WHERE r>="+pageInfo.getBegin()+ "and r<="+pageInfo.getEnd();
		list = dao.getOrderByQuery(sql);
		return list;
	}
	// 删除订单
	public int deleteOrderByOid(String oid) throws Exception {

		Order order = new Order();
		order.setOid(oid);
		int count = dao.deleteOrder(order);
		return count;
	}
	@Override
	public int getTotalRecordCountByUserid(User user) throws Exception {
		int totalRecordCount = -1;
		String sql = "select count(*) from order1 where userid="+ user.getUserid();
		totalRecordCount = dao.getTotalRecordSum(sql);
		return totalRecordCount;
	}
	@Override
	public List<Odetail> getOdetailByOrder(String oid) throws Exception{
		List<Odetail> list = null;
		
		String sql = "select * from odetail where oid="+oid;
		list = dao.getPageByQueryOdetail(sql);
		return list;
	}
	@Override
	public int updateZTByOid(String oid) throws Exception {
		int count = dao.updateZTByOid(oid);
		return count;
	}

}
