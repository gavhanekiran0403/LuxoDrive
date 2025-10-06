package com.luxodrive.model;

import java.sql.Timestamp;

public class AdminNotification {

    private int notificationId;
    private String message;
    private String isRead; 
    private Timestamp createdAt;
    private User user;
    private Booking booking;
    
	public AdminNotification() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public AdminNotification(int notificationId, String message, String isRead, Timestamp createdAt, User user,
			Booking booking) {
		super();
		this.notificationId = notificationId;
		this.message = message;
		this.isRead = isRead;
		this.createdAt = createdAt;
		this.user = user;
		this.booking = booking;
	}

	public int getNotificationId() {
		return notificationId;
	}

	public void setNotificationId(int notificationId) {
		this.notificationId = notificationId;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getIsRead() {
		return isRead;
	}

	public void setIsRead(String isRead) {
		this.isRead = isRead;
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

	public Booking getBooking() {
		return booking;
	}

	public void setBooking(Booking booking) {
		this.booking = booking;
	}

	@Override
	public String toString() {
		return "AdminNotification [notificationId=" + notificationId + ", message=" + message + ", isRead=" + isRead
				+ ", createdAt=" + createdAt + ", user=" + user + ", booking=" + booking + "]";
	}

    
}
