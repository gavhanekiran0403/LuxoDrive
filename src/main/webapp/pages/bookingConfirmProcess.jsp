<%@page import="com.luxodrive.dao.CarOperation"%>
<%@page import="com.luxodrive.dao.DriverOperation"%>
<%@page import="com.luxodrive.dao.BookingOpeartion"%>
<%@page import="com.luxodrive.model.Booking"%>
<%@page import="com.luxodrive.model.AdminNotification"%>
<%@page import="com.luxodrive.dao.AdminNotificationOperation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String bookingIdStr = request.getParameter("bookingId");
	String driverIdStr = request.getParameter("driverId");
	int driverId = driverIdStr != null ? Integer.parseInt(driverIdStr) : 0;
    if (bookingIdStr != null && !bookingIdStr.isEmpty()) {
        try {
            int bookingId = Integer.parseInt(bookingIdStr);
            boolean status = BookingOpeartion.updateStatus(bookingId, "confirmed");
			
            if (status) {
                Booking booking = BookingOpeartion.getBookingById(bookingId);
                CarOperation.updateCarStatus(booking.getCar().getCarId(), "Unavailable");
                if("With-Driver".equalsIgnoreCase(booking.getDrivingOption())){
                	BookingOpeartion.addDriverToBooking(bookingId, driverId);
                	DriverOperation.updateDriverStatus(driverId, "Unavailable");
                }
                response.sendRedirect("adminNotifications.jsp");
            } else {
                out.println("<p>Failed to confirm booking.</p>");
            }
        } catch (NumberFormatException e) {
            out.println("<p>Invalid booking ID.</p>");
        }
    } else {
        out.println("<p>Booking ID not provided.</p>");
    }
%>
