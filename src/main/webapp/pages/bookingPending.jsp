<%@page import="com.luxodrive.model.Booking"%>
<%@page import="com.luxodrive.dao.BookingOpeartion"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Booking Pending</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bookingPending.css">
</head>
<body>

<%
    String bookingIdStr = request.getParameter("bookingId");
    Booking booking = null;
    if (bookingIdStr != null && !bookingIdStr.isEmpty()) {
        try {
            int bookingId = Integer.parseInt(bookingIdStr);
            booking = BookingOpeartion.getBookingById(bookingId);
        } catch (NumberFormatException e) {
            out.println("<p>Invalid booking ID.</p>");
        }
    }
%>

<jsp:include page="userNavbar.jsp" />

<div class="pending-container">
	<div class="pending-card">
    	<div class="spinner"></div>
    		<h2>Booking Pending</h2>
    		<p>Your booking is awaiting admin confirmation. <br>
       		Booking ID: <strong><%= booking != null ? booking.getBookingId() : "N/A" %></strong></p>
    		<p>Please check back later. You will be notified once the admin confirms or rejects your booking.</p>
    		<a href="userDashboard.jsp">Go to Home</a>
	</div>
</div>
<jsp:include page="footer.jsp" />

</body>
</html>
