package com.luxodrive.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.luxodrive.jdbc.connection.DBConnection;
import com.luxodrive.model.BankAccount;
import com.luxodrive.model.Driver;


public class DriverOperation {

	public static List<Driver> getAllDrivers() {
		
		List<Driver> drivers = new ArrayList<Driver>();
		
		try(Connection conn = DBConnection.getConnection()){
			Statement stmt = conn.createStatement();
			
			while(rs.next()) {
				
				  Driver driver = new Driver( 
						 rs.getInt("driver_id"),
						 rs.getString("full_name"), 
						 rs.getString("license_no"),
						 rs.getString("phone_no"), 
						 rs.getString("email"), 
						 rs.getString("address") );
				  drivers.add(driver);
				 
			}

			ResultSet rs =stmt.executeQuery("SELECT d.driver_id, d.full_name, d.license_no, d.phone_no, d.email, d.address, " +
	                "b.bank_acc_id,b.acc_holder_name, b.bank_name, b.account_no, b.ifsc_no " +
	                "FROM drivers d " +
	                "JOIN bankaccounts b ON d.bank_acc_id = b.bank_acc_id");
			while (rs.next()) {
				
				BankAccount bankAccount = new BankAccount(
				rs.getInt("bank_acc_id"),
				rs.getString("acc_holder_name"),
				rs.getString("bank_name"),
				rs.getString("account_no"),
				rs.getString("ifsc_no")
			);
				
				
				Driver driver = new Driver(
		                rs.getInt("driver_id"),
		                rs.getString("full_name"),
		                rs.getString("license_no"),
		                rs.getString("phone_no"),
		                rs.getString("email"),
		                rs.getString("address"),
		                bankAccount
		            );
		            drivers.add(driver);
		        }
			
			
	} catch (Exception e) {
        e.printStackTrace();
	}

    return drivers;
}
	public static int addOrUpdateDriver(Driver driver) {
		if(driver.getDriverId() == 0) {
			return addDrivers(driver);
		}else {
			return updateDriver(driver);
		}
		
		
	}
	
	public static int addDrivers(Driver driver) {

		int row = 0;
		try (Connection conn = DBConnection.getConnection()) {

			String query = "INSERT INTO drivers(driver_id,full_name,license_no,phone_no,email,address,bank_acc_id) VALUES(?,?,?,?,?,?,?)";
			PreparedStatement psmt = conn.prepareStatement(query);

			psmt.setInt(1, driver.getDriverId());
			psmt.setString(2, driver.getFullName());
			psmt.setString(3, driver.getLicenseNo());
			psmt.setString(4, driver.getPhoneNo());
			psmt.setString(5, driver.getEmail());
			psmt.setString(6, driver.getAddress());
			psmt.setInt(7, driver.getBankAccount().getBankAccId());
			
			row = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return row;
	}
	public static Driver getDriverById(int driverId) {
	    Driver driver = null;
	    try (Connection conn = DBConnection.getConnection()) {
	        String query = ("SELECT d.driver_id, d.full_name, d.license_no, d.phone_no, d.email, d.address, " +
	                "b.bank_acc_id,b.acc_holder_name, b.bank_name, b.account_no, b.ifsc_no " +
	                "FROM drivers d " +
	                "JOIN bankaccounts b ON d.bank_acc_id = b.bank_acc_id where d.driver_id = ?");
	        PreparedStatement psmt = conn.prepareStatement(query);
	        psmt.setInt(1, driverId);
	        ResultSet rs = psmt.executeQuery();
	        
	        if (rs.next()) {
	        	
	        	BankAccount bankAccount = new BankAccount(
	    				rs.getInt("bank_acc_id"),
	    				rs.getString("acc_holder_name"),
	    				rs.getString("bank_name"),
	    				rs.getString("account_no"),
	    				rs.getString("ifsc_no")
	    			);
	        	
	            driver = new Driver(
	                rs.getInt("driver_id"),
	                rs.getString("full_name"),
	                rs.getString("license_no"),
	                rs.getString("phone_no"),
	                rs.getString("email"),
	                rs.getString("address"),
	                bankAccount
	            );
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return driver;
	}
	public static int updateDriver(Driver driver) {
	    int row = 0;
	    try (Connection conn = DBConnection.getConnection()) {
	        
	        String query = "UPDATE drivers SET full_name = ?, license_no = ?, phone_no = ?, email = ?, address = ?, bank_acc_id = ? WHERE driver_id = ?";
	        PreparedStatement psmt = conn.prepareStatement(query);

	        psmt.setString(1, driver.getFullName());
	        psmt.setString(2, driver.getLicenseNo());
	        psmt.setString(3, driver.getPhoneNo());
	        psmt.setString(4, driver.getEmail());
	        psmt.setString(5, driver.getAddress());
	        psmt.setInt(6, driver.getBankAccount().getBankAccId());
	        psmt.setInt(7, driver.getDriverId());
	        
	        row = psmt.executeUpdate();
	        
	        System.out.println(" Driver updated: " + driver.getDriverId() + " -> " + driver.getFullName());

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    return row;
	}
	public static int deleteDriver(int driverId) {
	    int row = 0;
	    try (Connection conn = com.luxodrive.jdbc.connection.DBConnection.getConnection()) {
	        String query = "DELETE FROM drivers WHERE driver_id = ?";
	        PreparedStatement psmt = conn.prepareStatement(query);
	        psmt.setInt(1, driverId);
	        row = psmt.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return row;
	}
}

