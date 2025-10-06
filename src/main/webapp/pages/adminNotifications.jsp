<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="com.luxodrive.model.AdminNotification"%>
<%@page import="com.luxodrive.dao.BookingOpeartion"%>
<%@page import="com.luxodrive.model.Booking"%>
<%@page import="java.util.List"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard - Notifications</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/notification.css">
</head>
<body>

<%
    List<AdminNotification> notifications = BookingOpeartion.getUnreadNotifications();
    request.setAttribute("notifications", notifications);
    
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd MMM yyyy, HH:mm");
%>

<jsp:include page="adminNavbar.jsp" />

<h2 style="text-align:center; margin:100px 0px 20px 0px;">Booking Notifications</h2>

<c:choose>
    <c:when test="${not empty notifications}">
        <c:forEach var="notification" items="${notifications}">
            <div class="notif-container">
                <div class="notif-msg">
                    <b>${notification.message}</b>
                    <small>${notification.createdAt}</small>
                    <div class="notif-btn">
                        <a href="viewBookings.jsp?bookingId=${notification.booking.bookingId}">View Details</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </c:when>
    <c:otherwise>
        <p style="text-align:center;">No new notifications.</p>
    </c:otherwise>
</c:choose>

</body>
</html>
