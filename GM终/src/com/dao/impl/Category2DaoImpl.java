package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.dao.inter.Category2Dao;
import com.util.ConnOracleDataSource;
import com.util.ConnectOracle;
import com.vo.Category;
import com.vo.Category2;

public class Category2DaoImpl implements Category2Dao{
	private Connection conn;

	public Category2DaoImpl() {
		conn = ConnectOracle.getConnection();
	}

	@Override
	public int addCategory(Category2 category) throws Exception {
		int count = 0;
		// 3.建立通道
		String sql = "insert into category2 values(seq_category.nextval,?,?,?)";
		// 获得了一个预编译的通道 相当于IO通道 可以用它来发送sql语句
		PreparedStatement pstmt = null;

		// 默认事务是关闭的 调用addCategory增加一条记录的时候 会自动提交
		// 开启事务

		try {

			// conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, category.getCname());
			pstmt.setString(2, category.getCdesc());
			pstmt.setInt(3, category.getFid());
			// 4.执行并返回结果集
			count = pstmt.executeUpdate();// 可以执行除了DQL以外所有的语句 DML 返回的是受影响的行数
											// DCL或DDL语句 返回值是0

		
			if (count >= 1) {
				System.out.println("添加二级商品种类成功!");
			} else {
				System.out.println("没有添加任何商品种类!");
			}
		} catch (SQLException e) {
			
			System.out.println("建立通道或添加商品种类失败");
			e.printStackTrace();
			
			throw new Exception("添加二级商品种类失败");
		} finally {
			ConnOracleDataSource.closeConnection(null,pstmt,conn);
		}

		return count;
	}

	@Override
	public int getTotalRecordCount(String sql) throws Exception {
		int totalRecordCount = -1;
		
		ResultSet rs = null;
		Statement stmt = null;
		// 3.建立通道s
		try {
			stmt = conn.createStatement();
			// 4.执行并返回结果集
			rs = stmt.executeQuery(sql);
		
			while (rs.next()) {
				
				totalRecordCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("创建通道或查询结果集失败");
			e.printStackTrace();
			
			throw new Exception("查询总共有多少条记录失败!");
			
		} finally {
			ConnOracleDataSource.closeConnection(rs,stmt,conn);
		}

		return totalRecordCount;
	}
	@Override
	//只是查二级商品表
	public List<Category2> getPageByQueryOnly2(String sql) throws Exception {

		List<Category2> list = new ArrayList<Category2>();
		Category2 category = null;
		Category categoryparent = null;
		ResultSet rs = null;
		Statement stmt = null;
		// 3.建立通道
		try {
			stmt = conn.createStatement();
			// 4.执行并返回结果集
			rs = stmt.executeQuery(sql);
		
			while (rs.next()) {
				category = new Category2();
				
				category.setCid(rs.getInt("sid"));
				category.setCname(rs.getString("sname"));
				category.setCdesc(rs.getString("sdesc"));
				category.setFid(rs.getInt("fid"));

				list.add(category);

			}
		} catch (SQLException e) {
			System.out.println("创建通道或查询结果集失败");
			e.printStackTrace();
			
			throw new Exception("查询二级商品种类失败!");
			
		} finally {
			// 5.关闭
			ConnOracleDataSource.closeConnection(rs, stmt, conn);
		}

		return list;
	}

	@Override
	//一级商品表、二级商品表组成一个联合表
	public List<Category2> getPageByQuery(String sql) throws Exception {

		List<Category2> list = new ArrayList<Category2>();
		Category2 category = null;
		Category categoryparent = null;
		ResultSet rs = null;
		Statement stmt = null;
		// 3.建立通道
		try {
			stmt = conn.createStatement();
			// 4.执行并返回结果集
			rs = stmt.executeQuery(sql);
		
			while (rs.next()) {
				category = new Category2();
				categoryparent = new Category();
				category.setCid(rs.getInt("sid"));
				category.setCname(rs.getString("sname"));
				category.setCdesc(rs.getString("sdesc"));
				category.setFid(rs.getInt("fid"));
				categoryparent.setCid(rs.getInt("cid"));
				categoryparent.setCname(rs.getString("cname"));
				categoryparent.setCdesc(rs.getString("cdesc"));
				category.setCategory(categoryparent);
				list.add(category);

			}
		} catch (SQLException e) {
			System.out.println("创建通道或查询结果集失败");
			e.printStackTrace();
			
			throw new Exception("查询二级商品种类失败!");
			
		} finally {
			// 5.关闭
			ConnOracleDataSource.closeConnection(rs, stmt, conn);
		}

		return list;
	}

	@Override
	public int deleteCategory(Category2 category) throws Exception {
		int count = 0;
		// 3.建立通道
		String sql = "delete from category2 where sid=?";
		// 获得了一个预编译的通道 相当于IO通道 可以用它来发送sql语句
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, category.getCid());
			
			// 4.执行并返回结果集
			count = pstmt.executeUpdate();// 可以执行除了DQL以外所有的语句 DML 返回的是受影响的行数
											// DCL或DDL语句 返回值是0
			
			if (count >= 1) {
				System.out.println("删除商品种类成功!");
			} else {
				System.out.println("没有删除任何商品种类!");
			}
		} catch (SQLException e) {
			System.out.println("建立通道或删除商品种类失败");
			e.printStackTrace();
			throw new Exception("删除单个商品失败");
		} finally {
			ConnOracleDataSource.closeConnection(null,pstmt,conn);
		}

		return count;
	}

	@Override
	public Category2 getCategoryById(int id) throws Exception {
		Category2 category = null;
		Category categoryparent = null;
		// 3.建立通道
		String sql = "select * from  category2 c2  inner join category c1  ON （c2.fid=c1.cid） where sid=?";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, id);
			// 4.执行并返回结果集
			rs = pstmt.executeQuery();

			while (rs.next()) {
				category = new Category2();
				categoryparent = new Category();
				category.setCid(rs.getInt("sid"));
				category.setCname(rs.getString("sname"));
				category.setCdesc(rs.getString("sdesc"));
				category.setFid(rs.getInt("fid"));
				categoryparent.setCid(rs.getInt("cid"));
				
				categoryparent.setCname(rs.getString("cname"));
				categoryparent.setCdesc(rs.getString("cdesc"));
				category.setCategory(categoryparent);
				
			}
		} catch (SQLException e) {
			System.out.println("建立通道或查询单个商品种类失败");
			e.printStackTrace();
			throw new Exception("查询单个商品失败");
		} finally {
			ConnOracleDataSource.closeConnection(rs,pstmt,conn);
		}

		return category;
	}

	@Override
	public int updateCategory(Category2 category) throws Exception {
		int count = 0;
		// 3.建立通道
		String sql = "update category2 set sname=?,sdesc=?,fid=? where sid=?";
		// 获得了一个预编译的通道 相当于IO通道 可以用它来发送sql语句
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, category.getCname());
			pstmt.setString(2, category.getCdesc());
			pstmt.setInt(3, category.getFid());
			pstmt.setInt(4, category.getCid());
			// 4.执行并返回结果集
			count = pstmt.executeUpdate();// 可以执行除了DQL以外所有的语句 DML 返回的是受影响的行数
											// DCL或DDL语句 返回值是0

			if (count >= 1) {
				System.out.println("修改商品种类成功!");
			} else {
				System.out.println("没有修改任何商品种类!");
			}
		} catch (SQLException e) {
			System.out.println("建立通道或修改商品种类失败");
			e.printStackTrace();
			throw new Exception("修改单个商品失败");
		} finally {
			ConnOracleDataSource.closeConnection(null,pstmt,conn);
		}

		return count;
	}
	
}
