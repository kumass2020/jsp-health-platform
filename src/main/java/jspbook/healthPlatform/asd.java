import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public boolean updateReservationDB(Reservation reservation) {
		connect();
		
		String sql = "update reservation set reservation_time=?, gym_id=?, user_id=?, where reservation_id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reservation.getReservation_time());
			pstmt.setInt(2, reservation.getGym_id());
			pstmt.setInt(3, reservation.getUser_id());
			pstmt.setInt(4, reservation.getReservation_id());
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
	
	public boolean deleteReservationDB(int gb_id) {
		connect();
		
		String sql = "delete from reservation where reservation_id=?";
		
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
	
	public boolean insertReservationDB(Reservation reservation) {
		connect(); 
		// sql 문자열, gb_id는 자동 등록되므로 입력하지 않는다.
		
		String sql="insert into reservation(reservation_time, gym_id, user_id) values(?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reservation.getReservation_time());
			pstmt.setString(2, reservation.getGym_id());
			pstmt.setInt(3, reservation.getUser_id());
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
	
	public Reservation getReservationDB(int gb_id) {
		connect();
		
		String sql = "select * from reservation where reservation_id=?";
		Reservation reservation = new Reservation();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, gb_id);
			ResultSet rs = pstmt.executeQuery();
			
			// 데이터가 하나만 있으므로 rs.next()를 한번만 실행한다.
			rs.next();
			reservation.setReservation_id(rs.getInt("reservation_id"));
			reservation.setReservation_time(rs.getString("reservation_time"));
			reservation.setGym_id(rs.getString("gym_id"));
			reservation.setUser_id(rs.getInt("user_id"));
			rs.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return reservation;
	}
	
	public ArrayList<Reservation> getReservationDBList() {
		connect();
		ArrayList<Reservation> datas = new ArrayList<Reservation>();
		
		String sql = "select * from reservation order by reservation_id desc";
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				Reservation reservation = new Reservation();
				
				reservation.setReservation_id(rs.getInt("reservation_id"));
				reservation.setReservation_time(rs.getString("reservation_time"));
				reservation.setGym_id(rs.getString("gym_id"));
				reservation.setUser_id(rs.getInt("user_id"));
				datas.add(reservation);
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