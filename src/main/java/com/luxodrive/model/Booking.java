package com.luxodrive.model;

import java.sql.Timestamp;
import java.util.Arrays;

public class Booking {

	private int bookingId;
	private String pickupLocation;
	private String dropLocation;
	private String pickupDate;
	private String pickupTime;
	private String returnDate;
	private String drivingOption;
	private byte[] aadharCard;
	private double totalAmount;
	private String status;
	private Timestamp createdAt;
	private User user;
	private Car car;
	private Driver driver;
	
	public Booking() {
		super();
		
	}

	public Booking(int bookingId, String pickupLocation, String dropLocation, String pickupDate, String pickupTime,
			String returnDate, String drivingOption, byte[] aadharCard, double totalAmount, String status,
			Timestamp createdAt, User user, Car car, Driver driver) {
		super();
		this.bookingId = bookingId;
		this.pickupLocation = pickupLocation;
		this.dropLocation = dropLocation;
		this.pickupDate = pickupDate;
		this.pickupTime = pickupTime;
		this.returnDate = returnDate;
		this.drivingOption = drivingOption;
		this.aadharCard = aadharCard;
		this.totalAmount = totalAmount;
		this.status = status;
		this.createdAt = createdAt;
		this.user = user;
		this.car = car;
		this.driver = driver;
	}

	public int getBookingId() {
		return bookingId;
	}

	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}

	public String getPickupLocation() {
		return pickupLocation;
	}

	public void setPickupLocation(String pickupLocation) {
		this.pickupLocation = pickupLocation;
	}

	public String getDropLocation() {
		return dropLocation;
	}

	public void setDropLocation(String dropLocation) {
		this.dropLocation = dropLocation;
	}

	public String getPickupDate() {
		return pickupDate;
	}

	public void setPickupDate(String pickupDate) {
		this.pickupDate = pickupDate;
	}

	public String getPickupTime() {
		return pickupTime;
	}

	public void setPickupTime(String pickupTime) {
		this.pickupTime = pickupTime;
	}

	public String getReturnDate() {
		return returnDate;
	}

	public void setReturnDate(String returnDate) {
		this.returnDate = returnDate;
	}

	public String getDrivingOption() {
		return drivingOption;
	}

	public void setDrivingOption(String drivingOption) {
		this.drivingOption = drivingOption;
	}

	public byte[] getAadharCard() {
		return aadharCard;
	}

	public void setAadharCard(byte[] aadharCard) {
		this.aadharCard = aadharCard;
	}

	public double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Car getCar() {
		return car;
	}

	public void setCar(Car car) {
		this.car = car;
	}

	public Driver getDriver() {
		return driver;
	}

	public void setDriver(Driver driver) {
		this.driver = driver;
	}

	@Override
	public String toString() {
		return "Booking [bookingId=" + bookingId + ", pickupLocation=" + pickupLocation + ", dropLocation="
				+ dropLocation + ", pickupDate=" + pickupDate + ", pickupTime=" + pickupTime + ", returnDate="
				+ returnDate + ", drivingOption=" + drivingOption + ", aadharCard=" + Arrays.toString(aadharCard)
				+ ", totalAmount=" + totalAmount + ", status=" + status + ", createdAt=" + createdAt + ", user=" + user
				+ ", car=" + car + ", driver=" + driver + "]";
	}

	
}
