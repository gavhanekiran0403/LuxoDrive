package com.luxodrive.model;

public class User {
    private int userId;
    private String fullName;
    private String phoneNo;
    private String email;
    private String password;
    private String confirmPassword;
    private String role;
    private String status;
	
    public User() {
		super();
		
	}

	public User(int userId, String fullName, String phoneNo, String email, String password, String confirmPassword,
			String role, String status) {
		super();
		this.userId = userId;
		this.fullName = fullName;
		this.phoneNo = phoneNo;
		this.email = email;
		this.password = password;
		this.confirmPassword = confirmPassword;
		this.role = role;
		this.status=status;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
	

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString(){
		return "User [userId=" + userId + ", fullName=" + fullName + ", phoneNo=" + phoneNo + ", email=" + email
				+ ", password=" + password + ", confirmPassword=" + confirmPassword + ", role=" + role + ", status="
				+ status +"]";
	}
}
