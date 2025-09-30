package com.luxodrive.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.luxodrive.jdbc.connection.DBConnection;
import com.luxodrive.model.Driver;

public class DriverOperation {

	public static List<Driver> getAllDrivers() {
		
		List<Driver> drivers = new ArrayList<Driver>();
		
		try(Connection conn = DBConnection.getConnection()) {
			
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM drivers");
			
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
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return drivers;
	}
	
	public static int addOrUpdate(Driver diver) {
		
		if(diver != null) {
			return addDriver(diver);
		}else {
			return updateDriver(diver);
		}
	}
	
	public static int addDriver(Driver diver) {
		
		int row = 0;
		try(Connection conn = DBConnection.getConnection()){
			String query = "INSERT INTO drivers(full_name, license_no, phone_no, email, address) VALUES(?,?,?,?,?)";
			PreparedStatement psmt = conn.prepareStatement(query);
			
			psmt.setString(1, diver.getFullName());
			psmt.setString(2, diver.getLicenseNo());
			psmt.setString(3, diver.getPhoneNo());
			psmt.setString(4, diver.getEmail());
			psmt.setString(5, diver.getAddress());
			
			row = psmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return row;
	}
	
	public static int updateDriver(Driver diver) {
		
		return 0;
	}
}
