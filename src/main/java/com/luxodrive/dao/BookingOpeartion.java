package com.luxodrive.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.luxodrive.jdbc.connection.DBConnection;
import com.luxodrive.model.AdminNotification;
import com.luxodrive.model.Booking;
import com.luxodrive.model.Car;
import com.luxodrive.model.Driver;
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
				
				int driverId = rs.getInt("driver_id");
				Driver driver = DriverOperation.getDriverById(driverId);
				
				Booking booking = new Booking(
						rs.getInt("booking_id"), 
						rs.getString("pickup_location"), 
						rs.getString("drop_location"), 
						rs.getString("pickup_date"), 
						rs.getString("pickup_Time"), 
						rs.getString("return_date"), 
						rs.getString("driving_option"),
						rs.getBytes("aadhar_card"),
						rs.getDouble("total_amount"), 
						rs.getString("status"),
						rs.getTimestamp("created_at"),
						user, 
						car,
						driver
						);
				bookings.add(booking);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return bookings;
	}
	
	public static int addBooking(Booking booking) {
		
		int generatedId = 0;
		try(Connection conn = DBConnection.getConnection()){
			String query = "INSERT INTO bookings(pickup_location, drop_location, pickup_date, pickup_Time, return_date, "
					+ "driving_option, aadhar_card, total_amount, status, user_id, car_id) values(?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement psmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
			psmt.setString(1, booking.getPickupLocation());
			psmt.setString(2, booking.getDropLocation());
			psmt.setString(3, booking.getPickupDate());
			psmt.setString(4, booking.getPickupTime());
			psmt.setString(5, booking.getReturnDate());
			psmt.setString(6, booking.getDrivingOption());
			psmt.setBytes(7, booking.getAadharCard());
			psmt.setDouble(8, booking.getTotalAmount());
			psmt.setString(9, booking.getStatus());
			psmt.setInt(10, booking.getUser().getUserId());
			psmt.setInt(11, booking.getCar().getCarId());
			
			int rows = psmt.executeUpdate();

	        if (rows > 0) {
	            try (ResultSet rs = psmt.getGeneratedKeys()) {
	                if (rs.next()) {
	                    generatedId = rs.getInt(1);
	                }
	            }
	        }
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return generatedId;
	}
	
	public static int updateBooking(Booking booking) {
		int row = 0;
		try(Connection conn = DBConnection.getConnection()){
			String query = "UPDATE bookings SET pickup_location = ?, drop_location = ?, pickup_date = ?, pickup_Time = ?, return_date = ?, "
					+ "driving_option = ?, aadhar_card = ?, total_amount = ?, status = ?, user_id = ?, car_id = ? WHERE booking_id = ?";
			PreparedStatement psmt = conn.prepareStatement(query);
			psmt.setString(1, booking.getPickupLocation());
			psmt.setString(2, booking.getDropLocation());
			psmt.setString(3, booking.getPickupDate());
			psmt.setString(4, booking.getPickupTime());
			psmt.setString(5, booking.getReturnDate());
			psmt.setString(6, booking.getDrivingOption());
			psmt.setBytes(7, booking.getAadharCard());
			psmt.setDouble(8, booking.getTotalAmount());
			psmt.setString(9, booking.getStatus());
			psmt.setInt(10, booking.getUser().getUserId());
			psmt.setInt(11, booking.getCar().getCarId());
			psmt.setInt(12, booking.getBookingId());
			
			row = psmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return row;
	}
	
	public static Booking getBookingById(int bookingId){
		
		Booking booking = null;
		
		try(Connection conn = DBConnection.getConnection()){
			String query = "SELECT b.*, u.*, c.* FROM bookings b "
					+ "JOIN users u ON b.user_id = u.user_id "
					+ "JOIN cars c ON b.car_id = c.car_id WHERE booking_id = ?";
			PreparedStatement psmt = conn.prepareStatement(query);
			psmt.setInt(1, bookingId);
			ResultSet rs =  psmt.executeQuery();
			while(rs.next()) {
				
				User user = new User();
				user.setUserId(rs.getInt("user_id"));
	            user.setFullName(rs.getString("full_Name"));
	            user.setPhoneNo(rs.getString("phone_no"));
	            user.setEmail(rs.getString("email"));
	            user.setPassword(rs.getString("password"));
                user.setConfirmPassword(rs.getString("confirmpassword"));
                user.setRole(rs.getString("role"));
                user.setStatus(rs.getString("status"));
                
                List<byte[]> images = new ArrayList<byte[]>();

				images.add(rs.getBytes("image1"));
				images.add(rs.getBytes("image2"));
				images.add(rs.getBytes("image3"));
				images.add(rs.getBytes("image4"));
				
	            Car car = new Car();
	            car.setCarId(rs.getInt("car_id"));
	            car.setModelName(rs.getString("model_name"));
	            car.setCarNo(rs.getString("car_no"));
	            car.setFuelType(rs.getString("fuel_type"));
	            car.setSeats(rs.getInt("seats"));
	            car.setRent(rs.getDouble("rent"));
	            car.setCarYearModel(rs.getInt("car_year_model"));
	            car.setInsuranceNo(rs.getString("insurance_no"));
	            car.setFeatures(rs.getString("features"));
	            car.setStatus(rs.getString("status"));
	            car.setImages(images);
	            
	            int driverId = rs.getInt("driver_id");
				Driver driver = DriverOperation.getDriverById(driverId);
	            			
				booking = new Booking(
						rs.getInt("booking_id"), 
						rs.getString("pickup_location"), 
						rs.getString("drop_location"), 
						rs.getString("pickup_date"), 
						rs.getString("pickup_Time"), 
						rs.getString("return_date"), 
						rs.getString("driving_option"),
						rs.getBytes("aadhar_card"),
						rs.getDouble("total_amount"), 
						rs.getString("status"),
						rs.getTimestamp("created_at"),
						user, 
						car,
						driver
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
	
	public static boolean updateStatus(int bookingId, String status) {
	    String sql = "UPDATE bookings SET status=? WHERE booking_id=?";
	    try (Connection con = DBConnection.getConnection();
	         PreparedStatement psmt = con.prepareStatement(sql)) {
	    	psmt.setString(1, status);
	    	psmt.setInt(2, bookingId);
	    	int updated = psmt.executeUpdate();
	        return updated > 0;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	
	public static List<Booking> getBookingsByUser(int userId) {
	    List<Booking> bookings = new ArrayList<>();

	    try (Connection conn = DBConnection.getConnection()) {
	        String query = "SELECT * FROM bookings WHERE user_id = ?";
	        PreparedStatement psmt = conn.prepareStatement(query);
	        psmt.setInt(1, userId);

	        ResultSet rs = psmt.executeQuery();
	        while (rs.next()) {
	            
	            User user = UserOperation.getUserById(userId);

	            int carId = rs.getInt("car_id");
	            Car car = CarOperation.getCarById(carId);

	            int driverId = rs.getInt("driver_id");
				Driver driver = DriverOperation.getDriverById(driverId);
				
	            Booking booking = new Booking(
	                rs.getInt("booking_id"),
	                rs.getString("pickup_location"),
	                rs.getString("drop_location"),
	                rs.getString("pickup_date"),
	                rs.getString("pickup_time"),
	                rs.getString("return_date"),
	                rs.getString("driving_option"),
	                rs.getBytes("aadhar_card"),
	                rs.getDouble("total_amount"),
	                rs.getString("status"),
	                rs.getTimestamp("created_at"),
	                user,
	                car,
	                driver
	            );
	            bookings.add(booking);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return bookings;
	}
	
	public static List<AdminNotification> getUnreadNotifications() {
	    List<AdminNotification> notifications = new ArrayList<>();
	    String sql = "SELECT * FROM adminnotifications WHERE is_read = FALSE ORDER BY created_at DESC";

	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement pst = conn.prepareStatement(sql)) {

	        ResultSet rs = pst.executeQuery();
	        while (rs.next()) {
	        	
	            AdminNotification adminNotification = new AdminNotification();
	            adminNotification.setNotificationId(rs.getInt("notification_id"));
	            
	            int userId = rs.getInt("user_id");
	        	User user = UserOperation.getUserById(userId);
	            adminNotification.setUser(user);

	            int bookingId = rs.getInt("booking_id");
	            Booking booking = BookingOpeartion.getBookingById(bookingId);
	            adminNotification.setBooking(booking);

	            adminNotification.setMessage(rs.getString("message"));
	            adminNotification.setCreatedAt(rs.getTimestamp("created_at"));
	            adminNotification.setIsRead(rs.getString("is_read"));

	            notifications.add(adminNotification);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return notifications;
	}
	
	public static void markNotificationAsRead(int bookingId) {
	    try(Connection conn = DBConnection.getConnection()) {
	        String sql = "UPDATE adminnotifications SET is_read = TRUE WHERE booking_id = ?";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setInt(1, bookingId);
	        ps.executeUpdate();
	    } catch(Exception e) { e.printStackTrace(); }
	}

	public static Booking getLatestBookingForUser(String userId) {
        Booking booking = null;

        String sql = "SELECT * FROM bookings WHERE user_id = ? ORDER BY created_at DESC LIMIT 1";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement psmt = conn.prepareStatement(sql)) {

        	psmt.setString(1, userId);
        	ResultSet rs = psmt.executeQuery();
            while(rs.next()) {
	        	User user = new User();
				user.setUserId(rs.getInt("user_id"));
	            user.setFullName(rs.getString("full_Name"));
	            user.setPhoneNo(rs.getString("phone_no"));
	            user.setEmail(rs.getString("email"));
	            user.setPassword(rs.getString("password"));
                user.setConfirmPassword(rs.getString("confirmpassword"));
                user.setRole(rs.getString("role"));
                user.setStatus(rs.getString("status"));
                
                List<byte[]> images = new ArrayList<byte[]>();

				images.add(rs.getBytes("image1"));
				images.add(rs.getBytes("image2"));
				images.add(rs.getBytes("image3"));
				images.add(rs.getBytes("image4"));
				
	            Car car = new Car();
	            car.setCarId(rs.getInt("car_id"));
	            car.setModelName(rs.getString("model_name"));
	            car.setCarNo(rs.getString("car_no"));
	            car.setFuelType(rs.getString("fuel_type"));
	            car.setSeats(rs.getInt("seats"));
	            car.setRent(rs.getDouble("rent"));
	            car.setCarYearModel(rs.getInt("car_year_model"));
	            car.setInsuranceNo(rs.getString("insurance_no"));
	            car.setFeatures(rs.getString("features"));
	            car.setStatus(rs.getString("status"));
	            car.setImages(images);
	            
	            int driverId = rs.getInt("driver_id");
				Driver driver = DriverOperation.getDriverById(driverId);
				
				booking = new Booking(
						rs.getInt("booking_id"), 
						rs.getString("pickup_location"), 
						rs.getString("drop_location"), 
						rs.getString("pickup_date"), 
						rs.getString("pickup_Time"), 
						rs.getString("return_date"), 
						rs.getString("driving_option"),
						rs.getBytes("aadhar_card"),
						rs.getDouble("total_amount"), 
						rs.getString("status"),
						rs.getTimestamp("created_at"),
						user, 
						car,
						driver
						);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return booking;
    }
	
	public static boolean addDriverToBooking(int bookingId, int driver) {
	    String sql = "UPDATE bookings SET driver_id=? WHERE booking_id=?";
	    try (Connection con = DBConnection.getConnection()){
	    	PreparedStatement psmt = con.prepareStatement(sql);
	    	psmt.setInt(1, driver);
	    	psmt.setInt(2, bookingId);
	        return psmt.executeUpdate() > 0;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}

}
