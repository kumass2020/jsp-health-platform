package jspbook.healthPlatform;

public class Time {
	// 멤버변수 선언
	private int user_id;
	private int time_id;
	private String time_start;
	private String time_duration;
	
	public int getTime_id() {
		return time_id;
	}
	public void setTime_id(int time_id) {
		this.time_id = time_id;
	}
	public String getTime_start() {
		return time_start;
	}
	public void setTime_start(String time_start) {
		this.time_start = time_start;
	}
	public String getTime_duration() {
		return time_duration;
	}
	public void setTime_duration(String time_start) {
		this.time_duration = time_start;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
}

