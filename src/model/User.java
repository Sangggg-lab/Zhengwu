package model;

public class User {
	private String username;
	private String password;
	
	public User() {
		super();
	}
	
	public User(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}
	
	public String getUserName() {
		return username;
	}
	public void setUserName(String username) {
		this.username = username;
	}
	public String getPassWord() {
		return password;
	}
	public void setPassWord(String password) {
		this.password = password;
	}
}
