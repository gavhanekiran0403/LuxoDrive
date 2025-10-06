package com.luxodrive.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.luxodrive.jdbc.connection.DBConnection;
import com.luxodrive.model.Car;
import com.luxodrive.model.CarOwner;
import com.luxodrive.model.Driver;

public class CarOperation {

	public static List<Car> getAllCars() {

		List<Car> cars = new ArrayList<Car>();
		try (Connection conn = DBConnection.getConnection()) {
			Statement stmt = conn.createStatement();

			ResultSet rs = stmt.executeQuery("SELECT * FROM cars c JOIN carowners o ON c.owner_id = o.owner_id");

			while (rs.next()) {

				List<byte[]> images = new ArrayList<byte[]>();

				images.add(rs.getBytes("image1"));
				images.add(rs.getBytes("image2"));
				images.add(rs.getBytes("image3"));
				images.add(rs.getBytes("image4"));
				
				int ownerId = rs.getInt("owner_id");
						
				CarOwner carOwner = CarOwnerOperation.getCarOwnerById(ownerId);

				Car c = new Car(
						rs.getInt("car_id"), 
						rs.getString("model_name"), 
						rs.getString("car_no"),
						rs.getString("fuel_type"), 
						rs.getInt("seats"), 
						rs.getDouble("rent"),
						rs.getInt("car_year_model"), 
						rs.getString("insurance_no"), 
						rs.getString("features"),
						rs.getString("status"),
						images, 
						carOwner);
				cars.add(c);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return cars;
	}

	public static int addOrUpdateCar(Car car) {
		
		if(car.getCarId() == 0) {
			System.out.println(car.getCarId());
			return addCars(car);
		}else {
			System.out.println(car.getCarId());
			return updateCars(car);
		}
		
	}
	public static int addCars(Car car) {

		int row = 0;
		try (Connection conn = DBConnection.getConnection()) {

			String query = "INSERT INTO cars(model_name,car_no,fuel_type,seats,rent,car_year_model,insurance_no,features,status,image1,image2,image3,image4,owner_id) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement psmt = conn.prepareStatement(query);

			psmt.setString(1, car.getModelName());
			psmt.setString(2, car.getCarNo());
			psmt.setString(3, car.getFuelType());
			psmt.setInt(4, car.getSeats());
			psmt.setDouble(5, car.getRent());
			psmt.setInt(6, car.getCarYearModel());
			psmt.setString(7, car.getInsuranceNo());
			psmt.setString(8, car.getFeatures());
			psmt.setString(9, car.getStatus());
			psmt.setBytes(10, car.getImages().get(0));
			psmt.setBytes(11, car.getImages().get(1));
			psmt.setBytes(12, car.getImages().get(2));
			psmt.setBytes(13, car.getImages().get(3));
			psmt.setInt(14, car.getCarOwner().getOwnerId());
			row = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return row;
	}

	public static Car getCarById(int carId) {

		Car car = null;
		try (Connection conn = DBConnection.getConnection()) {
			String query = "SELECT * FROM cars c JOIN carowners o ON c.owner_id = o.owner_id WHERE c.car_id = ?";
			PreparedStatement psmt = conn.prepareStatement(query);
			psmt.setInt(1, carId);
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {

				List<byte[]> images = new ArrayList<byte[]>();

				images.add(rs.getBytes("image1"));
				images.add(rs.getBytes("image2"));
				images.add(rs.getBytes("image3"));
				images.add(rs.getBytes("image4"));
				
				int ownerId = rs.getInt("owner_id");
				
				CarOwner carOwner = CarOwnerOperation.getCarOwnerById(ownerId);

				car = new Car(rs.getInt("car_id"), rs.getString("model_name"), rs.getString("car_no"),
						rs.getString("fuel_type"), rs.getInt("seats"), rs.getDouble("rent"),
						rs.getInt("car_year_model"), rs.getString("insurance_no"), rs.getString("features"), rs.getString("status"),
						images,carOwner);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return car;
	}

	public static int updateCars(Car car) {

		int row = 0;
		try (Connection conn = DBConnection.getConnection()) {
			
			String query = "UPDATE cars SET model_name = ?, car_no = ?, fuel_type = ?, seats = ?, rent = ?, car_year_model = ?, insurance_no = ?, features =?, status = ?, image1 = ?, image2 = ?, image3 = ?, image4 = ?, owner_id = ? WHERE car_id = ?";
			PreparedStatement psmt = conn.prepareStatement(query);

			psmt.setString(1, car.getModelName());
			psmt.setString(2, car.getCarNo());
			psmt.setString(3, car.getFuelType());
			psmt.setInt(4, car.getSeats());
			psmt.setDouble(5, car.getRent());
			psmt.setInt(6, car.getCarYearModel());
			psmt.setString(7, car.getInsuranceNo());
			psmt.setString(8, car.getFeatures());
			psmt.setString(9, car.getStatus());
			psmt.setBytes(10, car.getImages().get(0));
			psmt.setBytes(11, car.getImages().get(1));
			psmt.setBytes(12, car.getImages().get(2));
			psmt.setBytes(13, car.getImages().get(3));
			psmt.setInt(14, car.getCarOwner().getOwnerId());
			psmt.setInt(15, car.getCarId());

			row = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return row;
	}

	public static int deleteCar(int carId) {
		int row = 0;
		try (Connection conn = DBConnection.getConnection()) {
			String query = "DELETE FROM cars WHERE car_id = ?";
			PreparedStatement psmt = conn.prepareStatement(query);
			psmt.setInt(1, carId);
			row = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return row;
	}
	
	public static List<Car> getCarsByOwnerId(int ownerId) {
		
		List<Car> cars = new ArrayList<Car>();
		try(Connection conn = DBConnection.getConnection()){
			String query = "SELECT * FROM cars WHERE owner_id = ?";
			PreparedStatement psmt = conn.prepareStatement(query);
			psmt.setInt(1, ownerId); 
			ResultSet rs = psmt.executeQuery();

			while(rs.next()) {
				
				List<byte[]> images = new ArrayList<byte[]>();
				images.add(rs.getBytes("image1"));
				
			    Car car = new Car();
			    car.setCarId(rs.getInt("car_id"));
			    car.setModelName(rs.getString("model_name"));
			    car.setCarNo(rs.getString("car_no"));
			    car.setInsuranceNo(rs.getString("insurance_no"));
			    car.setImages(images);
			    
			    cars.add(car);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return cars;
	}
	
	public static int updateCarStatus(int carId, String status) {
		int row = 0;
		try (Connection conn = DBConnection.getConnection()) {
			String query = "UPDATE cars SET status = ? WHERE car_id = ?";
			PreparedStatement psmt = conn.prepareStatement(query);
			psmt.setString(1, status);
			psmt.setInt(2, carId);
			row = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return row;
	}

}
