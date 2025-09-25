package com.luxodrive.model;

import java.util.Arrays;
import java.util.List;

public class CarOwner {

	private int ownerId;
	private String ownerName;
	private String phoneNo;
	private String email;
	private String address;
	private byte[] aadharImage;
	private BankAccount bankAccount;
	
	public CarOwner() {
		super();
		
	}

	public CarOwner(int ownerId, String ownerName, String phoneNo, String email, String address, byte[] aadharImage,
			BankAccount bankAccount) {
		super();
		this.ownerId = ownerId;
		this.ownerName = ownerName;
		this.phoneNo = phoneNo;
		this.email = email;
		this.address = address;
		this.aadharImage = aadharImage;
		this.bankAccount = bankAccount;
	}

	public int getOwnerId() {
		return ownerId;
	}

	public void setOwnerId(int ownerId) {
		this.ownerId = ownerId;
	}

	public String getOwnerName() {
		return ownerName;
	}

	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
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

	public byte[] getAadharImage() {
		return aadharImage;
	}

	public void setAadharImage(byte[] aadharImage) {
		this.aadharImage = aadharImage;
	}

	public BankAccount getBankAccount() {
		return bankAccount;
	}

	public void setBankAccount(BankAccount bankAccount) {
		this.bankAccount = bankAccount;
	}
	
	@Override
	public String toString() {
		return "CarOwner [ownerId=" + ownerId + ", ownerName=" + ownerName + ", phoneNo=" + phoneNo + ", email=" + email
				+ ", address=" + address + ", aadharImage=" + Arrays.toString(aadharImage) + ", bankAccount="
				+ bankAccount + "]";
	}
	
}
