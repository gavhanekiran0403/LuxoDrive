<%@page import="com.luxodrive.dao.DriverOperation"%>
<%@page import="com.luxodrive.dao.CarOperation"%>
<%@page import="com.luxodrive.model.Booking"%>
<%@page import="com.luxodrive.dao.BookingOpeartion"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booking Cancel From User</title>
</head>
<body>
<%
	String bookingIdStr = request.getParameter("bookingId");
	if(bookingIdStr != null && !bookingIdStr.isEmpty()){
		int bookingId = Integer.parseInt(bookingIdStr);
		boolean status = BookingOpeartion.updateStatus(bookingId, "cancelled");
		if(status){
			Booking booking = BookingOpeartion.getBookingById(bookingId);
            CarOperation.updateCarStatus(booking.getCar().getCarId(), "Available");
            if("With-Driver".equalsIgnoreCase(booking.getDrivingOption())){
            	BookingOpeartion.addDriverToBooking(bookingId, booking.getDriver().getDriverId());
            	DriverOperation.updateDriverStatus(booking.getDriver().getDriverId(), "Available");
            }

			response.sendRedirect("userNotification.jsp");
		}
	}
%>
</body>
</html>