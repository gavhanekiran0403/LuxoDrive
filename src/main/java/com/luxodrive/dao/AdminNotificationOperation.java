package com.luxodrive.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.luxodrive.jdbc.connection.DBConnection;
import com.luxodrive.model.AdminNotification;
import com.luxodrive.model.Booking;
import com.luxodrive.model.User;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class AdminNotificationOperation {

    public static AdminNotification getByBookingId(int bookingId) {
        AdminNotification notification = null;
        String sql = "SELECT notification_id, message, is_read, created_at FROM adminnotification WHERE booking_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, bookingId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                notification = new AdminNotification();
                notification.setNotificationId(rs.getInt("notification_id"));
                notification.setMessage(rs.getString("message"));
                notification.setIsRead(rs.getString("is_read"));
                notification.setCreatedAt(rs.getTimestamp("created_at"));
                
                User user = new User();
                user.setUserId(rs.getInt("user_id"));
                notification.setUser(user);
                
                Booking booking = new Booking();
                booking.setBookingId(bookingId);
                notification.setBooking(booking);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return notification;
    }
    
    public static int addNotification(AdminNotification notification) {
        String sql = "INSERT INTO adminnotifications (user_id, booking_id, message,is_read) VALUES (?, ?, ?,false)";
        int row = 0;
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement psmt = conn.prepareStatement(sql)) {

        	psmt.setInt(1, notification.getUser().getUserId());
        	psmt.setInt(2, notification.getBooking().getBookingId());
        	psmt.setString(3, notification.getMessage());

            row = psmt.executeUpdate();
           
        } catch (Exception e) {
            e.printStackTrace();
        }
        return row;
    }
    
    public static List<AdminNotification> getLatestNotificationsByUserId(int userId) {
        List<AdminNotification> notifications = new ArrayList<>();
        String sql = "SELECT * FROM adminnotifications WHERE user_id = ? ORDER BY created_at DESC LIMIT 1";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement psmt = conn.prepareStatement(sql)) {

        	psmt.setInt(1, userId);

            ResultSet rs = psmt.executeQuery();
            while (rs.next()) {
            	
            	User user = UserOperation.getUserById(userId);
                
                int bookingId = rs.getInt("booking_id");
                Booking booking = BookingOpeartion.getBookingById(bookingId);
                
                AdminNotification notification = new AdminNotification();
                notification.setNotificationId(rs.getInt("notification_id"));
                notification.setMessage(rs.getString("message"));
                notification.setCreatedAt(rs.getTimestamp("created_at"));
                notification.setIsRead((rs.getString("is_read")));
                notification.setUser(user);
                notification.setBooking(booking);

                notifications.add(notification);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return notifications;
    }
}
