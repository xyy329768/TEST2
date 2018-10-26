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

	// 1.���Connection
	private Connection conn;

	public AddressDaoImpl() {
		
		conn = ConnectOracle.getConnection() ;
		/*conn = ConnOracle.getConnection();*/
	}

	@Override
	public int addAddress(Address address) throws Exception{
		int count = 0;
		// 3.����ͨ��
		String sql = "insert into address values(seq_address.nextval,?,?,?,?,?,?)";
		// �����һ��Ԥ�����ͨ�� �൱��IOͨ�� ��������������sql���
		PreparedStatement pstmt = null;

		// Ĭ�������ǹرյ� ����addCategory����һ����¼��ʱ�� ���Զ��ύ
		// ��������

		try {

			// conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, address.getAname());
			pstmt.setString(2, address.getAprovince());
			pstmt.setString(3, address.getAcity());
			pstmt.setString(4, address.getAdetailed());
			pstmt.setString(5, address.getAphone());
			pstmt.setInt(6, address.getUserid());
			
			
			// 4.ִ�в����ؽ����
			count = pstmt.executeUpdate();// ����ִ�г���DQL�������е���� DML ���ص�����Ӱ�������
											// DCL��DDL��� ����ֵ��0

		
			if (count >= 1) {
				System.out.println("��ӵ�ַ�ɹ�!");
			} else {
				System.out.println("û������κε�ַ!");
			}
		} catch (SQLException e) {
			
			System.out.println("����ͨ���������Ʒ����ʧ��");
			e.printStackTrace();
			
			throw new Exception("��ַ���ʧ��");//�쳣ת��
		} finally {
			// 5.�ر�
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
		// 3.����ͨ��
		try {
			stmt = conn.createStatement();
			// 4.ִ�в����ؽ����
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
			System.out.println("����ͨ�����ѯ�����ʧ��");
			e.printStackTrace();
			
			throw new Exception("��ѯ��ַʧ��!");
			
		} finally {
			// 5.�ر�
			ConnectOracle.closeConnection(rs, stmt, conn);
		}

		return list;
	}

	@Override
	public Address getOneByOid(int aid) throws Exception {

		Address address = new Address();
		// 3.����ͨ��
		String sql = "select * from address where aid=?";
		// �����һ��Ԥ�����ͨ�� �൱��IOͨ�� ��������������sql���
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// Ĭ�������ǹرյ� ����addCategory����һ����¼��ʱ�� ���Զ��ύ
		// ��������

		try {

			
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, aid);
			// 4.ִ�в����ؽ����
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
			
			System.out.println("����ͨ�����ѯ��ַʧ��");
			e.printStackTrace();
			
			throw new Exception("��ѯ��ַʧ��");//�쳣ת��
		} finally {
			// 5.�ر�
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
		// 3.����ͨ��
		try {
			stmt = conn.createStatement();
			// 4.ִ�в����ؽ����
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
			System.out.println("����ͨ�����ѯ�����ʧ��");
			e.printStackTrace();
			
			throw new Exception("��ѯ��ַʧ��!");
			
		} finally {
			// 5.�ر�
			ConnectOracle.closeConnection(rs, stmt, conn);
		}

		return list;
	}
	@Override
	public int deleteAddress(Address address) throws  Exception{
		
		System.out.println(address.getAid());
		int aid= address.getAid();
		int count = 0;
		// 3.����ͨ��
		String sql = "delete from address where aid="+aid;
		// �����һ��Ԥ�����ͨ�� �൱��IOͨ�� ��������������sql���
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			
			// 4.ִ�в����ؽ����
			count = pstmt.executeUpdate();// ����ִ�г���DQL�������е���� DML ���ص�����Ӱ�������
											// DCL��DDL��� ����ֵ��0
			
			if (count >= 1) {
				System.out.println("ɾ����ַ�ɹ�!");
			} else {
				System.out.println("û��ɾ���κε�ַ!");
			}
		} catch (SQLException e) {
			System.out.println("����ͨ����ɾ����ַʧ��");
			e.printStackTrace();
			throw new Exception("ɾ����ַʧ��");
		} finally {
			// 5.�ر�
			ConnectOracle.closeConnection(null, pstmt, conn);
		}

		return count;
	}

	
	@Override
	public Address getAddressById(int aid) throws Exception{
		Address address = new Address();

		// 3.����ͨ��
		String sql = "select * from address where aid="+aid;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);

			
			// 4.ִ�в����ؽ����
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
			System.out.println("����ͨ�����ѯ������Ʒ����ʧ��");
			e.printStackTrace();
			throw new Exception("��ѯ����һ����Ʒ����ʧ��");
		} finally {
			// 5.�ر�
			ConnectOracle.closeConnection(rs, pstmt, conn);
		}

		return address;
	}

	
	
	
	@Override
	public int updateAddress(Address address) throws Exception{
		int count = 0;
		// 3.����ͨ��
		String sql = "update address set aname=?,aprovince=?,acity=?,adetailed=?,aphone=? where aid=?";
		// �����һ��Ԥ�����ͨ�� �൱��IOͨ�� ��������������sql���
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
			// 4.ִ�в����ؽ����
			count = pstmt.executeUpdate();// ����ִ�г���DQL�������е���� DML ���ص�����Ӱ�������
											// DCL��DDL��� ����ֵ��0

			if (count >= 1) {
				System.out.println("�޸ĵ�ַ�ɹ�!");
			} else {
				System.out.println("û���޸��κε�ַ!");
			}
		} catch (SQLException e) {
			System.out.println("����ͨ�����޸ĵ�ַ");
			e.printStackTrace();
			throw new Exception("�޸�һ����ַʧ��");
			
		} finally {
			// 5.�ر�
			ConnectOracle.closeConnection(null, pstmt, conn);
		}

		return count;
	}

	
	

	/*@Override
	public int getTotalRecordCount(String sql) throws Exception{
		int totalRecordCount = -1;
		
		ResultSet rs = null;
		Statement stmt = null;
		// 3.����ͨ��
		try {
			stmt = conn.createStatement();
			// 4.ִ�в����ؽ����
			rs = stmt.executeQuery(sql);
		
			while (rs.next()) {
				
				totalRecordCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("����ͨ�����ѯ�����ʧ��");
			e.printStackTrace();
			
			throw new Exception("��ѯ�ܹ��ж�������¼ʧ��!");
			
		} finally {
			// 5.�ر�
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
