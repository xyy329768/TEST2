package com.service.impl;

import java.util.List;

import com.dao.impl.ProductDaoImpl;
import com.dao.impl.UserProductDaoImpl;
import com.dao.inter.ProductDao;
import com.dao.inter.UserProductDao;
import com.page.OrderCondition;
import com.page.PageInfo;
import com.service.inter.UserProductService;
import com.vo.Product;

public class UserProductServiceImpl implements UserProductService{
	private UserProductDao dao;
	
	public UserProductServiceImpl(){
		
		dao = new UserProductDaoImpl();	
	}
	
	@Override
	public int getTotalRecordCount(Product product) throws Exception {
		String sql = "select count(*) from product where sfid="+(product.getCid()) +"and onsale=1 ";
		int count = dao.getTotalRecordSum(sql);
		return count;
	}
	@Override
	public int getTotalRecordCount2(Product product) throws Exception {
			
			int totalRecordCount = 0;
			
			//SELECT COUNT(*) FROM product p INNER JOIN category2 c ON (p.pid=c.cid2) WHERE 1=1 AND p.pname=''OR p.dianpuname like '%11%' OR c.cname2=''

		
			StringBuffer sb = new StringBuffer("select count(*) from (select t.*,rownum r from"+
									"(select * from product p inner join category2 c on(p.sfid = c.sid) where 1=1) t "+
									"where 1=1 ");
			
			String pname = product.getPname();
			String dianpuname = product.getDianpuName();
			String sname = product.getCategory().getCname();

			if (pname != null && !pname.trim().equals("")) {

				sb.append(" and t.pname like '%");
				sb.append(pname);
				sb.append("%'");
			}

			if (dianpuname != null && !dianpuname.trim().equals("")) {
				sb.append(" or t.dianpuname like '%");
				sb.append(dianpuname);
				sb.append("%'");
			}
			
			if (sname != null && !sname.trim().equals("")) {
				sb.append(" or t.sname='");
				sb.append(sname);
				sb.append("'");
			}
			
			sb.append(")");
			String sql = sb.toString();
			System.out.println(sql);
			totalRecordCount = dao.getTotalRecordSum(sql);
			System.out.println("这是按条件查询 返回的记录数"+totalRecordCount);
			return totalRecordCount;
	}
	
	public List<Product> getAllCategorysByPage(PageInfo pageInfo,Product product,OrderCondition orderConditionObj)
			throws Exception {
		List<Product> list = null;
		String orderCondition = orderConditionObj.getOrderCondition();
		String ascOrDesc = orderConditionObj.getAscOrDesc();
		String sql = "select * from (select c.*,rownum r from (select * from product where onsale=1 and sfid=" + product.getCid() + 
				
				" order by " + orderCondition + " " + ascOrDesc;
				
				sql = sql + ") c) where r>=";
				
				sql = sql + pageInfo.getBegin();
				
				sql = sql + " and r<=";
				
				sql = sql + pageInfo.getEnd();
				
				System.out.println(sql);
		System.out.println(sql);
		list = dao.getAllProductForCategory2(sql);
		return list;
	}
	@Override
	public List<Product> getPageByQuery(Product product, PageInfo pageInfo)
			throws Exception {
		List<Product> list = null;
		StringBuffer sb = new StringBuffer(
				"select * from (select t.*,rownum r from (select * from product p inner join category2 c on(p.sfid = c.sid) where 1=1) t  ");
		String pname = product.getPname();
		String dianpuname = product.getDianpuName();
		String sname = product.getCategory().getCname();
		String orderCondition = product.getOrderCondition().getOrderCondition();
		String ascOrDesc = product.getOrderCondition().getAscOrDesc();

		if (pname != null && !pname.trim().equals("")) {

			sb.append(" where t.pname like '%");
			sb.append(pname);
			sb.append("%'");
		}

		if (dianpuname != null && !dianpuname.trim().equals("")) {
			sb.append(" or t.dianpuname like '%");
			sb.append(dianpuname);
			sb.append("%'");
		}
		
		if (sname != null && !sname.trim().equals("")) {
			sb.append(" or t.sname='");
			sb.append(sname);
			sb.append("'");
		}
		
		sb.append(") where r>=");
		sb.append(pageInfo.getBegin());
		sb.append(" and r<=");
		sb.append(pageInfo.getEnd());
		sb.append(" order by ");
		sb.append(orderCondition+" ");
		sb.append(ascOrDesc);
		
		String sql = sb.toString();
		System.out.println(sql);

		list = dao.getPageByQuery(sql);
		return list; 
	}
	
	

	@Override
	public Product getProductById(String pid) throws Exception {
		Product	product = null;
		
		product = dao.getProductById(Integer.parseInt(pid));
		return product;
	}

}
