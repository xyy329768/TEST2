package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.dao.inter.AddressDao;

import com.util.ConnectOracle;
import com.vo.Address;


public class AddressDaoImpl implements AddressDao {

	// 1.组合Connection
	private Connection conn;

	public AddressDaoImpl() {
		
		conn = ConnectOracle.getConnection() ;
		/*conn = ConnOracle.getConnection();*/
	}

	@Override
	public int addAddress(Address address) throws Exception{
		int count = 0;
		// 3.建立通道
		String sql = "insert into address values(seq_address.nextval,?,?,?,?,?,?)";
		// 获得了一个预编译的通道 相当于IO通道 可以用它来发送sql语句
		PreparedStatement pstmt = null;

		// 默认事务是关闭的 调用addCategory增加一条记录的时候 会自动提交
		// 开启事务

		try {

			// conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, address.getAname());
			pstmt.setString(2, address.getAprovince());
			pstmt.setString(3, address.getAcity());
			pstmt.setString(4, address.getAdetailed());
			pstmt.setString(5, address.getAphone());
			pstmt.setInt(6, address.getUserid());
			
			
			// 4.执行并返回结果集
			count = pstmt.executeUpdate();// 可以执行除了DQL以外所有的语句 DML 返回的是受影响的行数
											// DCL或DDL语句 返回值是0

		
			if (count >= 1) {
				System.out.println("添加地址成功!");
			} else {
				System.out.println("没有添加任何地址!");
			}
		} catch (SQLException e) {
			
			System.out.println("建立通道或添加商品种类失败");
			e.printStackTrace();
			
			throw new Exception("地址添加失败");//异常转译
		} finally {
			// 5.关闭
			ConnectOracle.closeConnection(null, pstmt, conn);
		}

		return count;
	}
	
	
	@Override
	public List<Address> getPageByQuery(String sql) throws Exception {

		List<Address> list = new ArrayList<Address>();
		Address address = null;
		ResultSet rs = null;
		Statement stmt = null;
		// 3.建立通道
		try {
			stmt = conn.createStatement();
			// 4.执行并返回结果集
			rs = stmt.executeQuery(sql);
		
			while (rs.next()) {
				address = new Address();

				address.setAid(rs.getInt("aid"));
				address.setAname(rs.getString("aname"));
				address.setAprovince(rs.getString("aprovince"));
				address.setAcity(rs.getString("acity"));
				address.setAdetailed(rs.getString("adetailed"));
				address.setAphone(rs.getString("aphone"));
				address.setUserid(rs.getInt("userid"));
				list.add(address);

			}
		} catch (SQLException e) {
			System.out.println("创建通道或查询结果集失败");
			e.printStackTrace();
			
			throw new Exception("查询地址失败!");
			
		} finally {
			// 5.关闭
			ConnectOracle.closeConnection(rs, stmt, conn);
		}

		return list;
	}

	@Override
	public Address getOneByOid(int aid) throws Exception {

		Address address = new Address();
		// 3.建立通道
		String sql = "select * from address where aid=?";
		// 获得了一个预编译的通道 相当于IO通道 可以用它来发送sql语句
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// 默认事务是关闭的 调用addCategory增加一条记录的时候 会自动提交
		// 开启事务

		try {

			
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, aid);
			// 4.执行并返回结果集
			rs = pstmt.executeQuery();

			while (rs.next()) {
				address.setAid(rs.getInt("aid"));
				address.setAname(rs.getString("aname"));
				address.setAphone(rs.getString("aphone"));
				address.setAprovince(rs.getString("aprovince"));
				address.setAcity(rs.getString("acity"));
				address.setAdetailed(rs.getString("adetailed"));
				address.setUserid(rs.getInt("userid"));
				
			}
		} catch (SQLException e) {
			
			System.out.println("建立通道或查询地址失败");
			e.printStackTrace();
			
			throw new Exception("查询地址失败");//异常转译
		} finally {
			// 5.关闭
			ConnectOracle.closeConnection(null, pstmt, conn);
		}

		return address;
	}
	public  List<Address>  getAddressByUserid(int userid) throws Exception {
		
		List<Address> list = new ArrayList<Address>();
		Address address = null;
		ResultSet rs = null;
		Statement stmt = null;
		String sql = "select * from address where userid="+userid;
		// 3.建立通道
		try {
			stmt = conn.createStatement();
			// 4.执行并返回结果集
			rs = stmt.executeQuery(sql);
		
			while (rs.next()) {
				address = new Address();

				address.setAid(rs.getInt("aid"));
				address.setAname(rs.getString("aname"));
				address.setAprovince(rs.getString("aprovince"));
				address.setAcity(rs.getString("acity"));
				address.setAdetailed(rs.getString("adetailed"));
				address.setAphone(rs.getString("aphone"));
				address.setUserid(rs.getInt("userid"));
				list.add(address);

			}
		} catch (SQLException e) {
			System.out.println("创建通道或查询结果集失败");
			e.printStackTrace();
			
			throw new Exception("查询地址失败!");
			
		} finally {
			// 5.关闭
			ConnectOracle.closeConnection(rs, stmt, conn);
		}

		return list;
	}
	@Override
	public int deleteAddress(Address address) throws  Exception{
		
		System.out.println(address.getAid());
		int aid= address.getAid();
		int count = 0;
		// 3.建立通道
		String sql = "delete from address where aid="+aid;
		// 获得了一个预编译的通道 相当于IO通道 可以用它来发送sql语句
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			
			// 4.执行并返回结果集
			count = pstmt.executeUpdate();// 可以执行除了DQL以外所有的语句 DML 返回的是受影响的行数
											// DCL或DDL语句 返回值是0
			
			if (count >= 1) {
				System.out.println("删除地址成功!");
			} else {
				System.out.println("没有删除任何地址!");
			}
		} catch (SQLException e) {
			System.out.println("建立通道或删除地址失败");
			e.printStackTrace();
			throw new Exception("删除地址失败");
		} finally {
			// 5.关闭
			ConnectOracle.closeConnection(null, pstmt, conn);
		}

		return count;
	}

	
	@Override
	public Address getAddressById(int aid) throws Exception{
		Address address = new Address();

		// 3.建立通道
		String sql = "select * from address where aid="+aid;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);

			
			// 4.执行并返回结果集
			rs = pstmt.executeQuery();

			while (rs.next()) {
				address.setAid(rs.getInt("aid"));
				address.setAname(rs.getString("aname"));
				address.setAprovince(rs.getString("aprovince"));
				address.setAcity(rs.getString("acity"));
				address.setAdetailed(rs.getString("adetailed"));
				address.setAphone(rs.getString("aphone"));
				address.setUserid(rs.getInt("userid"));
			}
		} catch (SQLException e) {
			System.out.println("建立通道或查询单个商品种类失败");
			e.printStackTrace();
			throw new Exception("查询单个一级商品种类失败");
		} finally {
			// 5.关闭
			ConnectOracle.closeConnection(rs, pstmt, conn);
		}

		return address;
	}

	
	
	
	@Override
	public int updateAddress(Address address) throws Exception{
		int count = 0;
		// 3.建立通道
		String sql = "update address set aname=?,aprovince=?,acity=?,adetailed=?,aphone=? where aid=?";
		// 获得了一个预编译的通道 相当于IO通道 可以用它来发送sql语句
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, address.getAname());
			pstmt.setString(2, address.getAprovince());
			pstmt.setString(3, address.getAcity());
			pstmt.setString(4, address.getAdetailed());
			pstmt.setString(5, address.getAphone());
			/*pstmt.setInt(6, address.getUserid());*/
			pstmt.setInt(6, address.getAid());
			System.out.println(pstmt);
			// 4.执行并返回结果集
			count = pstmt.executeUpdate();// 可以执行除了DQL以外所有的语句 DML 返回的是受影响的行数
											// DCL或DDL语句 返回值是0

			if (count >= 1) {
				System.out.println("修改地址成功!");
			} else {
				System.out.println("没有修改任何地址!");
			}
		} catch (SQLException e) {
			System.out.println("建立通道或修改地址");
			e.printStackTrace();
			throw new Exception("修改一级地址失败");
			
		} finally {
			// 5.关闭
			ConnectOracle.closeConnection(null, pstmt, conn);
		}

		return count;
	}

	
	

	/*@Override
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
			ConnOracle.closeConnection(rs, stmt, conn);
		}

		return totalRecordCount;
	}*/

/*	public static void main(String[] args) throws Exception{
		
		
		CategoryDaoImpl dao=new CategoryDaoImpl();
		String sql="select count(*) from category";
		int count =dao.getTotalRecordCount(sql);
		System.out.println(count);
	}*/
	
}
