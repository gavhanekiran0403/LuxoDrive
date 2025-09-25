package com.luxodrive.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.luxodrive.jdbc.connection.DBConnection;
import com.luxodrive.model.BankAccount;
import com.luxodrive.model.Car;
import com.luxodrive.model.CarOwner;

public class CarOwnerOperation {

	public static List<CarOwner> getAllCarOwner() {
		
		List<CarOwner> carOwners = new ArrayList<CarOwner>();
		
		try(Connection conn = DBConnection.getConnection()) {
			
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM carowners o JOIN bankaccounts b  ON o.bank_acc_id = b.bank_acc_id");
			
			while(rs.next()) {
				
				BankAccount bankAccount = new BankAccount(
						rs.getInt("bank_acc_id"), 
						rs.getString("acc_holder_name"), 
						rs.getString("bank_name"), 
						rs.getString("account_no"), 
						rs.getString("ifsc_no"));
				
				CarOwner carOwner = new CarOwner(
					    rs.getInt("owner_id"),
					    rs.getString("owner_name"),
					    rs.getString("phone_no"),
					    rs.getString("email"),
					    rs.getString("address"),
					    rs.getBytes("aadhar_image"),
					    bankAccount
					);
				carOwners.add(carOwner);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return carOwners;
	}
	
	public static int addOrUpdate(CarOwner carOwner) {
		
		if(carOwner.getOwnerId() == 0) {
			return addCarOwner(carOwner);
		}else {
			return updateCarOwner(carOwner);
		}
	}

	public static int addCarOwner(CarOwner carOwner) {
		
		int row = 0;
		try(Connection conn = DBConnection.getConnection()){
			String query = "INSERT INTO carowners(owner_name, phone_no, email, address, aadhar_image,bank_acc_id) VALUES(?,?,?,?,?,?)";
			PreparedStatement psmt = conn.prepareStatement(query);
			
			psmt.setString(1, carOwner.getOwnerName());
			psmt.setString(2, carOwner.getPhoneNo());
			psmt.setString(3, carOwner.getEmail());
			psmt.setString(4, carOwner.getAddress());
			psmt.setBytes(5, carOwner.getAadharImage());
			psmt.setInt(6, carOwner.getBankAccount().getBankAccId());
			
			row = psmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return row;
	}
	
	public static int updateCarOwner(CarOwner carOwner) {
		
		int row = 0;
		try(Connection conn = DBConnection.getConnection()){
			String query = "UPDATE carowners SET owner_name = ?, phone_no = ?, email = ?, address = ?, aadhar_image = ?, bank_acc_id = ? WHERE owner_id = ?";
			PreparedStatement psmt = conn.prepareStatement(query);
			
			psmt.setString(1, carOwner.getOwnerName());
			psmt.setString(2, carOwner.getPhoneNo());
			psmt.setString(3, carOwner.getEmail());
			psmt.setString(4, carOwner.getAddress());
			psmt.setBytes(5, carOwner.getAadharImage());
			psmt.setInt(6, carOwner.getBankAccount().getBankAccId());
			psmt.setInt(7, carOwner.getOwnerId());
			
			row = psmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return row;
	}
	
	public static CarOwner getCarOwnerById(int ownerId) {
		
		CarOwner carOwner = null;
		try(Connection conn = DBConnection.getConnection()){
			String query = "SELECT * FROM carowners o JOIN bankaccounts b  ON o.bank_acc_id = b.bank_acc_id WHERE o.owner_id = ?";
			PreparedStatement psmt = conn.prepareStatement(query);
			psmt.setInt(1, ownerId);
			ResultSet rs=  psmt.executeQuery();
			
			while(rs.next()) {
				
				BankAccount bankAccount = new BankAccount(
						rs.getInt("bank_acc_id"), 
						rs.getString("acc_holder_name"), 
						rs.getString("bank_name"), 
						rs.getString("account_no"), 
						rs.getString("ifsc_no"));
				
				carOwner = new CarOwner(
					    rs.getInt("owner_id"),
					    rs.getString("owner_name"),
					    rs.getString("phone_no"),
					    rs.getString("email"),
					    rs.getString("address"),
					    rs.getBytes("aadhar_image"),
					    bankAccount
					);
				
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return carOwner;
	}
	
	public static int deleteCarOwner(int ownerId) {
		int row = 0;
		try(Connection conn = DBConnection.getConnection()){
			String query = "DELETE FROM carowners WHERE owner_id = ?";
			PreparedStatement psmt = conn.prepareStatement(query);
			psmt.setInt(1, ownerId);
			row = psmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return row;
	}
}
