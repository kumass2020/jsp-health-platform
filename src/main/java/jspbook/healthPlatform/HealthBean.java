package jspbook.healthPlatform;

import java.sql.*;
import java.util.*;

import jspbook.healthPlatform.User;

public class HealthBean {
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	//	MySQL 연결정보
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://localhost:3306/jdbc_db";
	
	// 데이터베이스 연결 메서드
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
	
	public boolean updateUserDB(User user) {
		connect();
		
		String sql = "update user set user_name=?, user_email=?, user_birth=?,"
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
	
	public boolean insertUserDB(User user) {
		connect();
		// sql 문자열, gb_id는 자동 등록되므로 입력하지 않는다.
		
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
	
	public User getUserDB(int gb_id) {
		connect();
		
		String sql = "select * from user where user_id=?";
		User user = new User();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, gb_id);
			ResultSet rs = pstmt.executeQuery();
			
			// 데이터가 하나만 있으므로 rs.next()를 한번만 실행한다.
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
	
	public boolean updateGymDB(Gym gym) {
		connect();
		
		String sql = "update gym set gym_name=?, gym_address=?, user_id=?, where gym_id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, gym.getGym_name());
			pstmt.setString(2, gym.getGym_address());
			pstmt.setInt(3, gym.getUser_id());
			pstmt.setInt(4, gym.getGym_id());
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
	
	public boolean deleteGymDB(int gb_id) {
		connect();
		
		String sql = "delete from gym where gym_id=?";
		
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
	
	public boolean insertGymDB(Gym gym) {
		connect(); 
		// sql 문자열, gb_id는 자동 등록되므로 입력하지 않는다.
		
		String sql="insert into gym(gym_name, gym_address, user_id) values(?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, gym.getGym_name());
			pstmt.setString(2, gym.getGym_address());
			pstmt.setInt(3, gym.getUser_id());
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
	
	public Gym getGymDB(int gb_id) {
		connect();
		
		String sql = "select * from gym where gym_id=?";
		Gym gym = new Gym();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, gb_id);
			ResultSet rs = pstmt.executeQuery();
			
			// 데이터가 하나만 있으므로 rs.next()를 한번만 실행한다.
			rs.next();
			gym.setGym_id(rs.getInt("gym_id"));
			gym.setGym_name(rs.getString("gym_name"));
			gym.setGym_address(rs.getString("gym_address"));
			gym.setUser_id(rs.getInt("user_id"));
			rs.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return gym;
	}
	
	public ArrayList<Gym> getGymDBList() {
		connect();
		ArrayList<Gym> datas = new ArrayList<Gym>();
		
		String sql = "select * from gym order by gym_id desc";
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				Gym gym = new Gym();
				
				gym.setGym_id(rs.getInt("gym_id"));
				gym.setGym_name(rs.getString("gym_name"));
				gym.setGym_address(rs.getString("gym_address"));
				gym.setUser_id(rs.getInt("user_id"));
				datas.add(gym);
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
