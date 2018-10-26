package com.service.impl;

import java.util.List;

import com.dao.impl.AddressDaoImpl;

import com.dao.inter.AddressDao;

import com.page.PageInfo;
import com.service.inter.AddressService;
import com.service.inter.CategoryService;
import com.vo.Address;


public class AddressServiceImpl implements AddressService{

	private AddressDao dao;
	
	public AddressServiceImpl(){
		dao=new AddressDaoImpl();
	}

	@Override
	public int addAddress(Address address) throws Exception{
		int count=dao.addAddress(address);
		return count;
	}

	
	@Override
	public List<Address> getAllAddress() throws Exception {
		List<Address> list=null;
		String sql="select * from address";
		list = dao.getPageByQuery(sql);
		return list;
	}
	
	public List<Address> getAddressByUserid(int userid) throws Exception {
		List<Address> list=null;
		list = dao.getAddressByUserid(userid);
		return list;
	}
	
	@Override
	public Address getOneByOid(String aid) throws Exception {
		Address address = dao.getOneByOid(Integer.parseInt(aid));
		return address;
	}
	
	

	@Override
	public int deleteAddressById(String aid) throws Exception{
		Address address = new Address();
		address.setAid(Integer.parseInt(aid));
		int count=dao.deleteAddress(address);
		System.out.println("返回来的"+count);
		return count;
	}

	@Override
	public Address getAddressById(String aid) throws Exception {
		Address address=null;
		address=dao.getAddressById(Integer.parseInt(aid));
		return address;
	}

	@Override
	public int updateAddress(Address address) throws Exception {
		 int count=dao.updateAddress(address);
		 return count;
	}

	/*@Override
	public List<Category> getAllByPage(PageInfo pageInfo) throws Exception {
		
		
		
		String sql=" select * from  (select c.* ,rownum r from category c) where "+ pageInfo.getBegin() +"<=r and r<="+ pageInfo.getEnd() +"";
		List<Category> list=null;
		list=dao.getPageByQuery(sql);
		return list;
	}

	

	@Override
	public int getTotalRecordCount() throws Exception {
		int totalRecordCount=-1;
		String sql="select count(*) from category";
		totalRecordCount=dao.getTotalRecordCount(sql);
		return totalRecordCount;
	}

	@Override
	public List<Category> getPageByQuery(Category category,PageInfo pageInfo) throws Exception{
		List<Category> list = null;

		// String sql =
		// "select * from (select c.*,rownum r from category c where 1=1 and cname='商品种类名称' or cdesc like '%111%') where r>=11 and r<=15"

		StringBuffer sb = new StringBuffer(
				"select * from (select c.*,rownum r from category c where 1=1");

		String cname = category.getCname();
		String cdesc = category.getCdesc();

		if (cname != null && !cname.trim().equals("")) {

			sb.append(" and cname='");
			sb.append(cname);
			sb.append("'");
		}

		if (cdesc != null && !cdesc.trim().equals("")) {
			sb.append(" or cdesc like '%");
			sb.append(cdesc);
			sb.append("%'");
		}
		
		sb.append(") where r>=");
		sb.append(pageInfo.getBegin());
		sb.append(" and r<=");
		sb.append(pageInfo.getEnd());
		
		String sql = sb.toString();
		System.out.println(sql);

		list = dao.getPageByQuery(sql);
		return list;
	}

	@Override
	public int getTotalRecordCount(Category category) throws Exception {
		int totalRecordCount = -1;

		StringBuffer sb = new StringBuffer("select count(*) from category where 1=1");
		
		String cname = category.getCname();
		String cdesc = category.getCdesc();

		if (cname != null && !cname.trim().equals("")) {

			sb.append(" and cname='");
			sb.append(cname);
			sb.append("'");
		}

		if (cdesc != null && !cdesc.trim().equals("")) {
			sb.append(" or cdesc like '%");
			sb.append(cdesc);
			sb.append("%'");
		}
		
		String sql = sb.toString();
		totalRecordCount = dao.getTotalRecordCount(sql);
		return totalRecordCount;
	}*/
	
	
	
	
	/*public static void main(String[] args) throws Exception {
		CategoryServiceImpl service = new CategoryServiceImpl();
		Category category =new Category();
		category.setCdesc("商品种类描述");
		PageInfo pageInfo = new PageInfo(5);
		
		List<Category> list = service.getPageByQuery(category, pageInfo);
		
		for(Category temp:list){
			System.out.println(temp);
		}
	}*/
	
}
