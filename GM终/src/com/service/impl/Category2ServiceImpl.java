package com.service.impl;

import java.util.List;

import com.dao.impl.Category2DaoImpl;
import com.dao.impl.CategoryDaoImpl;
import com.dao.inter.Category2Dao;
import com.page.PageInfo;
import com.service.inter.Category2Service;
import com.vo.Category;
import com.vo.Category2;

public class Category2ServiceImpl implements Category2Service {
	private Category2Dao dao;
	
	public Category2ServiceImpl(){
		dao = new Category2DaoImpl();
	}
	@Override
	public int addCategory(Category2 category) throws Exception {
		int count = dao.addCategory(category);
		return count;
	}
	@Override
	public int getTotalRecordCount(Category2 category) throws Exception {
		int totalRecordCount = -1;
		
		String sql = "select count(*) from category2 where fid="+category.getFid();
		totalRecordCount = dao.getTotalRecordCount(sql);
		return totalRecordCount;
	}
	@Override
	public List<Category2> getAllCategory2ByCategory1(int cid)
			throws Exception {
		List<Category2> list = null;
		
		String sql = "select * from category2 where fid="+cid;
		list = dao.getPageByQueryOnly2(sql);
		return list;
	}
	@Override
	public int getTotalRecordCount() throws Exception {
		int totalRecordCount = -1;
		
		String sql = "select count(*) from category2";
		totalRecordCount = dao.getTotalRecordCount(sql);
		return totalRecordCount;
	}
	@Override
	public List<Category2> getAllCategorysByPage(PageInfo pageInfo)
			throws Exception {
		List<Category2> list = null;
		
		String sql = "select * FROM (select c.*,rownum r from (SELECT * FROM CATEGORY c1 INNER JOIN category2 c2 ON(c1.cid=c2.fid)) c) WHERE r>="+pageInfo.getBegin()+ "and r<="+pageInfo.getEnd();
		list = dao.getPageByQuery(sql);
		return list;
	}
	@Override
	public List<Category2> getPageByQuery(Category2 category,PageInfo pageInfo) throws Exception {
		List<Category2> list = null;
		//sql=SELECT * FROM (SELECT c.*,rownum r from (SELECT * FROM (category2 c2  inner join category c1  ON （c2.fid=c1.cid）)where 1=1 and sname='家用电器' or sdesc like '%家用电器%' or cname = '家用电器')c) where r>=1 and r<=5;
		StringBuffer sb = new StringBuffer(
				"SELECT * FROM (SELECT c.*,rownum r from (SELECT * FROM (category2 c2  inner join category c1  ON （c2.fid=c1.cid）)where 1=1");

		String cname = category.getCname();
		String cdesc = category.getCdesc();
		String parentcname = category.getCategory().getCname();
		
		if(cname!=null && !cname.trim().equals("")){
			sb.append(" and sname='");
			sb.append(cname);
			sb.append("'");
		}
		if(cdesc!=null && !cdesc.trim().equals("")){
			sb.append(" or sdesc like '%");
			sb.append(cdesc);
			sb.append("%'");
		}
		if(parentcname!=null && !cdesc.trim().equals("")){
			sb.append(" or cname = '");
			sb.append(parentcname);
			sb.append("'");
		}
		sb.append(")c) where r>=");
		sb.append(pageInfo.getBegin());
		sb.append(" and r<=");
		sb.append(pageInfo.getEnd());
		String sql = sb.toString();
		System.out.println(sql);
		list = dao.getPageByQuery(sql);
		return list;
		
	}


	@Override
	public int getAllTotalRecordCount(Category2 category) throws Exception {
		
		int totalRecordCount = -1;
		
		StringBuffer sb = new StringBuffer("select count(*) from category2 c2  inner join category c1  ON （c2.fid=c1.cid）  where 1=1");
		
		String cname = category.getCname();
		
		String cdesc = category.getCdesc();
	
		String parentcname = category.getCategory().getCname();
		

		if (cname != null && !cname.trim().equals("")) {

			sb.append(" and sname='");
			sb.append(cname);
			sb.append("'");
		}

		if (cdesc != null && !cdesc.trim().equals("")) {
			sb.append(" or sdesc like '%");
			sb.append(cdesc);
			sb.append("%'");
		}
		if(parentcname!=null && !parentcname.trim().equals("")){
			sb.append(" or cname = '");
			sb.append(parentcname);
			sb.append("'");
		}
		
		String sql = sb.toString();
		System.out.println(sql);
		totalRecordCount = dao.getTotalRecordCount(sql);
		return totalRecordCount;
	}
	@Override
	public int deleteCategoryByCid(String cid) throws Exception {
		Category2 category = new Category2();
		category.setCid(Integer.parseInt(cid));
		int count= dao.deleteCategory(category);
		return count;
		
	}
	@Override
	public Category2 getOne(String cid) throws Exception {
		Category2	category = null;
		
		category = dao.getCategoryById(Integer.parseInt(cid));
		return category;
	}
	@Override
	public int updateCategory(Category2 category) throws Exception {
		int count = dao.updateCategory(category);
		return count;
	}
	@Override
	public List<Category2> getAllCategorys() throws Exception {
		List<Category2> list = null;
		
		String sql = "select * from category2";
		list = dao.getPageByQueryOnly2(sql);
		return list;
	}

}
