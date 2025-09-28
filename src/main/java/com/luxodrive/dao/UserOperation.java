package com.luxodrive.dao;

import com.luxodrive.model.User;
import com.luxodrive.jdbc.connection.DBConnection;
import com.luxodrive.model.Login;

import java.sql.*;

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

	public static User getUserById(int userId) {
	
		return null;
	}

    // Fetch all users (for admin dashboard)
//    public List<User> getAllUsers() {
//        List<User> list = new ArrayList<>();
//        try (Connection con = DBConnection.getConnection()) {
//            String sql = "SELECT * FROM users";
//            PreparedStatement ps = con.prepareStatement(sql);
//            ResultSet rs = ps.executeQuery();
//
//            while (rs.next()) {
//                User u;
//                String role = rs.getString("role");
//                if ("admin".equalsIgnoreCase(role)) {
//                    u = new Admin();
//                } else {
//                    u = new User();
//                }
//                u.setId(rs.getInt("user_id"));
//                u.setFullName(rs.getString("full_name"));
//                u.setPhone(rs.getString("phone_no"));
//                u.setEmail(rs.getString("email"));
//                u.setRole(role);
//                list.add(u);
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return list;
//    }
}