package com.luxodrive.model;

public class Booking {

	private int bookingId;
	private String pickupLocation;
	private String dropLocation;
	private String pickupDate;
	private String pickupTime;
	private String returnDate;
	private String drivingOption;
	private double totalAmount;
	private String status;
	private User user;
	private Car car;
	
	public Booking() {
		super();
		
	}

	public Booking(int bookingId, String pickupLocation, String dropLocation, String pickupDate, String pickupTime,
			String returnDate, String drivingOption, double totalAmount, String status, User user, Car car) {
		super();
		this.bookingId = bookingId;
		this.pickupLocation = pickupLocation;
		this.dropLocation = dropLocation;
		this.pickupDate = pickupDate;
		this.pickupTime = pickupTime;
		this.returnDate = returnDate;
		this.drivingOption = drivingOption;
		this.totalAmount = totalAmount;
		this.status = status;
		this.user = user;
		this.car = car;
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

	@Override
	public String toString() {
		return "Booking [bookingId=" + bookingId + ", pickupLocation=" + pickupLocation + ", dropLocation="
				+ dropLocation + ", pickupDate=" + pickupDate + ", pickupTime=" + pickupTime + ", returnDate=" + returnDate
				+ ", drivingOption=" + drivingOption + ", totalAmount=" + totalAmount + ", status=" + status + ", user=" + user + ", car=" + car + "]";
	}
	
}
