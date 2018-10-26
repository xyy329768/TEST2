package com.dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.dao.inter.UserDao;
import com.util.ConnectOracle;
import com.vo.User;

public class UserDaoImpl implements UserDao {

	
	private Connection conn;
	
	public UserDaoImpl() {
		conn = ConnectOracle.getConnection();
	}
	@Override
	public int updateIsactive(User user) throws Exception {
		int count;
		String sql = "update user1 set isactive = 1 where username = ?";
		PreparedStatement pstmt = null;
		// 三.建立通道
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, user.getUsername());

			// 四.执行并返回结果集
			count = pstmt.executeUpdate();// 执行dml 或 ddl语句的 返回受影响的行数
			if (count >= 1) {
				System.out.println("修改激活成功!");
			} else {
				System.out.println("没有激活任何用户!");
			}

		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
			throw new Exception("修改用户失败");
		} finally {
			// 5.关闭
			ConnectOracle.closeConnection(null, pstmt, conn);
		}

		return count;
	}

	public List<User> getNamesByQuery(String sql) throws Exception{
		Statement stmt = null;
		ResultSet rs = null;

		List<User> list = new ArrayList<User>();

		User user = null;

		// 三.建立通道
		try {
			stmt = conn.createStatement();
			// 四.执行并返回结果集
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				user = new User();
				user.setUsername(rs.getString("username"));
				list.add(user);
			}

		} catch (SQLException e) {
			System.out.println("建立通道失败!");
			e.printStackTrace();
			throw new Exception("查询用户失败");
		} finally {
			// 五.关闭
			ConnectOracle.closeConnection(rs, stmt, conn);
		}

		return list;
	}
	@Override
	public int addUser(User user) throws Exception {
		String sql = "insert into user1(userid,username,password,isactive,confirmPass,phoneNumber,email) values(seq_user.nextval,?,?,0,?,?,?)";
		PreparedStatement pstmt = null;
		// 三.建立通道
		int count = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUsername());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getConfirmPass());
			pstmt.setString(4, user.getPhoneNumber());
			pstmt.setString(5, user.getEmail());
			count = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
			throw new Exception("注册失败");
		} finally {
			ConnectOracle.closeConnection(null, pstmt, conn);
		}
		
		return count;

	}

	@Override
	public int deleteUser(User user) throws Exception{
		int count = 0;
		String sql = "delete from user1 where userid=?";
		PreparedStatement pstmt = null;
		// 三.建立通道
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, user.getUserid());

			// 四.执行并返回结果集
			count = pstmt.executeUpdate();// 执行dml 或 ddl语句的 返回受影响的行数
			if (count >= 1) {
				System.out.println("删除用户成功!");
			} else {
				System.out.println("没有删除任何用户!");
			}

		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
			throw new Exception("删除用户失败");
		} finally {
			// 5.关闭
			ConnectOracle.closeConnection(null, pstmt, conn);

		}

		return count;
	}

	// 三.修改
	public int updateUser(User user) throws Exception{
		int count;
		String sql = "update user1 set username=?,password=?,isActive=?,nickName=?,address=? where userid=?";
		PreparedStatement pstmt = null;
		// 三.建立通道
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUsername());
			pstmt.setString(2, user.getPassword());
			pstmt.setInt(3, user.getIsActive());
			pstmt.setString(4, user.getNickname());
			pstmt.setString(5, user.getAddress());
			pstmt.setInt(6, user.getUserid());
			// 四.执行并返回结果集
			count = pstmt.executeUpdate();// 执行dml 或 ddl语句的 返回受影响的行数
			if (count >= 1) {
				System.out.println("修改用户成功!");
			} else {
				System.out.println("没有修改任何用户!");
			}

		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
			throw new Exception("修改用户失败");
		} finally {
			// 5.关闭
			ConnectOracle.closeConnection(null, pstmt, conn);
		}

		return count;
	}

	// 四.查1

	public User getUserById(Integer userid) throws Exception{
		User user = new User();

		String sql = "select * from user1 where userid=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// 三.建立通道
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userid);

			// 四.执行并返回结果集
			// ResultSet 结果集 封装了 数据库查询的结果集
			rs = pstmt.executeQuery();
			while (rs.next()) {
				user.setUserid(rs.getInt(1));
				user.setUsername(rs.getString(2));
				user.setPassword(rs.getString(3));
			}

		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
			throw new Exception("查询单个用户失败");
		} finally {
			// 五.关闭
			ConnectOracle.closeConnection(rs, pstmt, conn);

		}

		return user;
	}

	// 五.按SQL语句查
	public List<User> getPageByQuery(String sql) throws Exception{
		Statement stmt = null;
		ResultSet rs = null;

		List<User> list = new ArrayList<User>();

		User user = null;

		// 三.建立通道
		try {
			stmt = conn.createStatement();
			// 四.执行并返回结果集
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				user = new User();

				user.setUserid(rs.getInt("userid"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setIsActive(rs.getInt("isActive"));
				user.setNickname(rs.getString("nickname"));
				user.setAddress(rs.getString("address"));
				user.setLoginCount(rs.getInt("loginCount"));
				user.setLockState(rs.getInt("lockState"));
				list.add(user);
			}

		} catch (SQLException e) {
			System.out.println("建立通道失败!");
			e.printStackTrace();
			throw new Exception("查询用户失败");
		} finally {
			// 五.关闭
			ConnectOracle.closeConnection(rs, stmt, conn);
		}

		return list;
	}



	public int getTotalRecordSum(String sql) throws Exception{
		int totalRecordSum = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// 三.建立通道
		try {
			pstmt = conn.prepareStatement(sql);
			

			// 四.执行并返回结果集
			// ResultSet 结果集 封装了 数据库查询的结果集
			rs = pstmt.executeQuery();
			while (rs.next()) {
				totalRecordSum = rs.getInt(1);
			}

		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
			throw new Exception("查询用户数量失败");
		} finally {
			// 五.关闭
			ConnectOracle.closeConnection(rs, pstmt, conn);

		}

		return totalRecordSum;
	}
	
	@Override
	public int updateUserState(String username, Integer loginCount,
			Integer lockState) throws Exception{
		int count=0;
		User user = new User();
		String sql = "update user1 set loginCount=?,lockState=? where username=?";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, loginCount);
			pstmt.setInt(2, lockState);
			pstmt.setString(3, username);
			
			count = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
			throw new Exception("修改用户状态失败");
		}finally {
			// 5.关闭
			ConnectOracle.closeConnection(null, pstmt, conn);
		}
		
		return count;
	}


	@Override
	public User getUserState(String username) throws Exception{
		User user = new User();

		String sql = "select * from user1 where username=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String date = null;
		String time = null;
		String  shijian = null;
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd ");
		SimpleDateFormat sdf1=new SimpleDateFormat("HH:mm:ss ");
		SimpleDateFormat sdf2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		// 三.建立通道
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);

			// 四.执行并返回结果集
			// ResultSet 结果集 封装了 数据库查询的结果集
			rs = pstmt.executeQuery();
			while (rs.next()) {
				user.setUserid(rs.getInt("userid"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setLoginCount(rs.getInt("loginCount"));
				user.setLockState(rs.getInt("lockState"));
				date = sdf.format(rs.getDate("loginTime"));
				time = sdf1.format(rs.getTime("loginTime"));
				shijian = date +" "+ time;
				user.setLoginTime(sdf2.parse(shijian));
				System.out.println(sdf2.parse(shijian));
			}
		
		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
			throw new Exception("查询单个用户失败");
		} finally {
			// 五.关闭
			ConnectOracle.closeConnection(rs, pstmt, conn);

		}

		return user;
	}


	@Override
	public User getUserByQuery(String sql) throws Exception {
		Statement stmt = null;
		ResultSet rs = null;

		User user = null;

		// 三.建立通道
		try {
			stmt = conn.createStatement();
			// 四.执行并返回结果集
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				user = new User();

				user.setUserid(rs.getInt("userid"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setIsActive(rs.getInt("isActive"));
				user.setNickname(rs.getString("nickname"));
				user.setAddress(rs.getString("address"));
				user.setLoginCount(rs.getInt("loginCount"));
				user.setLockState(rs.getInt("lockState"));
				user.setLoginTime(rs.getDate("loginTime"));
			}

		} catch (SQLException e) {
			System.out.println("建立通道失败!");
			e.printStackTrace();
			throw new Exception("查询用户失败");
		} finally {
			// 五.关闭
			ConnectOracle.closeConnection(rs, stmt, conn);
		}

		return user;
	}


	@Override
	public int updateUserByUsername(String username) throws Exception {
		int count;
	
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		String sysdate =sdf.format(new Date());
//		Date nowDate= (java.sql.Date)new Date();
		//=to_date('?','yyyy-mm-dd hh:mi:ss')
		String sql = "update user1 set loginTime=sysdate where username='"+username+"'";
		Statement stmt = null;
		System.out.println("***********dao曾*****");
		// 三.建立通道
		try {
			stmt = conn.createStatement();
	
			
			System.out.println("****************tongdao");
			System.out.println(sql);
			// 四.执行并返回结果集
			count = stmt.executeUpdate(sql);
		
			
		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
			throw new Exception("修改用户失败");
		} finally {
			// 5.关闭
			ConnectOracle.closeConnection(null, stmt, conn);
		}
		System.out.println("count="+count);
		return count;
	}

	
}
