package jspbook.healthPlatform;

public class Gym {
	// 멤버변수 선언
	private int user_id;
	private int gym_id;
	private String gym_name;
	private String gym_address;
	
	public int getGym_id() {
		return gym_id;
	}
	public void setGym_id(int gym_id) {
		this.gym_id = gym_id;
	}
	public String getGym_name() {
		return gym_name;
	}
	public void setGym_name(String gym_name) {
		this.gym_name = gym_name;
	}
	public String getGym_address() {
		return gym_address;
	}
	public void setGym_address(String gym_address) {
		this.gym_address = gym_address;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
}

