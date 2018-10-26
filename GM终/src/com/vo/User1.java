package com.vo;

//java     数据库
//1.类		表
//2.属性	        字段
public class User1 {

	private int userId;
	private String userName;
	private String password;
	private int isActive;
	private String nickName;
	private String address;
	private String confirmPass;
	private String phoneNumber;
	private String email;
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getIsActive() {
		return isActive;
	}
	public void setIsActive(int isActive) {
		this.isActive = isActive;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getConfirmPass() {
		return confirmPass;
	}
	public void setConfirmPass(String confirmPass) {
		this.confirmPass = confirmPass;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "User1 [userId=" + userId + ", userName=" + userName
				+ ", password=" + password + ", isActive=" + isActive
				+ ", nickName=" + nickName + ", address=" + address
				+ ", confirmPass=" + confirmPass + ", phoneNumber="
				+ phoneNumber + ", email=" + email + "]";
	}
	
	
	

}
