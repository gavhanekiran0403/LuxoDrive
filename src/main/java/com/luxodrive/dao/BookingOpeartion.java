package com.luxodrive.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.luxodrive.jdbc.connection.DBConnection;
import com.luxodrive.model.Booking;
import com.luxodrive.model.Car;
import com.luxodrive.model.User;

public class BookingOpeartion {

	public static List<Booking> getAllBookings(){
		
		List<Booking> bookings = new ArrayList<Booking>();
		
		try(Connection conn = DBConnection.getConnection()){
			String query = "SELECT * FROM bookings";
			PreparedStatement psmt = conn.prepareStatement(query);
			ResultSet rs =  psmt.executeQuery();
			while(rs.next()) {
				
				int userId = rs.getInt("user_id");
				User user = UserOperation.getUserById(userId);
						
				int carId = rs.getInt("car_id");
				Car car = CarOperation.getCarById(carId);
				
				Booking booking = new Booking(
						rs.getInt("booking_id"), 
						rs.getString("pickup_location"), 
						rs.getString("drop_location"), 
						rs.getString("pickup_date"), 
						rs.getString("pickup_Time"), 
						rs.getString("return_date"), 
						rs.getString("driving_option"), 
						rs.getDouble("total_amount"), 
						rs.getString("status"), 
						user, 
						car
						);
				bookings.add(booking);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return bookings;
	}
	
	public static int addBooking(Booking booking) {
		
		int row = 0;
		try(Connection conn = DBConnection.getConnection()){
			String query = "INSERT INTO bookings(pickup_location, drop_location, pickup_date, pickup_Time, return_date, "
					+ "driving_option, total_amount, status, user_id, car_id) values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement psmt = conn.prepareStatement(query);
			psmt.setString(1, booking.getPickupLocation());
			psmt.setString(2, booking.getDropLocation());
			psmt.setString(3, booking.getPickupDate());
			psmt.setString(4, booking.getPickupTime());
			psmt.setString(5, booking.getReturnDate());
			psmt.setString(6, booking.getDrivingOption());
			psmt.setDouble(7, booking.getTotalAmount());
			psmt.setString(8, booking.getStatus());
			psmt.setInt(9, booking.getUser().getUserId());
			psmt.setInt(10, booking.getCar().getCarId());
			
			row = psmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return row;
	}
	
	public static int updateBooking(Booking booking) {
		int row = 0;
		try(Connection conn = DBConnection.getConnection()){
			String query = "UPDATE bookings SET pickup_location = ?, drop_location = ?, pickup_date = ?, pickup_Time = ?, return_date = ?, "
					+ "driving_option = ?, total_amount = ?, status = ?, user_id = ?, car_id = ? WHERE booking_id = ?";
			PreparedStatement psmt = conn.prepareStatement(query);
			psmt.setString(1, booking.getPickupLocation());
			psmt.setString(2, booking.getDropLocation());
			psmt.setString(3, booking.getPickupDate());
			psmt.setString(4, booking.getPickupTime());
			psmt.setString(5, booking.getReturnDate());
			psmt.setString(6, booking.getDrivingOption());
			psmt.setDouble(7, booking.getTotalAmount());
			psmt.setString(8, booking.getStatus());
			psmt.setInt(9, booking.getUser().getUserId());
			psmt.setInt(10, booking.getCar().getCarId());
			psmt.setInt(11, booking.getBookingId());
			
			row = psmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return row;
	}
	
	public static Booking getBookingById(int bookingId){
		
		Booking booking = null;
		
		try(Connection conn = DBConnection.getConnection()){
			String query = "SELECT * FROM bookings WHERE booking_id = ?";
			PreparedStatement psmt = conn.prepareStatement(query);
			psmt.setInt(1, bookingId);
			ResultSet rs =  psmt.executeQuery();
			while(rs.next()) {
				
				int userId = rs.getInt("user_id");
				User user = UserOperation.getUserById(userId);
						
				int carId = rs.getInt("car_id");
				Car car = CarOperation.getCarById(carId);
				
				booking = new Booking(
						rs.getInt("booking_id"), 
						rs.getString("pickup_location"), 
						rs.getString("drop_location"), 
						rs.getString("pickup_date"), 
						rs.getString("pickup_Time"), 
						rs.getString("return_date"), 
						rs.getString("driving_option"), 
						rs.getDouble("total_amount"), 
						rs.getString("status"), 
						user, 
						car
						);
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return booking;
	}
	
	public static int deleteBooking(int bookingId) {
		int row = 0;
		try (Connection conn = DBConnection.getConnection()) {
			String query = "DELETE FROM bookings WHERE booking_id = ?";
			PreparedStatement psmt = conn.prepareStatement(query);
			psmt.setInt(1, bookingId);
			row = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return row;
	}
}
