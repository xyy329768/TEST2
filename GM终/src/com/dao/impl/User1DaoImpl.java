package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.dao.inter.User1Dao;
import com.util.ConnectOracle;
import com.vo.Product;
import com.vo.User1;

public class User1DaoImpl implements User1Dao{

	// 1.组合Connection
	private Connection conn;

	public User1DaoImpl() {
		conn = ConnectOracle.getConnection();
	}
	
	@Override
	public List<User1> getPageByQuery(String sql) throws Exception {

		List<User1> list = new ArrayList<User1>();
		User1 user1 = null;
		ResultSet rs = null;
		Statement stmt = null;
		// 3.建立通道
		try {
			stmt = conn.createStatement();
			// 4.执行并返回结果集
			rs = stmt.executeQuery(sql);
		
			while (rs.next()) {
				user1 = new User1();

				user1.setUserId(rs.getInt("userId"));
				user1.setPassword(rs.getString("password"));
				user1.setUserName(rs.getString("userName"));
				user1.setIsActive(rs.getInt("isActive"));
				user1.setNickName(rs.getString("nickName"));
				user1.setAddress(rs.getString("address"));
				user1.setPhoneNumber(rs.getString("phoneNumber"));
				user1.setEmail(rs.getString("email"));
				user1.setConfirmPass(rs.getString("confirmPass"));
 
				list.add(user1);

			}
		} catch (SQLException e) {
			System.out.println("创建通道或查询结果集失败");
			e.printStackTrace();
			throw new Exception("查询用户失败");
			
		} finally {
			// 5.关闭
			ConnectOracle.closeConnection(rs, stmt, conn);
		}

		return list;
	}
	
	@Override
	public int getTotalRecordCount(String sql) throws Exception{
		int totalRecordCount = -1;
		
		ResultSet rs = null;
		Statement stmt = null;
		// 3.建立通道
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
			// 5.关闭
			ConnectOracle.closeConnection(rs, stmt, conn);
		}

		return totalRecordCount;
	}

	@Override
	public User1 getUser1ById(int id) throws Exception{
		User1 user1 = new User1();

		// 3.建立通道
		String sql = "select * from user1 where userId=?";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, id);
			// 4.执行并返回结果集
			rs = pstmt.executeQuery();

			while (rs.next()) {
				user1.setUserId(rs.getInt("userId"));
				user1.setUserName(rs.getString("userName"));
				user1.setPassword(rs.getString("password"));
				user1.setNickName(rs.getString("nickName"));
				user1.setPhoneNumber(rs.getString("phoneNumber"));
				user1.setEmail(rs.getString("email"));
			}
		} catch (SQLException e) {
			System.out.println("建立通道或查询单个用户失败");
			e.printStackTrace();
			throw new Exception("查询单个用户失败");
		} finally {
			// 5.关闭
			ConnectOracle.closeConnection(rs, pstmt, conn);
		}

		return user1;
	}
	
	@Override
	public int updateUser1(User1 user1) throws Exception{
		int count = 0;
		// 3.建立通道
		String sql = "update user1 set userName=?,password=?,nickName=?,phoneNumber=?,email=? where userId=?";
		// 获得了一个预编译的通道 相当于IO通道 可以用它来发送sql语句
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, user1.getUserName());
			pstmt.setString(2, user1.getPassword());
			pstmt.setString(3, user1.getNickName());
			pstmt.setString(4, user1.getPhoneNumber());
			pstmt.setString(5, user1.getEmail());
			pstmt.setInt(6, user1.getUserId());
			// 4.执行并返回结果集
			count = pstmt.executeUpdate();// 可以执行除了DQL以外所有的语句 DML 返回的是受影响的行数
											// DCL或DDL语句 返回值是0

			if (count >= 1) {
				System.out.println("修改用户成功!");
			} else {
				System.out.println("没有修改任何用户!");
			}
		} catch (SQLException e) {
			System.out.println("建立通道或修改用户失败");
			e.printStackTrace();
			throw new Exception("修用户失败!");
		} finally {
			// 5.关闭
			ConnectOracle.closeConnection(null, pstmt, conn);
		}

		return count;
	}
	
	@Override
	public int deleteUser1(User1 user1) throws Exception{
		int count = 0;
		// 3.建立通道
		String sql = "delete from user1 where userId=?";
		// 获得了一个预编译的通道 相当于IO通道 可以用它来发送sql语句
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, user1.getUserId());

			// 4.执行并返回结果集
			count = pstmt.executeUpdate();// 可以执行除了DQL以外所有的语句 DML 返回的是受影响的行数
											// DCL或DDL语句 返回值是0

			if (count >= 1) {
				System.out.println("删除用户成功!");
			} else {
				System.out.println("没有删除任何用户!");
			}
		} catch (SQLException e) {
			System.out.println("建立通道或删除用户失败");
			e.printStackTrace();
			throw new Exception("删除一级用户失败!");
		} finally {
			// 5.关闭
			ConnectOracle.closeConnection(null, pstmt, conn);
		}

		return count;
	}
	
	//修改激活状态
	public int updateUser1Active(User1 user1) throws Exception {
		String sql = "update user1 set isActive=? where userId = ?";
		
		PreparedStatement pstmt = null;
		// 三.建立通道
		int count = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,(int)user1.getIsActive());
			pstmt.setInt(2, (int) user1.getUserId());
			
			// 四.执行并返回结果集
			count = pstmt.executeUpdate();// 执行dml 或 ddl语句的 返回受影响的行数
			
		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
			throw new Exception("激活用户失败!");
		} finally {
			// 五.关闭
			ConnectOracle.closeConnection(null, pstmt, conn);

		}

		return count;
	}
	
}
