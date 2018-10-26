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
		// 3.����ͨ��
		String sql = "insert into category2 values(seq_category.nextval,?,?,?)";
		// �����һ��Ԥ�����ͨ�� �൱��IOͨ�� ��������������sql���
		PreparedStatement pstmt = null;

		// Ĭ�������ǹرյ� ����addCategory����һ����¼��ʱ�� ���Զ��ύ
		// ��������

		try {

			// conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, category.getCname());
			pstmt.setString(2, category.getCdesc());
			pstmt.setInt(3, category.getFid());
			// 4.ִ�в����ؽ����
			count = pstmt.executeUpdate();// ����ִ�г���DQL�������е���� DML ���ص�����Ӱ�������
											// DCL��DDL��� ����ֵ��0

		
			if (count >= 1) {
				System.out.println("��Ӷ�����Ʒ����ɹ�!");
			} else {
				System.out.println("û������κ���Ʒ����!");
			}
		} catch (SQLException e) {
			
			System.out.println("����ͨ���������Ʒ����ʧ��");
			e.printStackTrace();
			
			throw new Exception("��Ӷ�����Ʒ����ʧ��");
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
		// 3.����ͨ��s
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
			ConnOracleDataSource.closeConnection(rs,stmt,conn);
		}

		return totalRecordCount;
	}
	@Override
	//ֻ�ǲ������Ʒ��
	public List<Category2> getPageByQueryOnly2(String sql) throws Exception {

		List<Category2> list = new ArrayList<Category2>();
		Category2 category = null;
		Category categoryparent = null;
		ResultSet rs = null;
		Statement stmt = null;
		// 3.����ͨ��
		try {
			stmt = conn.createStatement();
			// 4.ִ�в����ؽ����
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
			System.out.println("����ͨ�����ѯ�����ʧ��");
			e.printStackTrace();
			
			throw new Exception("��ѯ������Ʒ����ʧ��!");
			
		} finally {
			// 5.�ر�
			ConnOracleDataSource.closeConnection(rs, stmt, conn);
		}

		return list;
	}

	@Override
	//һ����Ʒ��������Ʒ�����һ�����ϱ�
	public List<Category2> getPageByQuery(String sql) throws Exception {

		List<Category2> list = new ArrayList<Category2>();
		Category2 category = null;
		Category categoryparent = null;
		ResultSet rs = null;
		Statement stmt = null;
		// 3.����ͨ��
		try {
			stmt = conn.createStatement();
			// 4.ִ�в����ؽ����
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
			System.out.println("����ͨ�����ѯ�����ʧ��");
			e.printStackTrace();
			
			throw new Exception("��ѯ������Ʒ����ʧ��!");
			
		} finally {
			// 5.�ر�
			ConnOracleDataSource.closeConnection(rs, stmt, conn);
		}

		return list;
	}

	@Override
	public int deleteCategory(Category2 category) throws Exception {
		int count = 0;
		// 3.����ͨ��
		String sql = "delete from category2 where sid=?";
		// �����һ��Ԥ�����ͨ�� �൱��IOͨ�� ��������������sql���
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, category.getCid());
			
			// 4.ִ�в����ؽ����
			count = pstmt.executeUpdate();// ����ִ�г���DQL�������е���� DML ���ص�����Ӱ�������
											// DCL��DDL��� ����ֵ��0
			
			if (count >= 1) {
				System.out.println("ɾ����Ʒ����ɹ�!");
			} else {
				System.out.println("û��ɾ���κ���Ʒ����!");
			}
		} catch (SQLException e) {
			System.out.println("����ͨ����ɾ����Ʒ����ʧ��");
			e.printStackTrace();
			throw new Exception("ɾ��������Ʒʧ��");
		} finally {
			ConnOracleDataSource.closeConnection(null,pstmt,conn);
		}

		return count;
	}

	@Override
	public Category2 getCategoryById(int id) throws Exception {
		Category2 category = null;
		Category categoryparent = null;
		// 3.����ͨ��
		String sql = "select * from  category2 c2  inner join category c1  ON ��c2.fid=c1.cid�� where sid=?";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, id);
			// 4.ִ�в����ؽ����
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
			System.out.println("����ͨ�����ѯ������Ʒ����ʧ��");
			e.printStackTrace();
			throw new Exception("��ѯ������Ʒʧ��");
		} finally {
			ConnOracleDataSource.closeConnection(rs,pstmt,conn);
		}

		return category;
	}

	@Override
	public int updateCategory(Category2 category) throws Exception {
		int count = 0;
		// 3.����ͨ��
		String sql = "update category2 set sname=?,sdesc=?,fid=? where sid=?";
		// �����һ��Ԥ�����ͨ�� �൱��IOͨ�� ��������������sql���
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, category.getCname());
			pstmt.setString(2, category.getCdesc());
			pstmt.setInt(3, category.getFid());
			pstmt.setInt(4, category.getCid());
			// 4.ִ�в����ؽ����
			count = pstmt.executeUpdate();// ����ִ�г���DQL�������е���� DML ���ص�����Ӱ�������
											// DCL��DDL��� ����ֵ��0

			if (count >= 1) {
				System.out.println("�޸���Ʒ����ɹ�!");
			} else {
				System.out.println("û���޸��κ���Ʒ����!");
			}
		} catch (SQLException e) {
			System.out.println("����ͨ�����޸���Ʒ����ʧ��");
			e.printStackTrace();
			throw new Exception("�޸ĵ�����Ʒʧ��");
		} finally {
			ConnOracleDataSource.closeConnection(null,pstmt,conn);
		}

		return count;
	}
	
}
