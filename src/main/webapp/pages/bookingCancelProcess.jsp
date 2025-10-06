<%@page import="com.luxodrive.dao.BookingOpeartion"%>
<%@page import="com.luxodrive.model.Booking"%>
<%@page import="com.luxodrive.model.AdminNotification"%>
<%@page import="com.luxodrive.dao.AdminNotificationOperation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String bookingIdStr = request.getParameter("bookingId");
    if (bookingIdStr != null && !bookingIdStr.isEmpty()) {
        try {
            int bookingId = Integer.parseInt(bookingIdStr);
            boolean status = BookingOpeartion.updateStatus(bookingId, "cancelled");

            if (status) {
                /* // Insert AdminNotification for the user
                Booking booking = BookingOpeartion.getBookingById(bookingId);
                if (booking != null) {
                    AdminNotification notification = new AdminNotification();
                    notification.setBooking(booking);
                    notification.setUser(booking.getUser());
                    notification.setMessage("Your booking #" + bookingId + " has been rejected!");
                    AdminNotificationOperation.addNotification(notification);
                } */

                response.sendRedirect("adminNotifications.jsp");
            } else {
                out.println("<p>Failed to cancel booking.</p>");
            }
        } catch (NumberFormatException e) {
            out.println("<p>Invalid booking ID.</p>");
        }
    } else {
        out.println("<p>Booking ID not provided.</p>");
    }
%>
