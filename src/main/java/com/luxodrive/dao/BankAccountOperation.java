package com.luxodrive.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.luxodrive.jdbc.connection.DBConnection;
import com.luxodrive.model.BankAccount;

public class BankAccountOperation {

	public static List<BankAccount> getAllBankAccount() {
		
		List<BankAccount> bankAccounts = new ArrayList<BankAccount>();
		
		try(Connection conn = DBConnection.getConnection()) {
			
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM bankaccounts");
			
			while(rs.next()) {
				
				BankAccount bankAccount = new BankAccount(
						rs.getInt("bank_acc_id"), 
						rs.getString("acc_holder_name"), 
						rs.getString("bank_name"), 
						rs.getString("account_no"), 
						rs.getString("ifsc_no"));
				
				bankAccounts.add(bankAccount);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return bankAccounts;
	}

	public static int addBankAccount(BankAccount bankAccount) {
		
		int generatedId = 0;
		try(Connection conn = DBConnection.getConnection()){
			String query = "INSERT INTO bankaccounts(acc_holder_name,bank_name, account_no, ifsc_no) VALUES(?,?,?,?)";
			
			PreparedStatement psmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
			
			psmt.setString(1, bankAccount.getAccHolderName());
			psmt.setString(2, bankAccount.getBankName());
			psmt.setString(3, bankAccount.getAccountNo());
			psmt.setString(4, bankAccount.getIfscNo());
			
			int row = psmt.executeUpdate();
			
			if (row > 0) {
	            try (ResultSet rs = psmt.getGeneratedKeys()) {
	                if (rs.next()) {
	                    generatedId = rs.getInt(1);
	                    bankAccount.setBankAccId(generatedId);
	                }
	            }
	        }
		}catch (Exception e) {
			e.printStackTrace();
		}
		return generatedId;
	}
	
	public static int updateBankAccount(BankAccount bankAccount) {
		
		int row = 0;
		try(Connection conn = DBConnection.getConnection()){
			String query = "UPDATE bankaccounts SET acc_holder_name=?, bank_name = ?, account_no = ?, ifsc_no =? WHERE bank_acc_id = ?";
			PreparedStatement psmt = conn.prepareStatement(query);
			
			psmt.setString(1, bankAccount.getAccHolderName());
			psmt.setString(2, bankAccount.getBankName());
			psmt.setString(3, bankAccount.getAccountNo());
			psmt.setString(4, bankAccount.getIfscNo());
			psmt.setInt(5, bankAccount.getBankAccId());
			
			row = psmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return row;
	}
	
	public static BankAccount getBankAccountById(int bankAccId) {
		
		BankAccount bankAccount = null;
		try(Connection conn = DBConnection.getConnection()){
			String query = "SELECT * FROM bankaccounts WHERE bank_acc_id = ?";
			PreparedStatement psmt = conn.prepareStatement(query);
			psmt.setInt(1, bankAccId);
			ResultSet rs=  psmt.executeQuery();
			
			while(rs.next()) {
				
				bankAccount = new BankAccount(
						rs.getInt("bank_acc_id"), 
						rs.getString("acc_holder_name"), 
						rs.getString("bank_name"), 
						rs.getString("account_no"), 
						rs.getString("ifsc_no"));
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return bankAccount;
	}
	
	public static int deleteBankAccount(int bankAccId) {
		int row = 0;
		try(Connection conn = DBConnection.getConnection()){
			String query = "DELETE FROM bankaccounts WHERE bank_acc_id = ?";
			PreparedStatement psmt = conn.prepareStatement(query);
			psmt.setInt(1, bankAccId);
			row = psmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return row;
	}
}
