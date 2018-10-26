package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.dao.inter.OrderDao;
import com.util.ConnOracleDataSource;
import com.util.ConnOracleDataSourceTransaction;
import com.util.ConnectOracle;
import com.vo.Category;
import com.vo.Odetail;
import com.vo.Order;

public class OrderDaoImpl implements OrderDao{
	private Connection conn;
	
	public OrderDaoImpl() {
		conn = ConnectOracle.getConnection();
	}
	@Override
	public int getTotalRecordSum(String sql) throws Exception {
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
			throw new Exception("查询订单数量失败!");
		} /* finally {
		// 5.关闭
		ConnOracle.closeConnection(null, pstmt, conn);
	}*/

		return totalRecordSum;
	}

	@Override
	public List<Odetail> getOdetailByQuery(String sql) throws Exception {
		List<Odetail> list = new ArrayList<Odetail>();
		Odetail odetail= null;
		ResultSet rs = null;
		Statement stmt = null;
		// 3.建立通道
		try {
			stmt = conn.createStatement();
			// 4.执行并返回结果集
			rs = stmt.executeQuery(sql);
		
			while (rs.next()) {
				odetail = new Odetail();
				odetail.setBeizhu(rs.getString("beizhu"));
				odetail.setOid(rs.getString("oid"));
				odetail.setPid(rs.getInt("pid"));
				odetail.setPname(rs.getString("pname"));
				odetail.setPsum(rs.getInt("psum"));
				odetail.setQuality(rs.getInt("quality"));
				list.add(odetail);
			}
		} catch (SQLException e) {
			System.out.println("创建通道或查询结果集失败");
			e.printStackTrace();
			
			throw new Exception("查询订单明细失败!");
			
		} /* finally {
		// 5.关闭
		ConnOracle.closeConnection(null, pstmt, conn);
	}*/

		return list;
	}
	
	public int updateOdetail(Odetail odetail) throws Exception {
		int count = 0;
		// 3.建立通道
		String sql = "update odetail set quality=0 where pid=?";
		// 获得了一个预编译的通道 相当于IO通道 可以用它来发送sql语句
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, odetail.getPid());
			
			// 4.执行并返回结果集
			count = pstmt.executeUpdate();// 可以执行除了DQL以外所有的语句 DML 返回的是受影响的行数
											// DCL或DDL语句 返回值是0

			if (count >= 1) {
				System.out.println("修改订单明细表性质成功!");
			} else {
				System.out.println("没有修改订单明细表性质成功!");
			}
		} catch (SQLException e) {
			System.out.println("建立通道或修改订单明细表性质失败");
			e.printStackTrace();
			throw new Exception("修改修改订单明细表性质失败");
		} /* finally {
		// 5.关闭
		ConnOracle.closeConnection(null, pstmt, conn);
	}*/

		return count;
	}

	public List<Order> getOrderByQuery(String sql) throws Exception {
		List<Order> list = new ArrayList<Order>();
		Order order= null;
		ResultSet rs = null;
		Statement stmt = null;
		String date = null;
		String time = null;
		String  shijian = null;
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd ");
		SimpleDateFormat sdf1=new SimpleDateFormat("HH:mm:ss ");
		SimpleDateFormat sdf2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		// 3.建立通道
		try {
			stmt = conn.createStatement();
			// 4.执行并返回结果集
			rs = stmt.executeQuery(sql);
		
			while (rs.next()) {
				order = new Order();
				order.setOid(rs.getString("oid"));
				date = sdf.format(rs.getDate("odate"));
				time = sdf1.format(rs.getTime("odate"));
				shijian = date +" "+ time;
				order.setOdate(sdf2.parse(shijian));
				order.setOprice(rs.getDouble("oprice"));
				order.setAname(rs.getString("aname"));
				order.setStatus(rs.getInt("status"));
				order.setUserid(rs.getInt("userid"));
				list.add(order);
			}
		} catch (SQLException e) {
			System.out.println("创建通道或查询结果集失败");
			e.printStackTrace();
			
			throw new Exception("查询订单明细失败!");
			
		} /* finally {
		// 5.关闭
		ConnOracle.closeConnection(null, pstmt, conn);
	}*/

		return list;
	}
	@Override
	public int addOrder(Order order) throws Exception {
		conn =ConnOracleDataSourceTransaction.getConnection();
		int count = 0;
		// 3.建立通道
		String sql = "insert into order1 values(?,sysdate,?,?,0,?)";
		PreparedStatement pstmt = null;

		try {

		
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, order.getOid());
			pstmt.setDouble(3, order.getOprice());
			pstmt.setString(2, order.getAname());
			pstmt.setInt(4, order.getUserid());
			
			// 4.执行并返回结果集
			count =pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			
			System.out.println("建立通道或添加商品种类失败");
			e.printStackTrace();
			
			throw new Exception("商品种类添加失败");//异常转译
		}/* finally {
			// 5.关闭
			ConnOracle.closeConnection(null, pstmt, conn);
		}*/

		return count;
	}
	@Override
	public int addOdetail(Odetail odetail) throws Exception {
		conn = ConnOracleDataSourceTransaction.getConnection();
		int count = 0;
		// 3.建立通道
		String sql = "insert into odetail values(?,?,?,?,?,?)";
		
		PreparedStatement pstmt = null;

		try {

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, odetail.getOid());
			pstmt.setInt(2, odetail.getPid());
			pstmt.setInt(3, odetail.getPsum());
			pstmt.setString(4, odetail.getBeizhu());
			pstmt.setInt(5, odetail.getQuality());
			pstmt.setString(6, odetail.getPname());
			// 4.执行并返回结果集
			count = pstmt.executeUpdate();
											
		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
			throw new Exception("添加订单明细失败");
		} /*finally {
			// 5.关闭
			ConnOracle.closeConnection(null, pstmt, conn);
		}*/

		return count;
	}
	public List<Odetail> getPageByQueryOdetail(String sql) throws Exception {

		List<Odetail> list = new ArrayList<Odetail>();
		Odetail odetail = null;
		Order order = null;
		ResultSet rs = null;
		Statement stmt = null;
		// 3.建立通道
		try {
			stmt = conn.createStatement();
			// 4.执行并返回结果集
			rs = stmt.executeQuery(sql);
		
			while (rs.next()) {
				odetail = new Odetail();
				
				odetail.setPname(rs.getString("pname"));
				odetail.setPsum(rs.getInt("psum"));

				list.add(odetail);

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
	public int deleteOdetail(Odetail odetail) throws Exception{
		int count = 0;
		// 3.建立通道
		String sql = "delete from odetail where oid=?";
		// 获得了一个预编译的通道 相当于IO通道 可以用它来发送sql语句
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, odetail.getOid());

			// 4.执行并返回结果集
			count = pstmt.executeUpdate();// 可以执行除了DQL以外所有的语句 DML 返回的是受影响的行数
											// DCL或DDL语句 返回值是0

			if (count >= 1) {
				System.out.println("删除订单详情成功!");
			} else {
				System.out.println("没有删除任何订单详情!");
			}
		} catch (SQLException e) {
			System.out.println("建立通道或删除订单详情失败");
			e.printStackTrace();
			throw new Exception("删除订单详情失败!");
		} finally {
			// 5.关闭
			ConnectOracle.closeConnection(null, pstmt, conn);
		}

		return count;
	}
	@Override
	public int deleteOrder(Order order) throws Exception{
		int count = 0;
		// 3.建立通道
		String sql = "delete from order1 where oid=?";
		// 获得了一个预编译的通道 相当于IO通道 可以用它来发送sql语句
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, order.getOid());

			// 4.执行并返回结果集
			count = pstmt.executeUpdate();// 可以执行除了DQL以外所有的语句 DML 返回的是受影响的行数
											// DCL或DDL语句 返回值是0

			if (count >= 1) {
				System.out.println("删除订单成功!");
			} else {
				System.out.println("没有删除任何订单!");
			}
		} catch (SQLException e) {
			System.out.println("建立通道或删除订单失败");
			e.printStackTrace();
			throw new Exception("删除订单失败!");
		} finally {
			// 5.关闭
			ConnectOracle.closeConnection(null, pstmt, conn);
		}

		return count;
	}
	@Override
	public int updateZTByOid(String oid) throws Exception {
		int count = 0;
		// 3.建立通道
		String sql = "update order1 set status=1 where oid="+oid;
		// 获得了一个预编译的通道 相当于IO通道 可以用它来发送sql语句
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);

			count = pstmt.executeUpdate();// 可以执行除了DQL以外所有的语句 DML 返回的是受影响的行数
											// DCL或DDL语句 返回值是0

			if (count >= 1) {
				System.out.println("修改订单状态成功!");
			} else {
				System.out.println("没有修改订单状态成功!");
			}
		} catch (SQLException e) {
			System.out.println("建立通道或修改订单状态失败");
			e.printStackTrace();
			throw new Exception("修改订单状态失败");
		} finally {
			ConnOracleDataSource.closeConnection(null,pstmt,conn);
		}

		return count;
	}
}
