package jspbook.healthPlatform;

import java.sql.*;
import java.util.*;

import jspbook.healthPlatform.User;

public class HealthBean {
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	//	MySQL ��������
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://localhost:3306/jdbc_db";
	
	// �����ͺ��̽� ���� �޼���
	void connect() {
		try {
			Class.forName(jdbc_driver);
			
			conn = DriverManager.getConnection(jdbc_url, "root", "8820");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	void disconnect() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		if(conn != null) {
			try {
				conn.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	// ������ �ּҷ� ���� ������ ���� �޼���
	public boolean updateUserDB(User user) {
		connect();
		
		String sql = "update User set user_name=?, user_email=?, user_birth=?,"
				+ "user_phone_num=?, user_memo=? where user_id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUser_name());
			pstmt.setString(2, user.getUser_email());
			pstmt.setString(3, user.getUser_birth());
			pstmt.setString(4, user.getUser_phone_num());
			pstmt.setString(5, user.getUser_memo());
			pstmt.setInt(6, user.getUser_id());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			disconnect();
		}
		return true;
	}
	
	// Ư�� �ּҷ� �Խñ� ���� �޼���
	public boolean deleteUserDB(int gb_id) {
		connect();
		
		String sql = "delete from user where user_id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, gb_id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			disconnect();
		}
		return true;
	}
	
	// �ű� �ּҷ� �޽��� �߰� �޼���
	public boolean insertUserDB(User user) {
		connect();
		// sql ���ڿ�, gb_id�� �ڵ� ��ϵǹǷ� �Է����� �ʴ´�.
		
		String sql="insert into user(user_name, user_email, user_birth, user_phone_num, user_memo) values(?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUser_name());
			pstmt.setString(2, user.getUser_email());
			pstmt.setString(3, user.getUser_birth());
			pstmt.setString(4, user.getUser_phone_num());
			pstmt.setString(5, user.getUser_memo());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			disconnect();
		}
		return true;
	}
	
	// Ư�� �ּҷ� �Խñ� �������� �޼���
	public User getUserDB(int gb_id) {
		connect();
		
		String sql = "select * from user where user_id=?";
		User user = new User();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, gb_id);
			ResultSet rs = pstmt.executeQuery();
			
			// �����Ͱ� �ϳ��� �����Ƿ� rs.next()�� �ѹ��� �����Ѵ�.
			rs.next();
			user.setUser_id(rs.getInt("user_id"));
			user.setUser_name(rs.getString("user_name"));
			user.setUser_email(rs.getString("user_email"));
			user.setUser_birth(rs.getString("user_birth"));
			user.setUser_phone_num(rs.getString("user_phone_num"));
			user.setUser_memo(rs.getString("user_memo"));
			rs.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return user;
	}
	
	// ��ü �ּҷ� ����� �������� �޼���
	public ArrayList<User> getUserDBList() {
		connect();
		ArrayList<User> datas = new ArrayList<User>();
		
		String sql = "select * from user order by user_id desc";
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				User user = new User();
				
				user.setUser_id(rs.getInt("user_id"));
				user.setUser_name(rs.getString("user_name"));
				user.setUser_email(rs.getString("user_email"));
				user.setUser_birth(rs.getString("user_birth"));
				user.setUser_phone_num(rs.getString("user_phone_num"));
				user.setUser_memo(rs.getString("user_memo"));
				datas.add(user);
			}
			rs.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return datas;
	}
	
	
}
