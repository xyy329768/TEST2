package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.dao.inter.UserProductDao;
import com.util.ConnectOracle;
import com.vo.Category2;
import com.vo.Product;

public class UserProductDaoImpl implements UserProductDao{
	private Connection conn;

	public UserProductDaoImpl() {
		conn = ConnectOracle.getConnection();
	}
	@Override
	public int getTotalRecordSum(String sql) throws Exception{
		int totalRecordSum = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				totalRecordSum = rs.getInt(1);
			}

		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
			throw new Exception("查询商品数量失败!");
		} finally {
		
			ConnectOracle.closeConnection(rs, pstmt, conn);
		}

		return totalRecordSum;
	}
	public List<Product> getAllProductForCategory2(String sql) throws Exception {
		Statement stmt = null;
		ResultSet rs = null;

		List<Product> list = new ArrayList<Product>();

		Product product = null;
		// 三.建立通道
		try {
			stmt = conn.createStatement();
			// 四.执行并返回结果集
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				product = new Product();
				product.setPid(rs.getInt("pid"));
				product.setPrice(rs.getInt("price"));
				product.setPname(rs.getString("pname"));
				product.setPdesc(rs.getString("pdesc"));
				product.setPingjiaSum(rs.getInt("pingjiaSum"));
				product.setProductSum(rs.getInt("productSum"));
				product.setDianpuName(rs.getString("dianpuName"));
				product.setOnsale(rs.getInt("onsale"));
				product.setProductListLargeImage1(rs.getString("productListLargeImage1"));
				product.setDetailSmallImg1(rs.getString("detailSmallImg1"));
				product.setDetailSmallImg2(rs.getString("detailSmallImg2"));
				product.setDetailSmallImg3(rs.getString("detailSmallImg3"));
				product.setDetailSmallImg4(rs.getString("detailSmallImg4"));
				product.setDetailSmallImg5(rs.getString("detailSmallImg5"));
				product.setDetailLargeImg1(rs.getString("detailLargeImg1"));
				product.setDetailLargeImg2(rs.getString("detailLargeImg2"));
				product.setDetailLargeImg3(rs.getString("detailLargeImg3"));
				product.setDetailLargeImg4(rs.getString("detailLargeImg4"));
				product.setDetailLargeImg5(rs.getString("detailLargeImg5"));
				list.add(product);
			}

		} catch (SQLException e) {
			System.out.println("建立通道失败!");
			e.printStackTrace();
			throw new Exception("查询商品失败!");
		} finally {
			// 五.关闭
			ConnectOracle.closeConnection(rs, stmt, conn);
		}

		return list;
	}
	public Product getProductById(Integer pid) throws Exception{
		Product product = new Product();
		List<Product> list = new ArrayList<Product>();

		String sql = "select * from product where pid=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// 三.建立通道
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pid);

			// 四.执行并返回结果集
			rs = pstmt.executeQuery();
			while (rs.next()) {
				product.setCid(rs.getInt("sfid"));
				product.setPid(rs.getInt("pid"));
				product.setPrice(rs.getInt("price"));
				product.setPname(rs.getString("pname"));
				product.setPdesc(rs.getString("pdesc"));
				product.setProductSum(rs.getInt("productSum"));
				product.setDianpuName(rs.getString("dianpuName"));
				product.setProductListLargeImage1(rs.getString("productListLargeImage1"));
				product.setDetailSmallImg1(rs.getString("detailSmallImg1"));
				product.setDetailSmallImg2(rs.getString("detailSmallImg2"));
				product.setDetailSmallImg3(rs.getString("detailSmallImg3"));
				product.setDetailSmallImg4(rs.getString("detailSmallImg4"));
				product.setDetailSmallImg5(rs.getString("detailSmallImg5"));
				product.setDetailLargeImg1(rs.getString("detailLargeImg1"));
				product.setDetailLargeImg2(rs.getString("detailLargeImg2"));
				product.setDetailLargeImg3(rs.getString("detailLargeImg3"));
				product.setDetailLargeImg4(rs.getString("detailLargeImg4"));
				product.setDetailLargeImg5(rs.getString("detailLargeImg5"));
				list.add(product);
			}

		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
			throw new Exception("查询单一商品失败!");
		} finally {
			// 五.关闭
			ConnectOracle.closeConnection(rs, pstmt, conn);

		}

		return product;
	}
	
	@Override
	public List<Product> getPageByQuery(String sql) throws Exception {
		List<Product> list = new ArrayList<Product>();
		
		ResultSet rs = null;
		Statement stmt = null;
		
		Product product = null;
		Category2 category2 = null;
		
		// 3.建立通道
		try {
			stmt = conn.createStatement();
			// 4.执行并返回结果集
			rs = stmt.executeQuery(sql);
			System.out.println("底层dao执行1");
			System.out.println(sql);
			while (rs.next()) {
				category2 = new Category2();
				product = new Product();
				System.out.println("底层dao执行2");
				product.setPid(rs.getInt("pid"));
				product.setPname(rs.getString("pname"));
				product.setPrice(rs.getDouble("price"));  
				product.setPingjiaSum(rs.getInt("pingjiasum"));
				product.setDianpuName(rs.getString("dianpuName"));
				product.setProductListLargeImage1(rs.getString("productListLargeImage1"));
				product.setProductListLargeImage2(rs.getString("productListLargeImage2"));
				product.setProductListLargeImage3(rs.getString("productListLargeImage3"));
				product.setProductListSmallImage1(rs.getString("productListSmallImage1"));
				product.setProductListSmallImage2(rs.getString("productListSmallImage2"));
				product.setProductListSmallImage3(rs.getString("productListSmallImage3"));
				product.setPdesc(rs.getString("pdesc"));
				product.setProductSum(rs.getInt("productSum"));
	  			product.setDetailLargeImg1(rs.getString("detailLargeImg1"));
				product.setDetailLargeImg2(rs.getString("detailLargeImg2"));
				product.setDetailLargeImg3(rs.getString("detailLargeImg3"));
				product.setDetailLargeImg4(rs.getString("detailLargeImg4"));
				product.setDetailLargeImg5(rs.getString("detailLargeImg5"));
				product.setDetailSmallImg1(rs.getString("detailSmallImg1"));
				product.setDetailSmallImg2(rs.getString("detailSmallImg2"));
				product.setDetailSmallImg3(rs.getString("detailSmallImg3"));
				product.setDetailSmallImg4(rs.getString("detailSmallImg4"));
				product.setDetailSmallImg5(rs.getString("detailSmallImg5"));
				product.setShoppingCarImg(rs.getString("shoppingCarImg"));
				product.setOnsale(rs.getInt("onsale"));
				product.setCid(rs.getInt("sfid"));
				
				category2.setCid(rs.getInt("sid"));
				category2.setCname(rs.getString("sname"));
				category2.setCdesc(rs.getString("sdesc"));
				category2.setFid(rs.getInt("fid"));
				product.setCategory(category2);
				
				System.out.println("----------------------");
				System.out.println(category2);
				list.add(product);
			}
		} catch (SQLException e) {
			System.out.println("创建通道或查询结果集失败");
			e.printStackTrace();
			
			throw new Exception("查询总共有多少条记录失败!");
			
		} finally {
			// 5.关闭
			ConnectOracle.closeConnection(rs, stmt, conn);
		}
		
		return list;
}
}
