//pojo cls
package com.luxodrive.model;

public class Driver {

	private int driverId;
	private String fullName;
	private String licenseNo;
	private String phoneNo;
	private String email;
	private String address;
	private BankAccount bankAccount;
	
	public Driver() {
		super();

	}

	public Driver(int driverId, String fullName, String licenseNo, String phoneNo, String email, String address, BankAccount bankAccount) {
		super();
		this.driverId = driverId;
		this.fullName = fullName;
		this.licenseNo = licenseNo;
		this.phoneNo = phoneNo;
		this.email = email;
		this.address = address;
		this.bankAccount = bankAccount;
	}

	public int getDriverId() {
		return driverId;
	}

	public void setDriverId(int driverId) {
		this.driverId = driverId;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getLicenseNo() {
		return licenseNo;
	}

	public void setLicenseNo(String licenseNo) {
		this.licenseNo = licenseNo;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	public BankAccount getBankAccount() {
		return bankAccount;
	}

	public void setBankAccount(BankAccount bankAccount) {
		this.bankAccount = bankAccount;
	}

	@Override
	public String toString() {
		return "Driver [driverId=" + driverId + ", fullName=" + fullName + ", licenseNo=" + licenseNo + ", phoneNo="
				+ phoneNo + ", email=" + email + ", address=" + address + ", bankAccount="
						+ bankAccount + "]";
	}
	
}
