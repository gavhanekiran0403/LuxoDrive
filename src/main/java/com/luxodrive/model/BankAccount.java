package com.luxodrive.model;

public class BankAccount {

	private int bankAccId;
	private String accHolderName;
	private String bankName;
	private String accountNo;
	private String ifscNo;
	
	public BankAccount() {
		super();
		
	}

	public BankAccount(int bankAccId, String accHolderName, String bankName, String accountNo, String ifscNo) {
		super();
		this.bankAccId = bankAccId;
		this.accHolderName = accHolderName;
		this.bankName = bankName;
		this.accountNo = accountNo;
		this.ifscNo = ifscNo;
	}

	public int getBankAccId() {
		return bankAccId;
	}

	public void setBankAccId(int bankAccId) {
		this.bankAccId = bankAccId;
	}

	public String getAccHolderName() {
		return accHolderName;
	}

	public void setAccHolderName(String accHolderName) {
		this.accHolderName = accHolderName;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}

	public String getIfscNo() {
		return ifscNo;
	}

	public void setIfscNo(String ifscNo) {
		this.ifscNo = ifscNo;
	}

	@Override
	public String toString() {
		return "BankAccount [bankAccId=" + bankAccId + ", accHolderName=" + accHolderName + ", bankName=" + bankName
				+ ", accountNo=" + accountNo + ", ifscNo=" + ifscNo + "]";
	}

}
