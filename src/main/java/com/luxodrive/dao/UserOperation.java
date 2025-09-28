package com.luxodrive.dao;

import com.luxodrive.model.User;
import com.luxodrive.jdbc.connection.DBConnection;
import com.luxodrive.model.Login;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserOperation {

    // Register a new user
    public static  int registerUser(User user) {
    	int row = 0;
        try (Connection con = DBConnection.getConnection()) {
        	String sql = "INSERT INTO users(full_name, phone_no, email, password, confirmpassword, role, status) VALUES(?,?,?,?,?,?,?)";
        	PreparedStatement ps = con.prepareStatement(sql);

        	ps.setString(1, user.getFullName());
        	ps.setString(2, user.getPhoneNo());
        	ps.setString(3, user.getEmail());
        	ps.setString(4, user.getPassword());
        	ps.setString(5, user.getConfirmPassword());
        	ps.setString(6, user.getRole() != null ? user.getRole() : "user");
        	ps.setString(7, user.getStatus() != null ? user.getStatus() : "offline");

            row = ps.executeUpdate();
           

        } catch (Exception e) {
            e.printStackTrace();
         }
        return row ;
    }

    public static User login(Login login) {
        User user = null;
        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT * FROM users WHERE email=? AND password=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, login.getEmail());
            ps.setString(2, login.getPassword());

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
            	user= new User(
            			rs.getInt("user_id"), 
            			rs.getString("full_name"),
            			rs.getString("phone_no"),
            			rs.getString("email"), 
            			rs.getString("password"), 
            			rs.getString("confirmpassword"),
            			rs.getString("role"),
            			rs.getString("status")
            			);
            	
            	
              
                 
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public static List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT * FROM users";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                User user = new User(
                        rs.getInt("user_id"),
                        rs.getString("full_name"),
                        rs.getString("phone_no"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("confirmpassword"),
                        rs.getString("role"),
                        rs.getString("status")
                );
                users.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }
    
    public static boolean deleteUser(int userId) {
        boolean status = false;
        try (Connection con = DBConnection.getConnection()) {
            String sql = "DELETE FROM users WHERE user_id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);

            int rows = ps.executeUpdate();
            status = rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
}