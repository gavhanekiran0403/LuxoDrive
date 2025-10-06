<%@page import="com.luxodrive.dao.BookingOpeartion"%>
<%@page import="java.time.Duration"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="com.luxodrive.model.Booking"%>
<%@page import="com.luxodrive.model.User"%>
<%@page import="java.util.List"%>
<%@page import="com.luxodrive.model.AdminNotification"%>
<%@page import="com.luxodrive.dao.AdminNotificationOperation"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<jsp:include page="userNavbar.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booking Notifications</title>
<link rel="stylesheet" href="../css/userNotification.css">
</head>
<body>

<%
User user = (User) session.getAttribute("loggedUser");
if (user != null) {
    int userId = user.getUserId();
    List<AdminNotification> notifications = AdminNotificationOperation.getLatestNotificationsByUserId(userId);

    // Expire pending bookings older than 24 hours
    if (notifications != null) {
        for (AdminNotification notification : notifications) {
            Booking booking = notification.getBooking();
            
            if (booking != null && "pending".equalsIgnoreCase(booking.getStatus()) || "confirmed".equalsIgnoreCase(booking.getStatus())) {
                LocalDateTime createdTime = null;
                if (booking.getCreatedAt() != null) {
                    createdTime = booking.getCreatedAt().toLocalDateTime();
                } else if (notification.getCreatedAt() != null) {
                    createdTime = notification.getCreatedAt().toLocalDateTime();
                }

                if (createdTime != null) {
                    LocalDateTime now = LocalDateTime.now();
                    Duration duration = Duration.between(createdTime, now);

                    if (duration.toHours() >= 15) {
                        booking.setStatus("expired");
                        BookingOpeartion.updateStatus(booking.getBookingId(), "expired");

                        notification.setBooking(booking);
                    }
                }
            }
        }
    }

    request.setAttribute("notifications", notifications);
}
%>

<div class="notify-container">
    <c:choose>
        <c:when test="${not empty notifications}">
            <c:forEach var="notification" items="${notifications}">
                <div class="notify-card">
                    <h2>Booking Notification</h2>
                    <p>
                        Booking ID: <strong>${notification.booking.bookingId}</strong>
                    </p>
                    <p>Car: ${notification.booking.car.modelName} (${notification.booking.car.carNo})</p>
                    <p>Pickup: ${notification.booking.pickupLocation} → ${notification.booking.dropLocation}</p>
                    <p>Pickup Date: ${notification.booking.pickupDate} | Time: ${notification.booking.pickupTime}</p>

                    <c:choose>
                        <c:when test="${notification.booking.status eq 'confirmed'}">
                            <div class="status confirmed">Booking Confirmed</div>
                            <p>Your booking has been confirmed by the admin.</p>
                            <a href="proceedToPay.jsp?bookingId=${notification.booking.bookingId}" class="button btn-pay">Pay Now</a>
                            <a href="bookingCancel.jsp?bookingId=${notification.booking.bookingId}" class="button btn-cancel">Booking Cancel</a>
                        </c:when>

                        <c:when test="${notification.booking.status eq 'cancelled'}">
                            <div class="status rejected">Booking Rejected</div>
                            <p>Sorry! Your booking has been rejected by the admin.</p>
                            <a href="userDashboard.jsp" class="button btn-home">Back to Home</a>
                        </c:when>

                        <c:when test="${notification.booking.status eq 'pending'}">
                            <div class="status pending">Booking Pending</div>
                            <p>Your booking is awaiting admin confirmation. Please check back later.</p>
                            <a href="bookingCancel.jsp?bookingId=${notification.booking.bookingId}" class="button btn-cancel">Booking Cancel</a>
                        </c:when>

                        <c:when test="${notification.booking.status eq 'expired'}">
                            <div class="status expired">Booking Expired</div>
                            <p>No response from admin within 24 hours. Your booking has expired.</p>
                            <a href="home.jsp" class="button btn-home">Back to Home</a>
                        </c:when>

                        <c:otherwise>
                            <div class="status unknown">Unknown Status</div>
                            <p>Please contact support for more information.</p>
                        </c:otherwise>
                    </c:choose>
                </div>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <p>No booking notifications available.</p>
        </c:otherwise>
    </c:choose>
</div>

</body>
</html>
